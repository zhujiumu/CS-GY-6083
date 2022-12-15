import pandas as pd
import psycopg2
import streamlit as st
from configparser import ConfigParser

"# Database System for Alibaba E-commerce Public Dataset"

@st.cache
def get_config(filename="database.ini", section="postgresql"):
    parser = ConfigParser()
    parser.read(filename)
    return {k: v for k, v in parser.items(section)}


@st.cache
def initiate_db():
    db_info = get_config()
    conn = psycopg2.connect(**db_info)
    cur = conn.cursor()

    with open('schema.sql', 'r') as file:
        schema_sql = file.read()
    cur.execute(schema_sql)

    conn.commit()
    cur.close()
    conn.close()

@st.cache
def query_db(sql: str):
    db_info = get_config()

    # Connect to an existing database
    conn = psycopg2.connect(**db_info)

    # Open a cursor to perform database operations
    cur = conn.cursor()

    # Execute a command: this creates a new table
    cur.execute(sql)
    # Obtain data
    data = cur.fetchall()
    column_names = [desc[0] for desc in cur.description]

    # Make the changes to the database persistent
    conn.commit()

    # Close communication with the database
    cur.close()
    conn.close()

    df = pd.DataFrame(data=data, columns=column_names)
    return df


sql_all_table_names = "SELECT relname FROM pg_class WHERE relkind='r' AND relname !~ '^(pg_|sql_)';"
all_table_names = query_db(sql_all_table_names)["relname"].tolist()
if len(all_table_names)==0:
    initiate_db()
    all_table_names = query_db(sql_all_table_names)["relname"].tolist()



"## Read Tables from Original Data"
table_name = st.selectbox("Choose a table to display its contents", all_table_names)
# all_table_names
# f"Display the table"
sql_table = f"SELECT * FROM {table_name};"
try:
    df = query_db(sql_table)
    st.dataframe(df)
except:
    st.write(
        "Sorry! Something went wrong with your query, please try again."
    )


"## SQL Playground"

# Initialize table information
category = ['category_id', 'category_name']
product_belong = ['product_id', 'product_name', 'description', 'category_id']
vendor = ['vendor_id', 'vendor_name', 'vendor_phone', 'vender_email']
product_sold_vendor = ['vendor_id', 'product_id']
carts_has_products_options = ['shopping_cart_id', 'product_id', 'option_id', 'quantity']
options_associated_with = ['option_id', 'option_name', 'product_id', 'quantity', 'price', 'on_sale', 'specs']
orders = ['order_id', 'total_item', 'shipping_fee', 'tax', 'total_cost', 'order_date', 'delivery_date',
          'ship_name', 'ship_address', 'tracking_number', 'delivery_status']
order_has_product = ['order_id', 'product_id', 'option_id', 'quantity']
orders_placed_user = ['user_id', 'order_id']
users = ['user_id', 'username', 'password', 'full_name', 'address', 'email', 'phone']
user_has_creditcard = ['credit_card_number', 'user_id']
orders_paid_creditcard = ['order_id', 'credit_card_number', 'user_id']

# Code input block
with st.form(key='query_form'):
    raw_code = st.text_area("SQL Code Here", height=200)
    submit_code = st.form_submit_button("Execute")

# Table of Info
with st.expander("Table Info"):
    table_info = {'category':category, 'product_belong':product_belong, 'vendor':vendor, 'product_sold_vendor':product_sold_vendor,
                  'carts_has_products_options':carts_has_products_options, 'options_associated_with':options_associated_with,
                  'orders':orders, 'order_has_product':order_has_product, 'orders_placed_user':orders_placed_user,
                  'users':users, 'user_has_creditcard':user_has_creditcard, 'orders_paid_creditcard':orders_paid_creditcard}
    st.json(table_info)

# Results Layouts
if submit_code:
    st.info("Query Submitted")
    st.code(raw_code)

    # Results
    query_results = query_db(raw_code)
    # with st.expander("Results"):
    #     st.write(query_results)

    # with st.expander("Results"):
    #     query_df = pd.DataFrame(query_results)
    #     st.dataframe(query_df)
    "#### Results"
    query_df = pd.DataFrame(query_results)
    st.dataframe(query_df)

    
"## Order History by Customers"
st.write("The table below provide historical order details specific to a customer, please select which customer you would like further details on:")
sql_customer_names = "SELECT full_name FROM Users;"
customer_names = query_db(sql_customer_names)["full_name"].tolist()
customer_name = st.selectbox("Choose a customer", customer_names)
if customer_name:
    sql_customer = f"""select u.full_name customer, o3.option_name product_option, o3.product_id product_id, o2.quantity quantity, o3.price price, o2.quantity * o3.price total_cost 
    from orders_placed_user o, order_has_product o2, users u, options_associated_with o3 
    where o.user_id = u.user_id 
    and o2.order_id = o.order_id 
    and o3.product_id = o2.product_id 
    and u.full_name = '{customer_name}';"""

    customer_info = query_db(sql_customer)
    st.dataframe(customer_info)
    

"## Platform Sales Ordered by Date"
st.write("Platforms often take commission as a percentage of the total sales conducted on the platform. The table below provides a breakdown of all historical transactions ordered by date:")
platform_sales_sql = """
with summary as (
    select o1.order_date, u.full_name customer, o3.option_name product_option, o3.product_id product_id, o2.quantity quantity, o3.price price, o2.quantity * o3.price total_cost
    from orders_placed_user o, orders o1, order_has_product o2, users u, options_associated_with o3
    where o.user_id = u.user_id
    and o1.order_id = o2.order_id
    and o2.order_id = o.order_id
    and o3.product_id = o2.product_id
)

select order_date date, sum(total_cost) revenue from summary
group by order_date
order by date
"""
platform_sales = query_db(platform_sales_sql)
st.dataframe(platform_sales)


"## Vendor Sales Ordered by Date"
st.write("Figures above can be further broken down by vendor, please select a vendor to view their historical sales ordered by date:")
sql_vendor_names = "SELECT vendor_name FROM Vendor;"
vendor_names = query_db(sql_vendor_names)["vendor_name"].tolist()
vendor_name = st.selectbox("Choose a vendor", vendor_names)

if customer_name:
    vendor_sales_sql = f"""
    -- vendor sales broken down by revenue
    with vendor_info as (
        select * 
        from vendor join product_sold_vendor 
        on vendor.vendor_id = product_sold_vendor.vendor_id
    ), 
    summary as (
        select o1.order_date, u.full_name customer, o3.option_name product_option, o3.product_id product_id, o2.quantity quantity, o3.price price, o2.quantity * o3.price total_cost
        from orders_placed_user o, orders o1, order_has_product o2, users u, options_associated_with o3
        where o.user_id = u.user_id
        and o1.order_id = o2.order_id
        and o2.order_id = o.order_id
        and o3.product_id = o2.product_id
    )

    select vendor_name, order_date, sum(total_cost) revenue
    from summary join vendor_info 
    on summary.product_id = vendor_info.product_id
    where vendor_name = '{vendor_name}'
    group by vendor_name, order_date
    order by order_date
    """

    vendor_info = query_db(vendor_sales_sql)
    st.dataframe(vendor_info)



"## Delivery Tracker"
st.write("""
Costs associatd with losing a current customer always outweighs the benefit of acquiring a new one. 
Among the customers, the delivery status of those who have made more than one purchase are display below:
""")
delivery_tracker_sql = """
with repeating_customers as (
    select ship_name customer from orders
    group by customer
    having count(*) > 1
)
select order_id, ship_name as customer, order_date, tracking_number
from orders
where delivery_status = cast(0 as bit)
and ship_name in (select * from repeating_customers)
"""
delivery_tracker = query_db(delivery_tracker_sql)
st.dataframe(delivery_tracker)



"## Recurring Purchases"
st.write("""
E-commerce platforms such as Amazon may utilize information on which products are repeatedly bought. 
Amazon introduced 'subscript and save' in 2007, which generated expectations of customer pre-orders which may translate to stable cash flows for vendors in exchange for discounts for the consumers. 
The table below provides details on recurring purchases broken down by customers and product:
""")
st.write("Items are are rebought by the same customer where the initial count is lowerer than the later purchases to show that they may have a good quality and are of high demand")
recurring_purchases_sql = """
with summary as (
    select o1.order_id, o1.order_date, o1.ship_name, oo1.product_id, oo1.option_id, oo1.quantity, o1.delivery_status from orders o1 join order_has_product oo1
    on o1.order_id = oo1.order_id
), return_customers as (
    select s1.order_id, s1.order_date, s1.ship_name, s1.product_id, s1.option_id, s1.quantity, s2.delivery_status
    from summary s1 join summary s2 
    on s1.ship_name = s2.ship_name
    and s1.option_id = s2.option_id
    where s1.order_id <> s2.order_id
    and s1.order_date < s2.order_date
)
select r.ship_name customer, o.option_name
from return_customers r join options_associated_with o on r.option_id = o.option_id
"""
recurring_purchases = query_db(recurring_purchases_sql)
st.dataframe(recurring_purchases)



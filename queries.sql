-- breakdown into customers details
select u.full_name customer, o3.option_name product_option, o3.product_id product_id, o2.quantity quantity, o3.price price, o2.quantity * o3.price total_cost
from orders_placed_user o, order_has_product o2, users u, options_associated_with o3
where o.user_id = u.user_id
and o2.order_id = o.order_id
and o3.product_id = o2.product_id
--and full_name = {purchaser}

-- platform sales
with summary as (
    select o1.order_date, u.full_name customer, o3.option_name product_option, o3.product_id product_id, o2.quantity quantity, o3.price price, o2.quantity * o3.price total_cost
    from orders_placed_user o, orders o1, order_has_product o2, users u, options_associated_with o3
    where o.user_id = u.user_id
    and o1.order_id = o2.order_id
    and o2.order_id = o.order_id
    and o3.product_id = o2.product_id
)

select order_date date, sum(total_cost) revenu from summary
group by order_date
order by date

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

select vendor_name, order_date, sum(total_cost) 
from summary join vendor_info 
on summary.product_id = vendor_info.product_id
group by vendor_name, order_date
order by order_date

-- regular customers delivery status(not yet delivered)
with repeating_customers as (
    select ship_name customer from orders
    group by customer
    having count(*) > 1
)
select order_id, ship_name as customer, order_date, tracking_number
from orders
where delivery_status = cast(0 as bit)
and ship_name in (select * from repeating_customers)


-- Items are are rebought by the same customer where the initial count is lowerer than the later purchases to show that they may have a good quality and are of high demand
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



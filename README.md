# Alibaba E-Commerce Database System with Streamlit Interface (CS-GY6083 Final Project)
This is the final project for CS-GY 6083 Database Systems at NYU Tandon 2022 Fall. The team memebers are 
- Jiumu Zhu 
- Boyuan Chen (bc3194@nyu.edu)

The dataset we used is downloaded from Kaggle: E-commerce Public Dataset by Alibaba 
(https://www.kaggle.com/datasets/AppleEcomerceInfo/ecommerce-information)
The original data files in .txt format are saved in orig folder. 

### ER Diagram:
We drew the ER diagram in ER_Diagram.pdf. 

### Instructions on Running:
To run the project, please first create a virtual enviroment and install the libraries in requirements.txt. 

In your psql environment, run `CREATE DATABASE alibaba_ecommerce;` 
to create a database. 

Then, in the top directory
create `database.ini` in the following format:\
```host=localhost\
port=5432\
dbname = alibaba_ecommerce\
user = [your_psql_username]\
password = [your_psql_password]
```

### TODO:
-  Record video

### Done:
- Data loading is done via insert statement in schema.sql
- ER diagram is revised to fit the schema.sql
- For business insights, the queries are included in the main.py, I have 5 queries so far and touched on 'group' and 'having' clause
- SQL playground
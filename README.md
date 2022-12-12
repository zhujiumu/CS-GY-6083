# 6083
This is the final project for CS-GY 6083 Database Systems at NYU Tandon 2022 Fall. The team memebers are 
- Jiumu Zhu 
- Boyuan Chen (boyuan.chen@nyu.edu)

The dataset we used is downloaded from Kaggle: E-commerce Public Dataset by Alibaba 
(https://www.kaggle.com/datasets/AppleEcomerceInfo/ecommerce-information)
The original data files in .txt format are saved in orig folder. 

We drew the ER diagram in ER_Diagram.pdf. 

To run the project, please first create a virtual enviroment and install the libraries in requirements.txt. 

In your psql environment, run CREATE DATABASE alibaba_ecommerce; to create a database. Then, in the top directory
create database.ini in the following format:

host=localhost\
port=5432\
dbname = alibaba_ecommerce\
user = [your_psql_username]\
password = [your_psql_password]

### TODO:
- I couldn't find a case where recursive sql would be used, if you can a good use of a recursive statement, feel free to replace/add to the existing queries
- Look into a data loading & sql playground implemented as part of the frontend
- Record video

### Done:
- Data loading is done via insert statement in schema.sql
- ER diagram is revised to fit the schema.sql
- For business insights, the queries are included in the main.py, I have 5 queries so far and touched on 'group' and 'having' clause

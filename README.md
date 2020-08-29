
# Project Name: ETL_UFC Project Member: Dan, Kenjiro

1. Data source

* UFC match data:
up to 8 Jun 2019
https://www.kaggle.com/rajeevw/ufcdata?select=data.csv

* after 8 June 2019 to 25 August 2020
http://www.ufcstats.com/statistics/events/completed?page=all

* UFC fighter data:
https://www.kaggle.com/rajeevw/ufcdata?select=raw_fighter_details.csv

2. Data extract method

* For CSV file: Use Pandas to read CSV
* For web-page : Use Splinter and Beautiful soup. Get all URL info from the webpage and in each page, identify winner and loser, and weight_class. When getting the information, get data type alignment with fight table so that in future we could insert data into the table. 


3. Transform

#### match data
* Winner is given by color. 
=> Identify winner and loser name and store them in pandas dataframe.
 
 If color is blue, put blue fighter name into winner, and red fighter name into loser. (for loop)

* Some fights have no winner/loser 
=> Drop those draw or no-winner fights

Using df loc to drop the data of no winner.

* Insert data scraped from web into csv based df.

Using pd.concat to insert data from web into csv based data. 

* In the scheme, winner_fighter_id, loser_fighter_id would be a foreign key to refer to fighter table. To get id, merge match data df with fighter_table to conver actual name into fighter_id. 

* Make alignment of column name with DB table 





#### fighter info table
* Weight and Height info is given in American Unit.
=> Converted them into cm / kg

The data was given like 5' 6". Split the string of feet/inch value and identified 5 and 6. Using this two value calcuate, cm. kg is more simple, just remove lbs and calculate kg.



* Choose only required columne
=> fighter_name	height	weight were saved in pandas dataframe to make alignment of column name with DB table.


4. Load

* To Postgres

a. SQL create table as described in 5

b. Use SQLalchemy to create engine and upload df transformed in 3.

c. Confirm the data is uploaded correctly.

* to SQLite

a. Create Base and class for tables.

b. Use SQLalchemy to create engine and upload df transformed in 3.

c. Confirm the data is uploaded correctly.


5. Data Scheme

Using a tool https://app.quickdatabasediagrams.com/#/d/QgHyfc

* match table

-
id int PK
date date
location varchar
weight_class varcahr
winner_fighter_id int FK >- fighter.id
loser_fighter_id int FK >- fighter.id



* fighter table
-
id int PK
name varchar
height float
weight float




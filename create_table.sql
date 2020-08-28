create table match_table(

id int primary key,
date date,
location varchar,
weight_class varchar,
winner varchar,
loser varchar

);

create table match_new_table(

id int primary key,
date date,
location varchar,
weight_class varchar,
winner varchar,
loser varchar

);


create table fighter_table(
id int primary key,
fighter_name varchar,
height numeric,
weight numeric
);
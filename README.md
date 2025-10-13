# Databases (Codecademy)

A repository of code and notes taken while studying databases in Codecademy.

## The Relational Database Management System (RDBMS)

- Allows you to create, update, and administer a relational database. 
- Most RDBMSs use SQL to access the database. 

A **database** is a set of data stored in a computer,
usually structured in a way that makes the data easily accessible.

A **relational database** is a type of database that allows for identification and access of data
*in relation to* other data in the database.
- Data in a relational database is often organised into **tables**. 
- The rows in a table are often called **records**.
- The columns in a table have a descriptive **header** and a specific **data type**.

**SQL** is a programming language used to communicate with data stored in an RDBMS. 
- The syntax differs depending on the RDBMS you're using.

Popular RDBMSs:

- MySQL
- PostgreSQL
- OracleDB
- SQLServer
- SQLite

If your file ends in `.sqlite`, you're working with SQLite.

If your file ends in `.sql`, you're working with PostgreSQL. 

SQLite and PostgreSQL have different data types:

- To store text in SQLite, you'll use the `TEXT` data type.
- To store text in PostgreSQL, you'll have multiple options,
including `varchar(n)`, `char(n)`, or `text`.
There are subtle differences between these options.

Relational databases are typically ACID compliant, ensuring high integrity of data. 

## NoSQL

Stands for 'Not-only-SQL', 'Non-relational SQL', or 'Non-SQL'. 

Any database technology that stores data differently to relational databases. 

Used when a more flexible and/or more scalable database solution is required than SQL.

Designed with scalability as a priority. 

Doesn't require a **schema**, unlike SQL.
This enables it to deal with unstructured or semi-structured data in different formats.

Requires less organisation, therefore developers can concentrate on simply
**using** the data rather than additionally figuring out how to store it.

Usually sacrifices integrity for increased availability and distribution of data,
BUT some NoSQL databases do offer ACID compliance.

No standard language for NoSQL. 
While some NoSQL databases use query languages similar to SQL, most don't.
Typically, each database uses a different language to set up, manage, and query data.

### Types of NoSQL databases:

#### Key-value database

Organises individual records as key-value pairs. 

Keys must be unique.

Here, we're prioritising fast queries over fancy features. 

Popular options: Redis and Amazon DynamoDB.

#### Document based (or document-oriented) database

Consists of data stored in hierarchical structures.

Some supported document formats: JSON, BSON, XML, YAML. 

Considered an extension of the key-value database. 

Popular option: MongoDB. 

#### Graph database

Data is stored in vertices (nodes) and establishes relationships via edges (links or lines). 

Much simpler to set up manage, and query, than relational databases. 

Popular option: Neo4j.

#### Column-oriented database

Stores data in columns instead of rows:

![Column-oriented database](https://static-assets.codecademy.com/Courses/Backend-Backfill/ART1440-column-oriented.svg)

Popular option: Amazon Redshift.

## SQL

`SELECT` - Retrieves data from a database. 

`*` (asterisk operator) - used with `SELECT` to specify **all columns**. 

`FROM` - Specifies where to get the data *from*: which tables we're querying.

`CREATE` - Defines a new database object. 

What is a **clause**?

`TABLE` - Keyword used for defining, altering, or referencing tables:

- `CREATE TABLE` - Creates a table. 
- `ALTER TABLE` - Modifies an existing table. 
- `DROP TABLE` - Deletes a table. 

Create a new table named `cards`, with three attributes (headers): `id`, `name`, and `attribute`.
```
CREATE TABLE cards (
   id INTEGER, 
   name TEXT, 
   attribute INTEGER
);
```

`INSERT INTO table` - Inserts a new row into a table.

`INTO` - Used with other keywords:

- `SELECT... ...INTO` - Copies data from table(s) into a new table. 

- `INSERT INTO` - Add data to existing table. 

`VALUES` - Used with other keywords:

- `INSERT INTO... ...VALUES` - Add data to a table.

`ALTER` - Used with other keywords:

- `ALTER TABLE tableName` - Modifies an existing table
- `ALTER DATABASE` - Changes database-level settings
- `ALTER SCHEMA` - Rename or transfer objects between schemas
- `ALTER VIEW` - Modify or recompile a view.

`ADD` - Used primarily with `ALTER TABLE`
to add new columns or constraints to an existing table.

`NULL` - Special value in SQL that represents missing or unknown data.

`UPDATE tableName` - Edits a row in a table. 

`UPDATE tableName
SET columnName(s)` - Indicates the column that is to be edited during the `UPDATE`.

`UPDATE tableName
SET columnName(s)
WHERE...` - Indicates which rows to update with the new column value.

`DELETE FROM` - Deletes one or more rows from a table.

```
DELETE FROM cards 
WHERE name IS NULL;
```

The above statement deletes all records in the cards table that have no name.

`IS NULL` - Special SQL condition: returns `true` when a value is `NULL`,
otherwise returns `false`. 

### Constraints

- `PRIMARY KEY` - Used to uniquely identify each record in a table. Ensures
that the column, or combination of columns, contains **unique, non-null values**.
- `UNIQUE` - Used to ensure that all values in a column (or combination of columns)
are unique: that there is a different value for every row. 
- `NOT NULL` - Ensures that a field **must contain a value**,
and that it **cannot remain empty**.
- `DEFAULT` - Used to assign a preset, default value to a column
when no value is provided during an `INSERT` operation. 

## Working with databases

What is a database query?

What is a general query?

What is an aggregate function?

How do you work with multiple tables in a database (at the same time?)

How do we select multiple columns using the SELECT keyword? 

`AS` - Allows you to rename a column or table using an alias. 

When using aliases in SQLite, surround them with `'singleQuotes'`.

When using aliases in PostgreSQL or other RDBMSs, `noQuotes` or `''doubleQuotes''`
may be required, depending on the language.

`DISTINCT` - Used to return unique values in the output by filtering out duplicate values.
Helpful when we want to know which distinct values exist in a particular column.

`SELECT DISTINCT cards FROM deck` - Returns only unique cards, ignoring duplicates.
Useful when you have a TCG deck and want to find out how many unique cards
there are in the deck. 

`WHERE` - Restricts query results in order to obtain only the information we want.
- Typically followed by a boolean expression, such as `level > 5`.
This particular expression will filter results to only include cards
with a level greater than 5.4

`LIKE` - Used with the `WHERE` clause to search for a specific pattern in a column.

`_` - A wildcard character that represents exactly one character.

`SELECT * FROM movies WHERE name LIKE 'Fant_stic'` -
Searches for all movies starting with `Fant` and ending with `stic`
with exactly one character in the middle.

`%` - A wildcard character that represents zero or more characters.
- Can be used before and/or after a pattern.

`SELECT * 
FROM movies
WHERE name LIKE 'Avengers%';
` - Filters the results set to only include movies that begin with the word `Avengers`.

`SELECT * FROM cards WHERE effect LIKE '&spell counter&'` - 
Filters the results set to only include cards with 'spell counter'
in the effect text. Not case sensitive, so 'Spell Counter' and 'Spell counter'
also work.

`SELECT * FROM cards WHERE level IS NULL` -
Filters results for all items where `level` is a null value.
- In a set of YGO cards, this would return all cards without a Level:
Spell cards, Trap cards, Xyz monsters, and Link monsters.

`BETWEEN` - Used in a `WHERE` clause to filter results within a certain range.

`SELECT *
FROM deck
WHERE level BETWEEN 4 AND 8` - Filters for cards with a level between 4 and 8. 

`SELECT *
FROM deck
WHERE name BETWEEN 'A' AND 'K';` - 
Filters for cards with names starting with the letters `A` through `J`,
and for cards named `K`. 
- This makes it an exclusive filter,
as it's excluding cards with names beginning with K with more than one letter. 

`AND` - Used with the `WHERE` operator to combine multiple conditions,
returning `TRUE` if **both** conditions evaluate to `TRUE`. 

`SELECT *
FROM cards
WHERE ATK BETWEEN 1500 AND 2000
AND type = 'spellcaster';` - Returns cards with the type `spellcaster`
with an ATK value between 1500 and 2000. 

`OR` - Used with the `WHERE` operator to combine multiple conditions,
returning `TRUE` if one or more conditions evaluate to `TRUE`.

`SELECT *
FROM cards
WHERE attribute = 'spell'
   OR attribute = 'trap';` - Returns all Spell cards and Trap cards.

`ORDER BY` - Sorting operator. Used to sort alphabetically or numerically. 

`SELECT *
FROM cards
ORDER BY name;` - Sorts all cards in the deck in alphabetical order by `name`.

`DESC` - Used with `ORDER BY` to sort descending. 

`ASC` - Used with `ORDER BY` to sort ascending. 

`SELECT *
FROM cards
WHERE level > 4
ORDER BY atk DESC;` - Sorts all cards with a level greater than 4,
in descending order by the value of their ATK stats.

`SELECT * FROM cards WHERE rank < 5 ORDER BY def ASC;` - 
Sorts all cards with a rank less than 5, in ascending order
by the value of their DEF stats. 

`LIMIT` - Specify the maximum number of rows you'll see in the results set.
Useful for when you're dealing with a dataset that has numbers of records
in the 5 figures or higher.
- Always goes at the very end of the query.

`SELECT *
FROM cards
LIMIT 5;
` - Shows us 5 cards.

`CASE` - SQL's way of handling conditionals.
- It's essentially SQL's version of a `switch` statement. 

```
SELECT name,
 CASE
  WHEN level > 6 THEN 'Requires two tributes to summon.'
  WHEN level > 4 THEN 'Requires one tribute to summon.'
  ELSE 'Requires no tributes.'
 END
FROM cards;
```

Above is a CASE block with oversimplified YGO logic.

`CASE` - Placed at the start of a conditional block.

`END` - When used with `CASE`, it ends a conditional block. 

`WHEN` - The SQL equivalent of the keyword `case`, if `case` were within a `switch` block.

`THEN` - Used with `WHEN` to contain the code that will execute
when the condition of the `WHEN` is met.

## Aggregate functions

SQL queries can perform calculations on accessed raw data
to answer specific data questions. 

- Calculations performed on multiple rows of a table are called **aggregates**. 

`COUNT(columnName)` counts the number of rows.

`SUM(columnName)` is the sum of the values in a column. 

`MAX(columnName)` is the largest value in a column. 

`MIN(columnName)` is the smallest value in a column.

`AVG(columnName)` is the average of the values in a column. 

`ROUND(columnName, 'x')'` rounds the values in the column to `x` decimal places. 

`SELECT COUNT(*) FROM cards;` - Counts the number of cards. 

`SELECT SUM(downloads) FROM fake_apps;` -
Counts the total number of downloads between all of the fake apps.

`SELECT MAX(level) FROM cards;` - Returns the level of the highest level card.

`SELECT MIN(level) FROM cards;` - Returns the level of the lowest level card.

`SELECT AVG(atk) FROM cards;` - Returns the average ATK stat of all cards. 

`SELECT ROUND(AVG(price), 2) FROM fake_apps;` - An operation nested within a query.
We're rounding the average price to 2 decimal places.

`GROUP BY` - Used with `SELECT` to arrange identical instances
of data in a column into groups.

`SELECT level, COUNT(*) FROM cards GROUP BY level;`:

Say for example that we have a dataset with 5 Level 4 monsters,
8 Level 5 monsters, and 10 Level 6 monsters.
- The above query will return a table with two columns:
one with a header of `level`, and one with a header of `count`.
- There are three different levels, so the table will have three rows,
one for each level.
- On each row will be a level and a count.
  - The first row will have two cells containing `4` (`level`) and `5` (`count`).
  - What will the other two rows have?

Using column reference numbers with `GROUP BY`:

`SELECT category, 
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY category, price;`

The above can be written as:

`SELECT category, 
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;`

`HAVING` - Limits the results of a query based on an aggregate property. 
- Always comes after `GROUP BY` but before `ORDER BY` and `LIMIT`.

Example:

`SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;` - Restricts the query to price points 
that have more than 10 apps.

`WHERE` filters rows, while `HAVING` filters groups. 

Aggregate functions compute a single result set from a set of values. 

## Multiple Tables

To efficiently store data, it can be spread across multiple tables.

For example, we have a database of Steam users. 
Some users have active subscriptions on Steam,
and those subscriptions have their own information, 
like terms, prices, and the currency they're being paid for in. 

If we create one table containing every user with all of their subscriptions
and all of their personal information, there will be a lot of duplicates. 
- If a user has multiple subscriptions, their name will be listed multiple times,
once for each subscription.
- If the same subscription type is subscribed to by multiple users,
the subscription price and description will be repeated once for each user. 


If instead we create multiple tables, 
where the first table contains only the orders placed to start the subscription, 
another table contains the subscriptions,
and another table for the usernames, we will get a complete picture
while dealing with 3 individually manageable tables. 

`JOIN` is used to combine tables manually. 

- Do some practice drills using the `JOIN` and `ON` keywords.

What is an inner join? Do practice drills of inner joins:
- We have two tables: `orders` and `customers`.
The `customers` table is out of date: it is missing an entry.
Meanwhile, the `orders` table has an entry involving the missing customer.
Join these two tables and see what happens.

![image](https://content.codecademy.com/courses/learn-sql/multiple-tables/inner-join.gif)

`LEFT JOIN` allows you to combine two tables and keep some of the unmatched rows. 
- Specifically, it will keep all rows from the first table,
regardless of whether there is a matching row on the second table.

A **primary key** *uniquely identifies* each record in a table. 

It also **ensures data integrity** by **preventing duplicate
or null values** in one or more specified columns.

Imagine that you have three tables: `Monsters`, `Spells` and `Traps`.
Each table has a column containing the cards' 8-digit ID numbers.

- In the `Monsters` table, the column header is `monster_id`. 
- In the `Spells` table, the column header is `spell_id`.
- In the `Traps` table, the column header is `trap_id`.

These special columns are called **primary keys**. 

Requirements of a primary key:

- None of the values in the column can be `NULL`.
- Each value in the column must be unique.
- There must be only one primary key column per table. 
  - A table cannot have multiple primary key columns. 

When the primary key for one table appears in another table,
it is called a **foreign key**.

`CROSS JOIN`

`UNION`

`WITH`

## What is a database schema?

## Advanced PostgreSQL

### How do I make sure my database stays intact?

Data types in SQL

`NOT NULL` constraints

`UNIQUE` constraints

`PRIMARY KEY` constraints

`CHECK` constraints

`FOREIGN KEY` constraints

How to design a PostgreSQL database schema, with a 
focus on data integrity and validation.

Specifying data types in a `CREATE TABLE` statement to 
ensure valid data in PostgreSQL.

Data types:

- `integer`
- `varchar`
- `boolean`
- `date`
- `numeric`
- `time`

Data types alone are not enough to protect data integrity.

Type casting can lead to unexpected results. 

Use additional constraints, like `CHECK`, `NOT NULL`, and regex validation
to catch edge cases and ensure data integrity. 

Use `NOT NULL` constraints to **prevent missing values** in columns,
ensuring data completeness:
- Having `NULL` values in certain columns where there should be values
can make your data unreliable or unusable.
- `NOT NULL` constraints are defined in a `CREATE TABLE` statement. 

Challenge: Do practice drills with `NOT NULL` and `INSERT INTO`
and see what errors pop up when you perform the latter with incomplete data. 

`ALTER TABLE` - Add or remove constraints from existing tables. 

- We use `ALTER TABLE` after we create a table: we realise
that it could do with additional constraints,
or that some constraints are unnecessary or are even preventing
us from inserting data that we need to insert. 

Do some practice drills with the following:
- `ALTER TABLE`
- `UPDATE`
- `SET`
- `ALTER COLUMN`

The `CHECK` keyword
- Can be added in both `CREATE TABLE` and `ALTER TABLE`.

`ADD CHECK`

Using logic that might be applied in `WHERE` for our `CHECK` statements, such as:
- `LIKE`
- `OR`
- `AND`
- `IN`

Making comparisons between columns within a table. 

Applying constraints that apply to multiple columns. 

Using `UNIQUE` constraints in SQL.

`ADD UNIQUE`

`ADD PRIMARY KEY`

`PRIMARY KEY` - Imagine simultaneously enforcing `UNIQUE` and `NOT NULL`
on a column. It's something like that.

`INSERT INTO`

`FOREIGN KEY`

`ADD FOREIGN KEY`

`REFERENCES`

How do we get a `violates foreign key constraint` error message?

Foreign keys - cascading changes

What does `REFERENCES table (id) ON DELETE RESTRICT;` do?
What does `REFERENCES table (id) ON UPDATE RESTRICT;` do?

`CASCADE`

`ON UPDATE CASCADE`

`ON DELETE CASCADE`

`DELETE FROM ... WHERE`

### Database permissions

`current_user`

`postgres` user

`SELECT current_user`

`superuser`

`ccuser`

`pg_catalog.pg_roles`

`information_schema.table_privileges`

`grantee`

`usename`

`usecreatedb`

`usesuper`

`privilege_type`

`grantor`

`SET ROLE`

`SET ROLE <test role>`







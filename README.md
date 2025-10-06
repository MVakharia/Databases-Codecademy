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

`_` - The wildcard character.

`SELECT * FROM movies WHERE name LIKE 'Fant_stic'` -
Searches for all movies starting with `Fant` and ending with `stic`
with exactly one character in the middle.
# CSE 412: Database Management

## Group Project – Phase 2

### Generating Data

To generate the data, just run `./datagen.sh`. This will do several things:

-   Create a new database, called CSE412, using `make_db.sql`
-   Create the tables in the database, according to the schema (in `schema.sql`)
-   Unzip the words lists, which gives four files: adjectives.txt, names.txt, nouns.txt, and surnames.txt. If these files already exist, the previous copy will no longer exist.
-   Run the data generation python script, based on those four files
-   Delete the four files.


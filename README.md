Use command below to open postgres shell

psql -h localhost -p 5432 -U postgres testdb

Database has created schema "myschema" and user "postgres"

Two tables: post_office, client

Post office:
- id (pk)
- city (text, unique)
- lat (numeric)
- lon (numeric)

lat and lon are unique together

Client:
- id (pk)
- first_name (text)
- last_name (text)
- date_of_birth (timestamp)
- gender (custom enum (M, F))
- city (Foreign key to post_office.id)

date of birth and gender are not required

Then we insert few test entries
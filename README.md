Use command below to open postgres shell

psql -h localhost -p 5432 -U postgres test

Database has created schema "myschema" and user "postgres"

Two tables: post_office, client

Post office:
- id
- city
- lat
- lon

Client:
- id
- first_name
- last_name
- date_of_birth
- gender
- city (Foreign key to post_office.id)

Then we insert few test entries
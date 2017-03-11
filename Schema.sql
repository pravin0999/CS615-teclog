/* schema for the notes table in the database*/
CREATE TABLE IF NOT EXISTS notes (
   id SERIAL PRIMARY KEY,
   last_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   content text
);
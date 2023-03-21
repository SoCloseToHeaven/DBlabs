CREATE TABLE creature (
    id SERIAL PRIMARY KEY,
    type VARCHAR(30) CHECK ( type != '' ) NOT NULL,
    population INTEGER CHECK (population >= 0)
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) CHECK (name != '') NOT NULL,
    age INTEGER DEFAULT 18 CHECK (age >= 0 AND age <= 100)
);

CREATE TABLE university (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) CHECK ( name != '' ) NOT NULL
);

CREATE TABLE research_group(
    id SERIAL PRIMARY KEY,
    description text CHECK ( description != '' ) NOT NULL
);


CREATE TABLE group_to_person (
    group_id INTEGER,
    person_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES research_group(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE university_to_person (
    university_id INTEGER,
    person_id INTEGER,
    FOREIGN KEY (university_id) REFERENCES university(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);
CREATE TABLE fact (
    id SERIAL PRIMARY KEY,
    group_id INTEGER,
    description text,
    FOREIGN KEY (group_id) REFERENCES research_group(id)
);

CREATE TABLE fact_to_creature (
    fact_id INTEGER,
    creature_id INTEGER,
    FOREIGN KEY (fact_id) REFERENCES fact(id),
    FOREIGN KEY (creature_id) REFERENCES creature(id)
);

SELECT * FROM person WHERE id IN (
    SELECT person_id FROM group_to_person WHERE group_id IN (
        SELECT id as group_id FROM research_group WHERE id NOT IN (
            SELECT group_id FROM fact
                                       )));
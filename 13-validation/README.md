1. 5 types of CONSTRAINTS
    PRIMARY KEY
    FOREIGN KEY
    NOT NULL
    UNIQUE
    CHECK

2. Fallback 
    default

3. 4 ways to to add constraint
    At creation
        table level
            add constraint: foreign, primary, check, unique
            column level
                constraint: foreign, primary, check, unique, default, not null

    After created
        table level
            add constraint: foreign, primary, check, unique
            column level
                set not null

4. multiple unique will behave exact as composite key, only throw error when values of 2 fields are the same
    


e.g:
at creation
CREATE TABLE project_assignments (
    assignment_id INT,
    employee_id INT,
    project_code VARCHAR(10),
    role_title VARCHAR(50) NOT NULL DEFAULT '',
    hourly_rate NUMERIC(6,2),
    start_date DATE NOT NULL,
    end_date DATE,

    CONSTRAINT pk_project_assignments 
        PRIMARY KEY (assignment_id),

    CONSTRAINT uq_emp_project_combination 
        UNIQUE (employee_id, project_code),

    CONSTRAINT chk_rate_and_dates 
        CHECK (hourly_rate > 0.00 AND end_date > start_date),

    CONSTRAINT fk_assignment_employee 
        FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

after created
ALTER TABLE products
    ALTER COLUMN product_code SET NOT NULL,
    ALTER COLUMN price SET NOT NULL,
    ADD CONSTRAINT uq_product_code UNIQUE (product_code),
    ADD CONSTRAINT chk_positive_price CHECK (price > 0);


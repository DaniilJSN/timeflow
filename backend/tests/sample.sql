/*Populates models with test data to allow quicker and smoother development*/

INSERT INTO user (username, name, surname, email)
VALUES
    ('bmoore', 'Brian', 'Moore', 'BrianFMoore@dayrep.com')
    ('thyatt', 'Tammy', 'Hyatt', 'TammyDHyatt@rhyta.com')
    ('ghills', 'George', 'Hills', 'GeorgeSHills@dayrep.com')
    ('aryan', 'Annette', 'Ryan', 'AnnetteJRyan@teleworm.us')
    ('jwhobrey', 'James', 'Whobrey', 'JamesJWhobrey@armyspy.com')
    ('mwoodmansee', 'Mathew', 'Woodmansee', 'MathewKWoodmansee@rhyta.com')
    ('mtaylor', 'Michael', 'Taylor', 'MichaelJTaylor@teleworm.us')

INSERT INTO client (name, active, created_at, updated_at)
VALUES
    ('dyvenia', TRUE, CURRENT_DATE, CURRENT_DATE)
    ('google', TRUE)
    ('neuralink', TRUE)

INSERT INTO epic (name, work_area, client_id, active, created_at, updated_at)
VALUES
    ('Mobile app', "", 1, TRUE, CURRENT_DATE, CURRENT_DATE)
    ('Payment gateway', "", 2, CURRENT_DATE, CURRENT_DATE)

INSERT INTO epic_area (epic_id, name, is_active, created_at, updated_at)
VALUES
    (1, 'Login page', TRUE, CURRENT_DATE, CURRENT_DATE)
    (1, 'Design', TRUE, CURRENT_DATE, CURRENT_DATE)
    (1, 'Night mode', TRUE, CURRENT_DATE, CURRENT_DATE)
    (2, 'Crypto', TRUE, CURRENT_DATE, CURRENT_DATE)

INSERT INTO team (user_id, name, short_name, is_active, created_at, updated_at)
VALUES
    (1, 'Seniors', 'Snrs', TRUE, CURRENT_DATE, CURRENT_DATE)
    (2, 'Mid-levels', 'Mids', TRUE, CURRENT_DATE, CURRENT_DATE)
    (3, 'Juniors', 'Jnrs', TRUE, CURRENT_DATE, CURRENT_DATE)

INSERT INTO sponsor (client_id, name, short_name, is_active, created_at, updated_at)
VALUES
    (1, 'Alessio Civitillo', 'Alessio', TRUE, CURRENT_DATE, CURRENT_DATE)
    (2, 'Sundar Pichai', 'Sundar', TRUE, CURRENT_DATE, CURRENT_DATE)
    (3, 'Elon Musk', 'Elon', TRUE, CURRENT_DATE, CURRENT_DATE)

INSERT INTO role (short_name, name, created_at, updated_at, is_active)
VALUES
    ('Data Eng', 'Data Engineer', CURRENT_DATE, CURRENT_DATE, TRUE)
    ('Analyst', 'Data Analyst', CURRENT_DATE, CURRENT_DATE, TRUE)
    ('Scientist', 'Data Scientist', CURRENT_DATE, CURRENT_DATE, TRUE)

INSERT INTO rate (user_id, client_id, valid_from, valid_to, amount, created_at, updated_at, is_active)
VALUES
    (1, 1, '2022-01-01', '2022-02-01', 300, CURRENT_DATE, CURRENT_DATE, TRUE)
    (1, 2, '2022-02-01', '2022-03-01', 600, CURRENT_DATE, CURRENT_DATE, TRUE)
    (1, 3, '2022-03-01', '2022-04-01', 400, CURRENT_DATE, CURRENT_DATE, TRUE)
    (2, 1, '2022-02-01', '2022-03-01', 250, CURRENT_DATE, CURRENT_DATE, TRUE)
    (2, 2, '2022-01-01', '2022-02-01', 550, CURRENT_DATE, CURRENT_DATE, TRUE)
    (2, 3, '2022-02-01', '2022-03-01', 350, CURRENT_DATE, CURRENT_DATE, TRUE)
    (3, 1, '2022-03-01', '2022-04-01', 200, CURRENT_DATE, CURRENT_DATE, TRUE)
    (3, 2, '2022-03-01', '2022-04-01', 500, CURRENT_DATE, CURRENT_DATE, TRUE)
    (3, 3, '2022-01-01', '2022-02-01', 300, CURRENT_DATE, CURRENT_DATE, TRUE)

INSERT INTO timelog (user_id, start_time, end_time, epic_id, count_hours, count_days, month, year)
VALUES
    (1, '2022-01-10 08:00', '2022-01-10 13:00', 1, 5.0, 0.62, 1, 2022)
    (2, '2022-01-10 08:00', '2022-01-10 13:00', 1, 5.0, 0.62, 1, 2022)
    (3, '2022-01-10 08:00', '2022-01-10 13:00', 1, 5.0, 0.62, 1, 2022)
    (1, '2022-04-14 08:00', '2022-04-14 13:00', 1, 5.0, 0.62, 4, 2022)
    (2, '2022-04-14 08:00', '2022-04-14 13:00', 1, 5.0, 0.62, 4, 2022)
    (3, '2022-04-14 08:00', '2022-04-14 13:00', 1, 5.0, 0.62, 4, 2022)
    
INSERT INTO forecast (user_id, epic_id, days, month, year)
VALUES
    (1, 1, 5.0, 4, 2022)
    (2, 1, 5.0, 4, 2022)
    (3, 1, 5.0, 4, 2022)
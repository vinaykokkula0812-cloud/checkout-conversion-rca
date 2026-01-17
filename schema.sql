CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(20)
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    user_id INT,
    event_name VARCHAR(30),
    event_time TIMESTAMP,
    device VARCHAR(10)
);

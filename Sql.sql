-- Change delimiter so we can write the procedure
DELIMITER //

-- 1️⃣ Simple procedure: show all users
CREATE PROCEDURE show_users()
BEGIN
    SELECT * FROM users;
END //

-- 2️⃣ Procedure with IN parameter: get user by ID
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT * FROM users WHERE id = user_id;
END //

-- 3️⃣ Procedure with OUT parameter: count users
CREATE PROCEDURE count_users(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM users;
END //

-- 4️⃣ Procedure with INOUT parameter: increase age
CREATE PROCEDURE increase_age(INOUT user_age INT)
BEGIN
    SET user_age = user_age + 1;
END //

-- Reset delimiter back to semicolon
DELIMITER ;

-- Example calls:

-- Call simple procedure
CALL show_users();

-- Call procedure with IN parameter
CALL get_user_by_id(1);

-- Call procedure with OUT parameter
CALL count_users(@total);
SELECT @total;

-- Call procedure with INOUT parameter
SET @age = 25;
CALL increase_age(@age);
SELECT @age;  -- Output: 26

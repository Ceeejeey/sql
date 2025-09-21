-- =========================
-- 1️⃣ Create users
-- =========================
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123!';
CREATE USER 'moderator_user'@'localhost' IDENTIFIED BY 'ModPass123!';
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'ReadOnlyPass123!';

-- =========================
-- 2️⃣ Grant privileges
-- =========================

-- Admin: full access to everything in mydatabase
GRANT ALL PRIVILEGES ON mydatabase.* TO 'admin_user'@'localhost';

-- Moderator: can read and modify data but cannot drop tables
GRANT SELECT, INSERT, UPDATE, DELETE ON mydatabase.* TO 'moderator_user'@'localhost';

-- Read-only: can only view data
GRANT SELECT ON mydatabase.* TO 'readonly_user'@'localhost';

-- =========================
-- 3️⃣ Apply changes
-- =========================
FLUSH PRIVILEGES;

-- =========================
-- 4️⃣ Show privileges for each user
-- =========================
SHOW GRANTS FOR 'admin_user'@'localhost';
SHOW GRANTS FOR 'moderator_user'@'localhost';
SHOW GRANTS FOR 'readonly_user'@'localhost';

-- =========================
-- 5️⃣ Revoke example (optional)
-- =========================
-- REVOKE DELETE ON mydatabase.* FROM 'moderator_user'@'localhost';
-- FLUSH PRIVILEGES;

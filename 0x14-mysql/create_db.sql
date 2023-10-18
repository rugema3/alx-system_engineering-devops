-- Create a database named tyrell_corp.
-- Within the tyrell_corp database create a table named nexus6 and add at least one entry to it.
-- Make sure that holberton_user has SELECT permissions on your table so that we can check that the table exists and is not empty.

CREATE DATABASE IF NOT EXISTS tyrell_corp;

-- switch the database before creating tables to it.
USE tyrell_corp;

-- Create a table called nexus6
CREATE TABLE IF NOT EXISTS nexus6 (
	id INT AUTO_INCREMENT PRIMARY_KEY,
	name VARCHAR(255) NOT NULL
	);

-- Insert some data in the table to make sure it is not empty.
INSERT INTO nexus6 (name) VALUES ('RUGEMA');

GRAND SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';

FLUSH PREVILEGES;

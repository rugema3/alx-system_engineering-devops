-- create a new user for the replica server.
-- The name of the user replica_user with the host name set to %, and can have whatever password


CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED BY 'projectcorrection280hbtn';

GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';

GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';

FLUSH PRIVILEGES;



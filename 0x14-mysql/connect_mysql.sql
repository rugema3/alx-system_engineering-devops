-- Connecting two mysql servers

CHANGE MASTER TO MASTER_HOST='100.26.250.98', MASTER_USER='replica_user', MASTER_PASSWORD='projectcorrection280hbtn', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=154;

-- Start slave

START SLAVE;

-- STATUS CHECK
SHOW SLAVE STATUS\G

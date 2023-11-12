<h1>0x19-postmortem</h1>

<h1>Description:</h1>
<p>
This is a postmortem of the issues I faced during a project implementation.
</p>
<br>
<h2>Postmortem: Inventory Management System Outage</h2>

<h3>Issue Summary:</h3>

<p>
  <strong>Duration:</strong> October 30, 2023<br>
  <strong>Impact:</strong><br>
  <strong>Service Affected:</strong> Web-based Inventory Management System (Under Development)<br>
  <strong>User Experience:</strong> I was unable to access the data on the interface. I couldn’t add items in the database.<br>
  <strong>Root Cause:</strong> Database Corruption due to Unforeseen MySQL Issue
</p>

<h3>Timeline:</h3>

<p>
  <strong>Detection Time:</strong> October 30, 2023, [Time of detection]<br>
  <strong>Detection Method:</strong> Discovered the issue during routine usage of the system interface.<br>
  <strong>Actions Taken:</strong><br>
  - Investigated server logs for anomalies.<br>
  - Assumed Root Cause: Initially suspected a network issue impacting database connectivity.<br>
  - Checked server resources and connectivity.<br>
  - Assumed Root Cause: Database server load was within normal limits.<br>
  - Investigated MySQL logs for errors.<br>
  - Unable to access MySQL as root or other users.<br>
  - Attempted safe mode access and user recreation without success.<br>
  <strong>Misleading Paths:</strong><br>
  - Explored Network Connectivity Issues - ruled out after investigation.<br>
  - Explored High Server Load - not the cause.<br>
  - Explored MySQL Safe Mode for User Recreation - unsuccessful.
</p>

<h3>Resolution:</h3>

<p>
  Identified and rectified a corrupted database table.<br>
  Applied necessary fixes to MySQL configuration.<br>
  Restored the system from the last available backup.<br>
  MySQL was uninstalled and reinstalled on the Ubuntu 23 droplet.<br>
  Recreated two databases, tables, and users.<br>
  Granted user privileges and added missing columns.<br>
  <strong>Resolution Time:</strong> Approximately three hours.
</p>

<h3>Root Cause and Resolution:</h3>

<p>
  <strong>Root Cause:</strong><br>
  The primary cause was identified as a corruption in a key database table, likely due to an unexpected MySQL glitch.<br>
  <strong>Resolution:</strong><br>
  The corrupted table was repaired through MySQL tools.<br>
  Configuration adjustments were made to prevent a recurrence.<br>
  A full system restore was performed from the most recent backup.<br>
  MySQL was uninstalled and reinstalled on the Ubuntu 23 droplet.<br>
  Databases, tables, and users were recreated, and missing columns added.
</p>

<h3>Backup Implementation:</h3>

<p>
  Backups were scheduled every two days using a cron job and a bash script.<br>
  This script captures the current date, sets the database name, defines the backup path, and then uses mysqldump to create a dump file. Finally, it compresses the dump using tar.<br>
  <br>
  <strong>To make the script executable, run:</strong><br>
  <code>chmod +x stock_backup.sh</code><br>
  <br>
  The cron job executes the stock_backup.sh Bash script every two days at midnight. This script creates a MySQL database dump and saves it in a backup directory. The execution output, along with any errors, is appended to a log file (cron_log.txt).
</p>

<h3>Corrective and Preventative Measures:</h3>

<h4>Improvements/Fixes:</h4>

<p>
  Implement regular database health checks in the monitoring system.<br>
  Establish a more robust backup and recovery strategy.<br>
  Perform backups every two days.<br>
  Consider implementing database version control for schema changes.<br>
  Implement an automated backup script and directory creation.<br>
  Create a MySQL database replica on another server.
</p>

<h4>Tasks:</h4>

<p>
  <strong>TODO:</strong> Schedule regular database maintenance to address potential issues proactively.<br>
  <strong>TODO:</strong> Review and update backup procedures to ensure quick system recovery.<br>
  <strong>TODO:</strong> Monitor and improve database replication for real-time backup.<br>
  <strong>TODO:</strong> Conduct regular drills to test the effectiveness of the backup and recovery process.
</p>

<br>

<p>
You can read more on my <a href="https://www.linkedin.com/pulse/postmortem-unveiling-story-database-disaster-alex-rugema-aticf%3FtrackingId=qV66MbrwTAKQIlu%252By7%252Fz7g%253D%253D/?trackingId=qV66MbrwTAKQIlu%2By7%2Fz7g%3D%3D">linkedin.</a>
</p>



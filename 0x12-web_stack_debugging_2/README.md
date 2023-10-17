<h1>0x12. Web stack debugging #2</h1>
<br>
<img src="images/debug2.jpg">
<br>

<h1>Resources:</h1>
<a href="https://intranet.alxswe.com/concepts/68">Web stack debugging</a>
Tasks
<h3>0. Run software as another user</h3>
<img src="images/dubug1.png">
mandatory
<p>

The user root is, on Linux, the “superuser”. It can do anything it wants, that’s a good and bad thing. A good practice is that one should never be logged in the root user, as if you fat finger a command and for example run rm -rf /, there is no comeback. That’s why it is preferable to run as a privileged user, meaning that the user also has the ability to perform tasks that the root user can do, just need to use a specific command that you need to discover.
</p>
<br>
<p>
For the containers that you are given in this project as well as the checker, everything is run under the root user, which has the ability to run anything as another user.
</p>
<b>Requirements:</b>

<li>write a Bash script that accepts one argument</li>
<li>the script should run the whoami command under the user passed as an argument</li>
<li>make sure to try your script by passing different users</li>
Example:
<pre>
root@ubuntu:~# whoami
root
root@ubuntu:~# ./0-iamsomeoneelse www-data
www-data
root@ubuntu:~# whoami
root
root@ubuntu:~#
</pre>
<b>Repo:</b>
<br>
<li>GitHub repository: alx-system_engineering-devops</li>
<li>Directory: 0x12-web_stack_debugging_2</li>
<li>File: 0-iamsomeoneelse</li>
   
<h3>1. Run Nginx as Nginx</h3>
mandatory
<p>
The root user is a superuser that can do anything on a Unix machine, the top administrator. Security wise, you must do everything that you can to prevent an attacker from logging in as root. With this in mind, it’s a good practice not to run your web servers as root (which is the default for most configurations) and instead run the process as the less privileged nginx user instead. This way, if a hacker does find a security issue that allows them to break-in to your server, the impact is limited by the permissions of the nginx user.
</p>
<br>
Fix this container so that Nginx is running as the nginx user.
<br>
<b>Requirements:</b>

<li>nginx must be running as nginx user</li>
<li>nginx must be listening on all active IPs on port 8080</li>
<li>You cannot use apt-get remove</li>
<li>Write a Bash script that configures the container to fit the above requirements</li>

After debugging:
<br>
<pre>
root@ab6f4542747e:~# ps auxff | grep ngin[x]
nginx      884  0.0  0.0  77360  2744 ?        Ss   19:16   0:00 nginx: master process /usr/sbin/nginx
nginx      885  0.0  0.0  77712  2772 ?        S    19:16   0:00  \_ nginx: worker process
nginx      886  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      887  0.0  0.0  77712  3180 ?        S    19:16   0:00  \_ nginx: worker process
nginx      888  0.0  0.0  77712  3208 ?        S    19:16   0:00  \_ nginx: worker process
root@ab6f4542747e:~#
root@ab6f4542747e:~# nc -z 0 8080 ; echo $?
0
root@ab6f4542747e:~#
</pre>
<br>
<b>Repo:</b>

<li>GitHub repository: alx-system_engineering-devops</li>
<li>Directory: 0x12-web_stack_debugging_2</li>
<li>File: 1-run_nginx_as_nginx</li>
   
<h3>2. 7 lines or less</h3>
#advanced
<p>
Using what you did for task #1, make your fix short and sweet.
</p>
<br>
<b>Requirements:</b>

<li>Your Bash script must be 7 lines long or less</li>
<li>There must be a new line at the end of the file</li>
<li>You respect Bash script requirements</li>
<li>You cannot use ;</li>
<li>You cannot use &&</li>
<li>You cannot use wget</li>
<li>You cannot execute your previous answer file (Do not include the name of the previous script in this one)</li>
<br>
<b>Repo:</b>

<li>GitHub repository: alx-system_engineering-devops</li>
<li>Directory: 0x12-web_stack_debugging_2</li>
<li>File: 100-fix_in_7_lines_or_less</li>
   


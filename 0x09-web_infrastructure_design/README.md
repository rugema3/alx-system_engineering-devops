<h1>0x09. Web infrastructure design</h1>


<h1>Resources:</h1>

<li><a href="https://intranet.alxswe.com/rltoken/n3CdS3EA5l5psDDKbEhApA">What is a database?</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/0as4wDlFqyhLhf0f_gedcw">What’s the difference between a web server and an app server?</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/Pl3UoEfAO7K_jUKRLMmnAQ">DNS record types</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/uxpx2YhXs10TFLIDg78chA">Single point of Failure</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/4ansLu2gtHnoFrNThqyObA">How to avoid downtime when deploying new code</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/TAJeVYy9U9iLaEDd6XkbRA">High availability cluster (active-active/active-passive)</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/c0zs2MxrmxFLsCPOizxq6g">What is Https</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/j6idMcUTyNEDj1oYDQFmUw">Firewall</a></li>
<li>Read about DNS</li>
<li>Read about Monitoring</li>
<li>Read about Webserver</li>
<li><a href="https://www.thegeekstuff.com/2016/01/load-balancer-intro/">Load Balancer</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/muykEaCuDmB5dLD6jLkrCg">Load Balancing Algorithms</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/xagkD1OqEgfChHskYyJpyg">Server</a></li>
<li><a href="https://intranet.alxswe.com/rltoken/0fhBw0Of-VIQpUytXZGyGQ">Where are servers hosted (data centers)</a></li>

<h1>Tasks</h1>
<h2>0. Simple web stack</h2>
mandatory
<p>
A lot of websites are powered by simple web infrastructure, 
a lot of time it is composed of a single server with a LAMP stack.

On a whiteboard, design a one server web infrastructure that hosts the 
website that is reachable via www.foobar.com. Start your explanation by 
having a user wanting to access your website.
</p>
Requirements:
<uL>
<li>You must use:</li>
<ul>
<li>1 server</li>
<li>1 web server (Nginx)</li>
<li>1 application server</li>
<li>1 application files (your code base)</li>
<li>1 database (MySQL)</li>
<li>1 domain name foobar.com configured with a www record that points to your server IP 8.8.8.8</li>
</ul>
<li>You must be able to explain some specifics about this infrastructure:</li>
<ul>
<li>What is a server</li>
<li>What is the role of the domain name</li>
<li>What type of DNS record www is in www.foobar.com</li>
<li>What is the role of the web server</li>
<li>What is the role of the application server</li>
<li>What is the role of the database</li>
<li>What is the server using to communicate with the computer of the user requesting the website</li>
</ul>
<li>You must be able to explain what the issues are with this infrastructure:</li>
<ul>
<li>SPOF</li>
<li>Downtime when maintenance needed (like deploying new code web server needs to be restarted)</li>
<li>Cannot scale if too much incoming traffic</li>
</ul>
</ul>
<br>
Please, remember that everything must be written in English to further your technical ability in a variety of settings.


Repo:

<li>gitHub repository: alx-system_engineering-devops</li>
<li>Directory: 0x09-web_infrastructure_design</li>
<li>File: 0-simple_web_stack</li>

<h2>1. Distributed web infrastructure</h2>
mandatory
<p>
On a whiteboard, design a three server web infrastructure that hosts the website www.foobar.com.
</p>
Requirements:
<ul>
<li>You must add:</li>
<ul>
<li>2 servers</li>
<li>1 web server (Nginx)</li>
<li>1 application server</li>
<li>1 load-balancer (HAproxy)</li>
<li>1 set of application files (your code base)</li>
<li>1 database (MySQL)</li>
</ul>
<li>You must be able to explain some specifics about this infrastructure:</li>
<ul>
<li>For every additional element, why you are adding it</li>
<li>What distribution algorithm your load balancer is configured with and how it works</li>
<li>Is your load-balancer enabling an Active-Active or Active-Passive setup, explain the difference between both
<li>How a database Primary-Replica (Master-Slave) cluster works</li>
<li>What is the difference between the Primary node and the Replica node in regard to the application</li>
</ul>
<li>You must be able to explain what the issues are with this infrastructure:</li>
<ul>
<li>Where are SPOF</li>
<li>Security issues (no firewall, no HTTPS)</li>
<li>No monitoring</li>
</ul>
<br>
<p>
Please, remember that everything must be written in English to further your technical ability in a variety of settings.
</p>

Repo:

<li>GitHub repository: alx-system_engineering-devops</li>
<li>Directory: 0x09-web_infrastructure_design</li>
<li>File: 1-distributed_web_infrastructure</li>

<h2>2. Secured and monitored web infrastructure</h2>
mandatory
<p>
On a whiteboard, design a three server web infrastructure that hosts the website www.foobar.com, it must be secured, serve encrypted traffic, and be monitored.
</p>
Requirements:
<ul>
<li>You must add:</li>
<ul>
<li>3 firewalls</li>
<li>1 SSL certificate to serve www.foobar.com over HTTPS</li>
<li>3 monitoring clients (data collector for Sumologic or other monitoring services)</li>
</ul>
<li>You must be able to explain some specifics about this infrastructure:</li>
<ul>
<li>For every additional element, why you are adding it</li>
<li>What are firewalls for</li>
<li>Why is the traffic served over HTTPS</li>
<li>What monitoring is used for</li>
<li>How the monitoring tool is collecting data</li>
<li>Explain what to do if you want to monitor your web server QPS</li>
</ul>
<li>You must be able to explain what the issues are with this infrastructure:</li>
<ul>
<li>Why terminating SSL at the load balancer level is an issue</li>
<li>Why having only one MySQL server capable of accepting writes is an issue</li>
<li>Why having servers with all the same components (database, web server and application server) might be a problem</li>
</ul>
</ul>
<p>
Please, remember that everything must be written in English to further your technical ability in a variety of settings.
</p>

Repo:

<li>GitHub repository: alx-system_engineering-devops</li>
<li>Directory: 0x09-web_infrastructure_design</li>
<li>File: 2-secured_and_monitored_web_infrastructur</li>

<h2>3. Scale up</h2>
#advanced
Readme

<a href="https://intranet.alxswe.com/rltoken/toFi_SdFHyi2MaELB8ekqw">Application server vs web server</a>
Requirements:
<ul>
<li>You must add:</li>
<ul>
<li>1 server</li>
<li>1 load-balancer (HAproxy) configured as cluster with the other one</li>
<li>Split components (web server, application server, database) with their own server</li>
</ul>
<li>You must be able to explain some specifics about this infrastructure:</li>
<ul>
<li>For every additional element, why you are adding it</li>
</ul>
</ul>
<br>
<p>
Please, remember that everything must be written in English to further your technical ability in a variety of settings.
</p>

Repo:

<li>GitHub repository: alx-system_engineering-devops</li>
<li>Directory: 0x09-web_infrastructure_design</li>
<li>File: 3-scale_up</li>


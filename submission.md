Kimberly Rebamonte

1. What is the difference between Docker image and Docker container?
    A docker image is a file template that holds the initial source code, libraries, and tools of an environment.   <!-- answer -->
    A docker container relies on the usage of a docker image template in order to run our applications.             <!-- answer -->

2. What is the command to build a docker image named `cit384-final`?
    * docker build -t cit384-final .                <!-- answer -->

3. What is the command to run a container with `cit384-final` image with an interactive terminal running bash?
    * docker run -it cit384-final /bin/bash         <!-- answer -->

4. When running Docker commands there are many options you can use for example to run a container named cit384 with an ubuntu image the command is: `docker run --name cit384 ubuntu`. What do the following options do? 
   1. --name: Names my container cit384
   2. -d: Runs containers in detached mode/in the background.                                       <!-- answer -->
   3. --rm: Automatically removes the container and its file system once we exit the container.     <!-- answer -->
   4. -p: Allows us to specify a port for hosting                                                   <!-- answer -->
   5. --add-host: Allows us to set a custom host to IP override.                                    <!-- answer -->
   6. -it: Creates an interactive terminal                                                          <!-- answer -->
   7. -v: Allows us create/bind a space (volume) seperate from the filesystem. Also allows us to accesses these volumes.   <!-- answer -->

5. What is the difference between `-` and `--` in command line parameter?
    *  '-' is used for single letter flags while '--' allows us to use the full name format.        <!-- answer -->

6. In the following code block, provide the git instructions necessary to add a new file to the remote repository: git@github.com:org/project.git (You should presume that you don't have a copy of this repository on your local computer.)
   ```
    git clone git@github.com:org/project.git            <!-- answer -->
    cd project.git                                      <!-- answer -->
    git add new-file.txt                                <!-- answer -->
    git commit -m "new file addition"                   <!-- answer -->
    git push                                            <!-- answer -->
   ```
   <!-- You many add any number of lines in the above code block that you need. -->

7. What do the following Apache Directive do?
   1. SSLEngine: Allows us to enable or disable the SSL engine for SSL/TLS Protocols.                                       <!-- answer -->
   2. ProxyEngine: Allows us to enable or disable the SSL engine for proxies and it is used within VHost files.             <!-- answer -->
   3. ProxyAddHeaders: Allows us to add proxy-related information through X-forwarded headers.                              <!-- answer -->
   4. ProxyPass: Allows us to map remote servers to the local server.                                                       <!-- answer -->
   5. ProxyPassReverse: Allows Apache httpd to adjust the URL response headers during HTTP redirect responses.              <!-- answer -->
   6. RewriteRule: Allows us to define different rules for the rewriting engine                                             <!-- answer -->
   7. Redirect: Allows us to perform one page redirects for a user by giving the user the new URL when they input the previous old one.                                                                                                                     <!-- answer -->

8. What module needs to be enabled in order to use the Rewrite directive?
    * mod_rewrite module                                        <!-- answer -->
9. What is the command to enable a new domain/vHost?
    * a2ensite                                                  <!-- answer -->

10. What is the command to disable a new domain/vHost?
    * a2dissite                                                 <!-- answer -->

11. What happens when a user enters a URL into the browser?
    * The IP of the server we are trying to reach is identified with DNS lookup and the browser then makes a TCP connection with this server. After this is successful, an HTTP request is sent in order to ask for the resources identified within the URL. This request is processed and approved through TCP/IP and the website is displayed on the user's browser!                                                   <!-- answer -->

---
You may earn extra credit in this part of the assignment by: 
   1. Adding a file named ``interview_question.md`` to your repository
   2. Providing a comprehensive answer, in essay form, to the following question:
      * What happens when a user enters a URL into the browser?

Of course, your answer here need to much more complete and robust then the answer you provide to the last question in the assignment above.

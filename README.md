# Help Desk Scheduler (HDS)

The Help Desk Scheduler was a web-based application that provided functions for maintaining a work schedule at the Cal Poly ITS Help Desk circa 2003. Staff members could use the Help Desk Scheduler to generate and modify schedules, while student assistants used it to submit schedule preferences and request/respond to shift cover. It also provided functionality for viewing and printing schedules in various formats.

## Background

I was a Computer Science major at Cal Poly SLO in the early 2000s. One of the requirements for graduation was a senior project where we were to define a problem, design a software application to help solve it, and build a fully working solution. I worked at the ITS Help Desk during my last three years there, and while I was there I identified the challenge of scheduling coverage as the problem I would solve for my senior project. The Help Desk Scheduler (HDS) was born of this.

I chose to build a Java EE web application using servlets to implement this solution. At the time, the Struts framework was only a couple of years old, and its Model-View-Controller (MVC) architecture seemed like a great fit for this project. Backed by a MySQL database (also all the rage at the time), I built HDS using:

- Java 1.2 (J2EE)
- MySQL 4.0.12
- Tomcat 4.1.24
- Struts 1.0.2
- Javamail 1.3
- MySQL Java Connector 3.0.7

I remember experimenting with Ant at the time to build the code, but the only record I have of anything I actually wrote didn't even use that—it was just a batch file that ran `javac` commands. It didn't even build a WAR file with the compiled files, it just copied them directly into the webapp `classes` folder in Tomcat. 😂

## Why does this matter 25 years later?

It doesn't, really. Except, I started working at [Moderne](https://www.moderne.io) and exploring [OpenRewrite](https://docs.openrewrite.org) for refactoring and migrating outdated or old code. Even though I hadn't thought about it in many, many years, this somehow got me thinking about some very specific old code that I wrote way back when—my Help Desk Scheduler application. I thought maybe it might be good sample code to use for experimenting with some OpenRewrite recipe authoring. That is, if I could even get it working again at all. So I broke it out and just started with "what will it take to get this running again?"

## HDS Redux

I knew it would probably be tricky to find and run J2EE, but I thought I'd probably be able to use Java EE 8 and that did seem to work. But when I tried using a more recent version of Tomcat, things went sideways quickly. So I went back to using a 4.x version that is thankfully still available (at least for now) through https://archive.apache.org/.

Next, MySQL. The oldest version of MySQL that's still supported and easily accessible is MySQL 8.0. Specifically I used 8.0.13 (the first version that had a release for arm64). This also required updating the MySQL Connector so I replaced the `mysql-connector-java-3.0.7-stable-bin.jar` file in the Tomcat `lib` folder with `mysql-connector-java-8.0.11.jar`. 

So far so good, but I also had to make several changes to the SQL database creation scripts and the Tomcat JDBC connection configuration in order for everything to work with the newer MySQL and Java versions. I kept some old versions in the `archive` directory of this repo just for posterity. I also converted my old HTML requirements documentation into markdown to include here in the `docs` folder.

Finally, I wanted to make this easy and portable, so I threw the whole thing into containers using Docker Compose. This also includes replacing all the SMTP server references in the code to use a [MailDev](https://github.com/maildev/maildev) container.

So, given Docker is installed and configured, it can easily be run locally on http://localhost/hds using:

`docker-compose up -d`

And to shut everything down and clean it up:

 `docker compose down --rmi all`

## OpenRewrite recipe ideas

Now that I have a baseline of mostly working code, maybe I can write some OpenRewrite recipes to modernize it somehow. Some ideas:

- Switch from MySQL to PostgreSQL
- Upgrade to Java 21
- Upgrade to use a newer version of Tomcat
- Migrate from Struts 1.0 to 2.x?
- Move certain hardcoded attributes/parameters into properties files?
- Swap out JSPs for JSFs?
- Switch from Tomcat JDBCRealm for authentication to something more modern (Jakarta Authentication? Spring Security?)

These next improvements are probably beyond the scope of OpenRewrite, but might be fun to do anyway:

- Add some UI design using CSS and Bootstrap (or some other alternative)
- Use an actual build tool like Maven or Gradle (or maybe even Ant to start)
- Refactor completely to use a more modern framework like Spring (Spring MVC? Spring Boot?)
- Rearchitect any half-baked use cases or workflows



# (Very) Basic Workflow

Before implementation development took place on the development server and the production server depending on the project. Many problems arose from this process. So we are creating an organized and scalable new workflow using best practices.

The main reasons for implementation are:
* 1. Version Control System (VCS)
* 2. Quality Assurance (QA)

### The Ecosystem
The main components are:
* 1. Local Environment
* 2. Hub Repository
* 3. Development Server
* 4. Prime Repository
* 5. Production Server

The [XAMPP](https://www.apachefriends.org/index.html) open source package is an Apache distribution containing a HTTP Server, MySQL, PHP, and Perl interpreters. It also comes with other modules including OpenSSL and phpMyAdmin. We leverage XAMPP to develop and test code in an contained enviroment. 

[BitBucket](https://bitbucket.org/) is a free, in this case, web-based hosting service for projects and it is the foundation of the VCS. BitBucket is where we actually store and track code in repositories (repos). There are two repos for each project. The actual live production code will reside in it’s own repo called the Prime Repository and the development code will reside in it’s own repo called the Hub Repository.

[Git](http://git-scm.com/) is a distributed version control system (DVCS) we will use to push and pull code between the local environment and BitBucket.

[PuTTy](http://www.putty.org/) is the CIT-recommended application for secure file transfer using SCP between Windows
clients and Windows or Unix servers. It is a free and open-source terminal emulator, serial console and network file transfer application. We leverage PuTTy to pull code from Bitbucket into the development server.

#### Other Technologies
[Ruby](http://rubyinstaller.org/) is an interpreted scripting language for object-oriented programming. We leverage Ruby primarily for [RubyGems](http://guides.rubygems.org/what-is-a-gem/). Specifically for the [Compass](https://rubygems.org/gems/compass) gem which is a [Sass](http://sass-lang.com/)-based Stylesheet Framework that streamlines the creation and maintenance of CSS.

By default We use [Composer](https://getcomposer.org/) as our default dependency manager. We follow [PSR-4 Autoloading Standards](http://www.php-fig.org/psr/psr-4/).

___
### The Interactions
##### Local Environment PULL from Hub Repo using Git
* Using the terminal we ```git clone```, or copy, the respective development repo so we can develop and test locally with the most up-to-date code

##### Local Environment PUSH to Hub Repo using Git
* Once make changes to the code we then add, or ```git commit -m "details of commit"```, our changes then send or ```git push```, the changes back to the development repo

##### Development Server PULL from Hub Repo using PuTTy
* Then we bring in, or ```git pull```, the up-to-date code from the repo into the dev site for QA

##### Prime Repo PULL from Hub Repo using Hook Script
* Once QA is complete and the site is approved we bring in, or ```git pull```, the up-to-date code.

##### Prime Repo PUSH to Production Server
* Now the up-to-date code goes to the live site

___
### Considerations
#### The ```_sql``` File
There are three databases for each project. One for the local environment, one for development server, and one for the production server. When changes are made to a local instance of a database they must be exported into a ```.sql``` file and added to the ```_sql``` folder within the respective instance of the Hub Repo.

Additionally when working on a site with active CMS users we must export the most up-to-date version of the production database. Essentially the production database is ever-changing. If we import a local instance of a database into the productive database we risk the chance of overwritting changes made by the admin-user.

After we export a database

#### The ```.gitignore``` File
This file is used to create rules that are not committed with the repository during a PUSH or PULL. The local instance of the Hub Repo has a ```.gitignore``` file and the Hub Repo itself has a ```.gitignore``` file. The Prime Repo does not contain a ```.gitignore``` file because...

When using an instance of the custom CMS, these files should not be pushed:
* application.php

When using an instance of WordPress, these files should not be pushed:
* wp-content/<project name>/.sass-cache/
* .htaccess
* .ssh
* wp-config.php

#### The ```.git/hooks``` File
Two simple Git hooks scripts keep Hub and Prime linked together.
* post-update – This hook is called when Hub receives an update.
* post-commit – This hook is called after every commit to send the newly commited changes back up to Hub.

___
### Rules

* Git is required on the server and any local machines
* Never edit code on the development or production servers

___
### Naming Comventions


Item | Name
--- | --- | ---
Hub Repository | projectName_hub
Development Server Site | projectname.rhoadsdev.com
Prime Repository | projectName_prime

___
### Reference for Using Git
* [Learn Git Basics](https://try.github.io/levels/1/challenges/1)
* [Getting a Repo - PULL](https://git-scm.com/docs/git-push)
* [Updating a Repo - PUSH](https://git-scm.com/docs/git-push)


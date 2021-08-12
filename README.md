# got-analytics
This is an example of IRIS Analytics dashboard which is made against the [CSV file](https://github.com/evshvarov/got-analytics/blob/master/data/game_of_thrones_deaths_collecti.csv) on causalities of The Game Of Thrones taken from [Data World project](https://data.world/datasaurusrex/game-of-thones-deaths)

[The dashboard can be examined here.](http://35.205.133.201:52773/dsw/index.html#!/d/Overview.dashboard?ns=IRISAPP)
![Dashboard](https://user-images.githubusercontent.com/2781759/84485495-e6803f80-aca4-11ea-9b93-769aab44fcac.png)

## What this example is about?
It's a demo how you can:
- use [csvgen module](https://openexchange.intersystems.com/package/csvgen) to generate ObjectScript class and import data
- how to create a cube vs CSV and and visualise the data in IRIS Analytics
- how to build a [docker container](https://github.com/evshvarov/got-analytics/blob/master/Dockerfile) with this
- how to deploy docker container into GCP Kubernetes Engine (GKE) automatikally

# Collaboration
This project is totally open for collaboration and pull requests

# How to Develop with this project

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 

Fork or/and Clone/git pull the repo into any local directory

```
$ git git@github.com:evshvarov/got-analytics.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```

## How to Test it

Open in a browser the link: http://localhost:32814/dsw/index.html#!/d/Overview.dashboard?ns=IRISAPP"


## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/), [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/PackageSample/ObjectScript.cls class and try to make changes - it will be compiled in running IRIS docker container.
![docker_compose](https://user-images.githubusercontent.com/2781759/76656929-0f2e5700-6547-11ea-9cc9-486a5641c51d.gif)

Feel free to delete PackageSample folder and place your ObjectScript classes in a form
/src/Package/Classname.cls
[Read more about folder setup for InterSystems ObjectScript](https://community.intersystems.com/post/simplified-objectscript-source-folder-structure-package-manager)

The script in Installer.cls will import everything you place under /src into IRIS.

DSW version 3.1.21


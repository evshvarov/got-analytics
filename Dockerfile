ARG IMAGE=store/intersystems/iris-community:2020.1.0.204.0
ARG IMAGE=intersystemsdc/irishealth-community:2020.3.0.200.0-zpm
ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

USER root   
        
WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild
USER ${ISC_PACKAGE_MGRUSER}

#COPY  Installer.cls .
COPY  src src
COPY data data
COPY dsw dsw
COPY module.xml module.xml
COPY iris.script iris.script

RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly

ARG IMAGE=store/intersystems/iris-community:2020.1.0.204.0
ARG IMAGE=intersystemsdc/iris-community:2020.1.0.209.0-zpm
ARG IMAGE=intersystemsdc/iris-community:2020.2.0.196.0-zpm
FROM $IMAGE

USER root

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
COPY irissession.sh /
RUN chmod +x /irissession.sh 

USER ${ISC_PACKAGE_MGRUSER}

COPY  Installer.cls .
COPY  src src
COPY data import
SHELL ["/irissession.sh"]

RUN \
  do $SYSTEM.OBJ.Load("Installer.cls", "ck") \
  set sc = ##class(App.Installer).setup() \
  zn "IRISAPP" \
  # zpm "install csvgen" \
  zpm "install isc-dev" \
  do ##class(dev.code).workdir("/irisdev/app/src") \
  do EnableDeepSee^%SYS.cspServer("/csp/irisapp/") \
  zpm "install dsw" \
  set rc=##class(GOT.Deaths).ImportData("/opt/irisapp/import/game_of_thrones_deaths_collecti.csv") \
  write !,"Imported "_rc_" records" \
  do ##class(%DeepSee.Utils).%BuildCube("GOTDeaths") \
  zn "%SYS" \
  write "Modify MDX2JSON application security...",! \
  set webName = "/mdx2json" \
  set webProperties("AutheEnabled") = 64 \
  set webProperties("MatchRoles")=":%DB_IRISAPP" \
  set sc = ##class(Security.Applications).Modify(webName, .webProperties) \
  if sc<1 write $SYSTEM.OBJ.DisplayError(sc) 

# bringing the standard shell back
SHELL ["/bin/bash", "-c"]

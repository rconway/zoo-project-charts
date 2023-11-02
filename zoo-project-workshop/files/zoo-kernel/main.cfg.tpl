[main]
encoding = utf-8
version = 1.0.0
serverAddress = http://127.0.0.1
language = en-US
lang = fr-FR,en-CA,en-US
tmpPath={{ .Values.persistence.tmpPath }}
{{- if .Values.ingress.enabled }}
{{- with (first .Values.ingress.hosts) }}
tmpUrl = http://{{ .host }}/temp/
{{- end }}
{{- else }}
tmpUrl = http://localhost:8080/temp/
{{- end }}
dataPath = /usr/com/zoo-project
cacheDir ={{ .Values.persistence.tmpPath }}
templatesPath = /var/www/
search_path=true

[identification]
title = EOEPCA - Workshop 2023
abstract_file=/var/www/header.md
fees = None
accessConstraints = none
keywords = WPS,GIS,buffer

[provider]
providerName=ZOO-Project
providerSite=http://www.zoo-project.org
individualName=Gerald FENOY
positionName=Developer
role=Dev
addressDeliveryPoint=1280, avenue des Platanes
addressCity=Lattes
addressAdministrativeArea=False
addressPostalCode=34970
addressCountry=fr
addressElectronicMailAddress=gerald.fenoy@geolabs.fr
phoneVoice=False
phoneFacsimile=False


[env]
PYTHONPATH=/usr/miniconda3/envs/ades-dev/lib/python3.8/site-packages
CONTEXT_DOCUMENT_ROOT=/usr/lib/cgi-bin/

[database]
dbname=zoo
port=5432
user=zoo
password=zoo
host={{ .Release.Name }}-postgresql
type=PG
schema=public

[metadb]
dbname=zoo
port=5432
user=zoo
password=zoo
host={{ .Release.Name }}-postgresql
type=PG
schema=public

[security]
attributes=Authorization,Cookie,User-Agent
hosts=*

[cookiecutter]
configurationFile={{ .Values.persistence.tmpPath }}/cookiecutter_config.yaml
templatesPath={{ .Values.persistence.tmpPath }}/cookiecutter-templates
templateUrl={{ .Values.cookiecutter.templateUrl }}
templateBranch={{ .Values.cookiecutter.templateBranch }}


[servicesNamespace]
path= {{ .Values.persistence.servicesNamespacePath }}
deploy_service_provider=DeployProcess
undeploy_service_provider=UndeployProcess
has_jwt_service=true
required_files=
arequired_files=securityOut.zcfg,security_service.py,DeployProcess.zcfg,DeployProcess.py,UndeployProcess.zcfg,UndeployProcess.py,deploy_util.py

[headers]
X-Powered-By=ZOO-Project

[rabbitmq]
host={{ .Release.Name }}-rabbitmq
port=5672
user=guest
passwd=guest
exchange=amq.direct
routingkey=zoo
queue=zoo_service_queue

[server]
async_worker=70

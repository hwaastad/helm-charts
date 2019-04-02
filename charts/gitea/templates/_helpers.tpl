{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "gitea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gitea.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified server name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gitea.gitea.fullname" -}}
{{- printf "%s-%s" .Release.Name "gitea" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified postgresql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "gitea.postgresql.fullname" -}}
{{- $name := default "postgresql" .Values.postgresql.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Determine database user based on use of postgresql dependency.
*/}}
{{- define "gitea.database.host" -}}
{{- if .Values.postgresql.install -}}
{{- template "gitea.postgresql.fullname" . -}}
{{- else -}}
{{- .Values.service.gitea.databaseHost | quote -}}
{{- end -}}
{{- end -}}

{{/*
Determine database user based on use of postgresql dependency.
*/}}
{{- define "gitea.database.user" -}}
{{- if .Values.postgresql.install -}}
{{- .Values.postgresql.postgresUser | quote -}}
{{- else -}}
{{- .Values.postgresql.postgresUser | quote -}}
{{- end -}}
{{- end -}}

{{/*
Determine database password based on use of postgresql dependency.
*/}}
{{- define "gitea.database.password" -}}
{{- if .Values.postgresql.install -}}
{{- .Values.postgresql.postgresPassword | quote -}}
{{- else -}}
{{- .Values.postgresql.postgresPassword | quote -}}
{{- end -}}
{{- end -}}

{{/*
Determine database name based on use of postgresql dependency.
*/}}
{{- define "gitea.database.name" -}}
{{- if .Values.postgresql.install -}}
{{- .Values.postgresql.postgresDatabase | quote -}}
{{- else -}}
{{- .Values.postgresql.postgresDatabase | quote -}}
{{- end -}}
{{- end -}}

{{- /*
gitea.labels.standard prints the standard gitea Helm labels.
The standard labels are frequently used in metadata.
*/ -}}
{{- define "gitea.labels.standard" -}}
app.kubernetes.io/name: {{ template "gitea.name" . }}
helm.sh/chart: {{ template "gitea.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "gitea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "laravel.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "laravel.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "laravel.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "laravel.labels" -}}
helm.sh/chart: {{ include "laravel.chart" . }}
{{ include "laravel.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "laravel.selectorLabels" -}}
app.kubernetes.io/name: {{ include "laravel.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "laravel.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "laravel.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "mysql.fullname" -}}
{{- printf "%s-%s" .Release.Name "mysql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the Mysql Hostname
*/}}
{{- define "laravel.databaseHost" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" (include "mysql.fullname" .) -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.host -}}
{{- end -}}
{{- end -}}

{{/*
Return the Mysql Port
*/}}
{{- define "laravel.databasePort" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "3306" -}}
{{- else -}}
    {{- printf "%d" (.Values.externalDatabase.port | int ) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Mysql Database Name
*/}}
{{- define "laravel.databaseName" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" .Values.mysql.db.name -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.database -}}
{{- end -}}
{{- end -}}

{{/*
Return the Mysql User
*/}}
{{- define "laravel.databaseUser" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" .Values.mysql.db.user -}}
{{- else -}}
    {{- printf "%s" .Values.externalDatabase.user -}}
{{- end -}}
{{- end -}}

{{/*
Return the Mysql Secret
*/}}
{{- define "laravel.databaseSecretName" -}}
{{- if .Values.mysql.enabled }}
    {{- printf "%s" (include "mysql.fullname" .) -}}
{{- else -}}
    {{- printf "%s-%s" .Release.Name "externaldb" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "redis.fullname" -}}
{{- printf "%s-%s" .Release.Name "redis" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the Redis Hostname
*/}}
{{- define "laravel.redisHost" -}}
{{- if .Values.redis.enabled }}
    {{- printf "%s-master" (include "redis.fullname" .) -}}
{{- else -}}
    {{- printf "%s" .Values.externalRedis.host -}}
{{- end -}}
{{- end -}}

{{/*
Return the Redis Port
*/}}
{{- define "laravel.redisPort" -}}
{{- if .Values.redis.enabled }}
    {{- printf "6379" -}}
{{- else -}}
    {{- printf "%d" (.Values.externalRedis.port | int ) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Redis Secret
*/}}
{{- define "laravel.redisSecretName" -}}
{{- if .Values.redis.enabled }}
    {{- printf "%s" (include "redis.fullname" .) -}}
{{- else -}}
    {{- printf "%s-%s" .Release.Name "externalredis" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "minio.fullname" -}}
{{- printf "%s-%s" .Release.Name "minio" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the Minio Hostname
*/}}
{{- define "laravel.minioHost" -}}
{{- if .Values.minio.enabled }}
    {{- printf "%s" (include "minio.fullname" .) -}}
{{- else -}}
    {{- printf "%s" .Values.externalMinio.host -}}
{{- end -}}
{{- end -}}

{{/*
Return the Minio Port
*/}}
{{- define "laravel.minioPort" -}}
{{- if .Values.minio.enabled }}
    {{- printf "9000" -}}
{{- else -}}
    {{- printf "%d" (.Values.externalMinio.port | int ) -}}
{{- end -}}
{{- end -}}

{{/*
Return the Minio Url
*/}}
{{- define "laravel.minioUrl" -}}
{{- if .Values.minio.enabled }}
    {{- printf "http://%s:%d" (include "minio.fullname" .) (.Values.externalMinio.port | int ) -}}
{{- else -}}
    {{- printf "%s://%s:%d" .Values.externalMinio.protocol .Values.externalMinio.host .Values.externalMinio.port -}}
{{- end -}}
{{- end -}}

{{/*
Return the Minio Secret
*/}}
{{- define "laravel.minioSecretName" -}}
{{- if .Values.minio.enabled }}
    {{- printf "%s" (include "minio.fullname" .) -}}
{{- else -}}
    {{- printf "%s-%s" .Release.Name "externalminio" -}}
{{- end -}}
{{- end -}}

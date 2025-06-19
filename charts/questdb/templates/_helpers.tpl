{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "questdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "questdb.fullname" -}}
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
{{- define "questdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "questdb.labels" -}}
helm.sh/chart: {{ include "questdb.chart" . }}
{{ include "questdb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "questdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "questdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "questdb.serviceAccountName" -}}
{{- default (include "questdb.fullname" .) .Values.serviceAccount.name }}
{{- end }}


{{/*
Generate server.conf file content
*/}}
{{- define "generateServerConfig" -}}
{{- if .Values.metrics.enabled -}}
metrics.enabled = true
{{- end }}
{{- range $key, $value := index .Values.questdb.serverConfig.options }}
{{ $key }} = {{ $value }}
{{- end }}
{{- end }}

{{/*
Generate log.conf file content
*/}}
{{- define "generateLogConfig" -}}
{{- range $key, $value := index .Values.questdb.loggingConfig.options }}
{{ $key }} = {{ $value }}
{{- end }}
{{- end }}

{{/*
Generate mime.types file content
*/}}
{{- define "generateMimeConfig" -}}
{{- range $key, $value := index .Values.questdb.mimeConfig.options }}
{{ $key }}   {{ $value }}
{{- end }}
{{- end }}

{{/*
Build openshift detection
*/}}
{{- define "isOpenshiftEnabled" -}}
{{- $openshiftEnabledString := (.Values.openshift).enabled | toString -}}
{{- if eq $openshiftEnabledString "true" -}}
true
{{- else if and (eq $openshiftEnabledString "detect") (.Capabilities.APIVersions.Has "security.openshift.io/v1") }}
true
{{- end }}
{{- end }}

{{/*
Build securityContext
*/}}
{{- define "generateSecurityContext" -}}
{{- $context := .Values.securityContext -}}
{{- if $context -}}
{{- if (include "isOpenshiftEnabled" .) -}}
{{- $context = omit $context "runAsUser" "runAsGroup" "fsGroup" -}}
{{- end -}}
{{- else -}}
{{ $context = dict -}}
{{- end -}}
{{ $context | toYaml }}
{{- end }}

{{/*
Build podSecurityContext
*/}}
{{- define "generatePodSecurityContext" -}}
{{- $context := .Values.podSecurityContext -}}
{{- if $context -}}
{{- if (include "isOpenshiftEnabled" .) -}}
{{- $context = omit $context "runAsUser" "runAsGroup" "fsGroup" -}}
{{- end -}}
{{- else -}}
{{ $context = dict -}}
{{- end -}}
{{ $context | toYaml }}
{{- end }}

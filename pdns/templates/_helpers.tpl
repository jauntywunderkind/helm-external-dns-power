{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "extpdns.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "extpdns.fullname" -}}
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
*/}}
{{- define "extpdns.fullname.resuffixed" -}}
{{- $suffixValues := get .Values .suffixName }}
{{- $suffix := get $suffixValues "suffix" }}
{{- $override := get $suffixValues "fullnameOverride" }}
{{- $releaseName := include "desuffixedReleaseName" . }}
{{- if $override }}
{{- $override | trunc 63 | trimSuffix "-" }}
{{- else if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}{{ $suffix }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name $releaseName }}
{{- $releaseName | trunc 63 | trimSuffix "-" }}{{- $suffix }}
{{- else }}
{{- printf "%s%s-%s" $releaseName $suffix $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
*/}}
{{- define "extpdns-persist.fullname" }}
{{- include "extpdns.fullname.resuffixed" (merge (dict "suffixName" "persist") .)}}
{{- end}}

{{/*
*/}}
{{- define "extpdns-pdns.fullname" }}
{{- include "extpdns.fullname.resuffixed" (merge (dict "suffixName" "pdns") .)}}
{{- end}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "extpdns.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "extpdns.labels" -}}
helm.sh/chart: {{ include "extpdns.chart" . }}
{{ include "extpdns.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "extpdns.selectorLabels" -}}
app.kubernetes.io/name: {{ include "extpdns.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "extpdns.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "extpdns.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

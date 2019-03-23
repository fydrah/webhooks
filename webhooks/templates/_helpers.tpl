{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "..name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "..fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "..chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create hooks.json configuration file
*/}}
{{- define "..hooks-config" -}}
{{ $hc := dict "id" "healthz" -}}
{{ $_ := set $hc "execute-command" "/scripts/healthz" -}}
{{- $hl := list $hc -}}
{{- range $krh, $_ := .Values.rawHooks -}}
{{-   $rhd := dict "id" $krh -}}
{{-   $_ := set $rhd "execute-command" (printf "/scripts/%s" $krh) -}}
{{-   $hl = append $hl $rhd -}}
{{- end -}}
{{- range $keh, $veh := .Values.extraHooks -}}
{{-   $ehd := dict "id" $keh -}}
{{-   $_ := set $ehd "execute-command" $veh -}}
{{-   $hl = append $hl $ehd -}}
{{- end -}}
{{ $hl | toJson }}
{{- end -}}

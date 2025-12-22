{{- define "generic.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "generic.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" (include "generic.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "generic.containerName" -}}
{{- if .Values.container.name -}}
{{- .Values.container.name -}}
{{- else -}}
{{- include "generic.fullname" . -}}
{{- end -}}
{{- end -}}

{{- define "generic.labels" -}}
app.kubernetes.io/name: {{ include "generic.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: Helm
{{- end -}}

{{- define "generic.selectorLabels" -}}
app: {{ include "generic.fullname" . }}
{{- end -}}
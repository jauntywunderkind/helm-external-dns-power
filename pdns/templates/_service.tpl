{{/* vim: set filetype=mustache: */}}
{{/*
A service
*/}}
{{- define "extpdns.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "extpdns.fullname" . }}-{{ .serviceName }}
  labels:
    {{- include "extpdns.labels" . | nindent 4 }}
spec:
  {{- $serviceValues := get .Values.pdns.service .serviceName }}
  {{- $type := $serviceValues.type | default .Values.service.type }}
  {{- if $type }}
  type: {{ $serviceValues.type | default .Values.service.type }}
  {{- end }}
  ports:
    - name: {{ .serviceName }}
    {{- with $serviceValues }}
    {{- range $key, $value := omit . "type" }}
      {{ $key }}: {{ $value }}
    {{- end }}
    {{- if not (hasKey . "targetPort") }}
      targetPort: {{ .port }}
    {{- end }}
    {{- end }}
  selector:
    {{- include "extpdns.selectorLabels" . | nindent 4 }}
{{- end }}


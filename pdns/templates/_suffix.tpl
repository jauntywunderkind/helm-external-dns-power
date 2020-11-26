{{/*
*/}}
{{- define "desuffixRelease" -}}
{{- $suffixes := printf "(?:%s)|(?:%s)|(?:%s)" .Values.persist.suffix .Values.pdns.suffix .Values.ext.suffix }}
{{- $regex := printf "^(.*)(%s)$" $suffixes }}
{{- regexReplaceAll $regex .Release.Name "${1}" }}
{{- end }}

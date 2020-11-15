{{/*
*/}}
{{- defined "desuffixRelease" -}}
{{- $suffixes := printf "(?:%s)|(?:%s)|(?:%s)" .Values.persist.suffix .Values.pdns.suffix .Values.ext.suffix }}
{{- $regex := printf "^(.*)($suffixes)$" }}
regex:{{ $regex }}
value:{{- regexReplaceAll $regex .releaseName "${1}"
{{- end }}

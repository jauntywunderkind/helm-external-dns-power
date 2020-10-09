{{/*
*/}}
{{- define "extpdns-persist.db-owner" }}
{{- .Values.pg.pdns.owner }}.
{{- if .Values.pg.pdns.db | default false | eq true }}
{{/* {{- include "extpdns-persist.fullname" . }} */}}
{{- else if .Values.pg.pdns | hasKey "db" }}
{{- .Values.pg.pdns.db }}
{{- end }}
{{- .Values.pg.pdns.suffix | default "" }}
{{- end }}

{{/*
*/}}
{{- define "extpdns-persist.db-reader" }}
{{- .Values.pg.pdns.reader }}.
{{- if .Values.pg.pdns.db | default false | eq true }}
{{- include "extpdns-persist.fullname" . }}
{{- else if .Values.pg.pdns | hasKey "db" }}
{{- .Values.pg.pdns.db }}
{{- end }}
{{- .Values.pg.pdns.suffix | default "" }}
{{- end }}

{{/*
*/}}
{{- define "extpdns-persist.db-writer" }}
{{- .Values.pg.pdns.writer }}.
{{- if .Values.pg.pdns.db | default false | eq true }}
{{- include "extpdns-persist.fullname" . }}
{{- else if .Values.pg.pdns | hasKey "db" }}
{{- .Values.pg.pdns.db }}
{{- end }}
{{- .Values.pg.pdns.suffix | default "" }}
{{- end }}


{{/*
*/}}
{{- define "extpdns-persist.make-role" }}
{{- $makeRole := . }}
{{- with .root.Values.persist.pg.role }}
{{- index . $makeRole.role }}.
{{- if .db | eq true }}
{{- include "extpdns-persist.fullname" $makeRole.root }}
{{- else if .db }}
{{- .db }}
{{- end }}
{{- .tail | default "" }}
{{- end }}
{{- end }}

{{/*
*/}}
{{- define "extpdns-persist.db-owner" }}
{{- include "extpdns-persist.make-role" (dict "root" . "role" "owner") }}
{{- end }}

{{/*
*/}}
{{- define "extpdns-persist.db-reader" }}
{{- include "extpdns-persist.make-role" (dict "root" . "role" "reader") }}
{{- end }}

{{/*
*/}}
{{- define "extpdns-persist.db-writer" }}
{{- include "extpdns-persist.make-role" (dict "root" . "role" "writer") }}
{{- end }}

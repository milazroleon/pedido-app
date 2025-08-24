{{/*
Generate backend fullname
*/}}
{{- define "backend.fullname" -}}
{{- printf "%s-backend" (include "pedido-app.fullname" .) -}}
{{- end }}

{{/*
Backend labels
*/}}
{{- define "backend.labels" -}}
app.kubernetes.io/name: backend
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: pedido-app
{{- end }}

{{/*
Frontend fullname
*/}}
{{- define "frontend.fullname" -}}
{{- printf "%s-frontend" (include "pedido-app.fullname" .) -}}
{{- end }}

{{/*
Frontend labels
*/}}
{{- define "frontend.labels" -}}
app.kubernetes.io/name: frontend
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/part-of: pedido-app
{{- end }}

{{/*
Pedido-app fullname
*/}}
{{- define "pedido-app.fullname" -}}
{{- if .Values.global.fullnameOverride -}}
{{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Release.Name -}}
{{- end -}}
{{- end }}

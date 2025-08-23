{{- define "pedido-app.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pedido-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pedido-app.labels" -}}
helm.sh/chart: {{ include "pedido-app.chart" . }}
app.kubernetes.io/name: {{ include "pedido-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "pedido-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pedido-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "pedido-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "pedido-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

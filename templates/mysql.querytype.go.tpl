{{- $table := (schema .Schema .Table.TableName) -}}
{{- if .Comment -}}
// {{ .Comment }}
{{- else -}}
// {{ .Name }} represents a row from '{{ $table }}'.
{{- end }}
type {{ .Name }} struct {
{{- range .Fields }}
	{{ .Name }} {{ if or (eq .Type "uint") (eq .Type "uint64") }}int{{ else }}{{ retype .Type }}{{ end }} // {{ .Col.ColumnName }}
{{- end }}
}


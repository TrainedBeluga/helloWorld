package main

import (
	"net/http"
	"html/template"
	"io"
)

func handler(w http.ResponseWriter, r *http.Request){

	t, _ := template.ParseFiles("layout.html")

	data := struct {
		Title string
		Text string
	}{
		Title: "Hello World1!",
		Text: "Hello World1!",
	}

	t.Execute(w, data)

}

func healthCheck(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Header().Set("Content-Type", "application/json")

	io.WriteString(w, `{"alive": true}`)
}

func main() {
	http.HandleFunc("/", handler)
	http.HandleFunc("/healthCheck", healthCheck)

	http.ListenAndServe(":80", nil)
}
package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		response := fmt.Sprintf("Header: %v\n Uri: %v", r.Header.Get("x-jwt-assertion"), r.URL.RequestURI())
		w.Write([]byte(response))
	},
	)

	http.ListenAndServe(":8080", nil)
}

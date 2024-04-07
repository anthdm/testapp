package main

import (
	"log/slog"
	"net/http"
)

func main() {
	router := http.NewServeMux()
	port := ":3000"
	router.HandleFunc("/up", handleGetUp)

	slog.Info("running application", "port", port)

	http.ListenAndServe(port, router)
}

func handleGetUp(w http.ResponseWriter, _ *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("it's up! using version 2.0"))
}

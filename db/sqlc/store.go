package db

import "database/sql"

type Store interface {
	Querier
}

type SQLStore struct {
	db *sql.DB
}

-- name: CreateUser :one
INSERT INTO USERS (
  USERNAME,
  PASSWORD,
  EMAIL
) VALUES (
  $1,
  $2,
  $3
) RETURNING *;

-- name: GetUser :one
SELECT
  *
FROM
  USERS
WHERE
  USERNAME = $1 LIMIT 1;

-- name: GetUserById :one
SELECT
  *
FROM
  USERS
WHERE
  ID = $1 LIMIT 1;
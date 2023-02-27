-- name: CreateCategory :one
INSERT INTO CATEGORIES (
  USER_ID,
  TITLE,
  TYPE,
  DESCRIPTION
) VALUES (
  $1,
  $2,
  $3,
  $4
) RETURNING *;

-- name: GetCategory :one
SELECT
  *
FROM
  CATEGORIES
WHERE
  ID = $1 LIMIT 1;

-- name: GetCategories :many
SELECT
  *
FROM
  CATEGORIES
WHERE
  USER_ID = $1
  AND TYPE = $2
  AND LOWER(TITLE) LIKE CONCAT('%',
  LOWER(@TITLE::TEXT),
  '%')
  AND LOWER(DESCRIPTION) LIKE CONCAT('%',
  LOWER(@DESCRIPTION::TEXT),
  '%');

-- name: UpdateCategories :one
UPDATE CATEGORIES
SET
  TITLE = $2,
  DESCRIPTION = $3
WHERE
  ID = $1 RETURNING *;

-- name: DeleteCategories :exec
DELETE FROM CATEGORIES
WHERE
  ID = $1;
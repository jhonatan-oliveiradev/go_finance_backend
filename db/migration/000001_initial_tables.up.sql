CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "username" VARCHAR NOT NULL,
  "password" VARCHAR NOT NULL,
  "email" VARCHAR UNIQUE NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (NOW())
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "user_id" INT NOT NULL,
  "title" VARCHAR NOT NULL,
  "type" VARCHAR NOT NULL,
  "description" VARCHAR NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (NOW())
);

ALTER TABLE "categories" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

CREATE TABLE "accounts" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "user_id" INT NOT NULL,
  "category_id" INT NOT NULL,
  "title" VARCHAR NOT NULL,
  "type" VARCHAR NOT NULL,
  "description" VARCHAR NOT NULL,
  "value" INTEGER NOT NULL,
  "date" DATE NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT (NOW())
);

ALTER TABLE "accounts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "accounts" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");
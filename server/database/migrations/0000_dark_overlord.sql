CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"username" text NOT NULL,
	"email" text NOT NULL,
	"hash" text NOT NULL,
	CONSTRAINT "users_username_unique" UNIQUE("username")
);

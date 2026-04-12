ALTER TABLE "users" RENAME COLUMN "hash" TO "password";--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_email_unique" UNIQUE("email");
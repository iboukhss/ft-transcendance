// Read the docs
// https://orm.drizzle.team/docs/get-started-postgresql

import { drizzle } from 'drizzle-orm/postgres-js'
import postgres from 'postgres'

import * as schema from '#server/database/schema'
import { env } from '#server/utils/env'

export const queryClient = postgres(env.DATABASE_URL)
export const tables = schema
export const db = drizzle(queryClient, { schema })

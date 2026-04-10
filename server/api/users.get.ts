import { db } from '#server/utils/db'
import { users } from '#server/database/schema'

export default defineEventHandler(async (_event) => {
  const allUsers = await db.select().from(users).catch((err) => {
    console.error('Database query error:', err)
    throw createError({
      statusCode: 500,
      statusMessage: 'Internal Server Error'
    })
  })

  return {
    status: 'success',
    data: allUsers
  }
})

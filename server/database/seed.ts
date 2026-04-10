import 'dotenv/config'

import { db, queryClient } from '#server/utils/db'
import { users } from '#server/database/schema'

async function seed() {
  console.log('🌱 Seeding database...')

  await db.insert(users)
    .values([
      { username: 'iboukhss', email: 'ismail@42.fr' },
      { username: 'dheck', email: 'dennis@42.fr' },
      { username: 'marvin', email: 'marvin@42.fr' }
    ])
    .onConflictDoNothing()
    .catch((err) => {
      console.error('❌ Seeding failed:', err)
      process.exit(1)
    })

  console.log('✅ Seeding completed successfully.')
  await queryClient.end()
}

seed()

import { z } from 'zod'

import { JOB_CATEGORY_KEYS, WORKPLACE_KEYS, SKILL_KEYS } from '#shared/constants/enums'

export const jobSchema = z.object({
  title: z.string().min(1, 'Must provide a job title'),
  category: z.enum(JOB_CATEGORY_KEYS, 'Please select a category'),
  skills: z.array(z.enum(SKILL_KEYS)).min(1, 'Please select at least one skill'),
  durationMonths: z.int().min(1).max(12),
  rate: z.number().positive('Rate must be positive'),
  workplace: z.enum(WORKPLACE_KEYS, 'Please select a workplace'),
  description: z.string().min(30, 'Description is too short')
})

export type JobDTO = z.infer<typeof jobSchema>

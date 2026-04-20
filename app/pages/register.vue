<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent, RadioGroupItem, SelectMenuItem } from '@nuxt/ui'

// Good read: https://ui.nuxt.com/docs/components/form

const schema = z.object({
  accountType: z.enum(['freelancer', 'company']),
  firstName: z.string().trim().min(1, 'First name is required'),
  lastName: z.string().trim().min(1, 'Last name is required'),
  // NOTE(isma): If email validation breaks try this instead:
  // https://github.com/colinhacks/zod/issues/4642#issuecomment-2957508997
  email: z.string().trim().toLowerCase().email('Invalid email'),
  password: z.string().min(8, 'Password must be at least 8 characters'),
  country: z.enum(['be', 'fr', 'de', 'lu'], 'Please select a country')
})

type Schema = z.output<typeof schema>

// Partial makes every property in Schema optional (T | undefined)
const state = reactive<Partial<Schema>>({
  accountType: 'freelancer',
  firstName: '',
  lastName: '',
  email: '',
  password: '',
  country: undefined
})

const accountTypes: RadioGroupItem[] = [
  { label: 'Freelancer', description: 'I am looking for a job opportunity.', id: 'freelancer' },
  { label: 'Company', description: 'I am looking to hire someone.', id: 'company' }
]

const countries: SelectMenuItem[] = [
  { label: 'Belgium', value: 'be' },
  { label: 'France', value: 'fr' },
  { label: 'Germany', value: 'de' },
  { label: 'Luxembourg', value: 'lu' }
]

const toast = useToast()
const isLoading = ref(false)

async function onSubmit(event: FormSubmitEvent<Schema>) {
  if (isLoading.value) {
    return
  }

  isLoading.value = true

  try {
    await $fetch('/api/auth/register', {
      method: 'POST',
      body: event.data
    })

    toast.add({
      title: 'Account Created',
      description: 'Welcome to LuxLink!',
      color: 'success'
    })

    await navigateTo('/')
  }
  catch (err: any) {
    toast.add({
      title: 'Registration failed',
      description: err.data?.message || 'Something went wrong',
      color: 'error'
    })
  }
  finally {
    isLoading.value = false
  }
}
</script>

<template>
  <div class="flex-1 flex flex-col items-center justify-center py-12 px-4">
    <div class="w-full max-w-lg space-y-6">
      <header class="text-center">
        <h2 class="text-xl font-bold">Register</h2>
        <p class="text-sm text-muted">Create your LuxLink account.</p>
      </header>

      <USeparator />

      <UForm :schema="schema" :state="state" class="space-y-6" @submit="onSubmit">
        <UFormField name="accountType">
          <URadioGroup v-model="state.accountType" value-key="id" :items="accountTypes" />
        </UFormField>

        <div class="grid grid-cols-2 gap-4">
          <UFormField label="First name" name="firstName">
            <UInput v-model="state.firstName" placeholder="Jane" class="w-full" />
          </UFormField>

          <UFormField label="Last name" name="lastName">
            <UInput v-model="state.lastName" placeholder="Doe" class="w-full" />
          </UFormField>
        </div>

        <UFormField label="Email" name="email">
          <UInput v-model="state.email" placeholder="jane@example.com" class="w-full" />
        </UFormField>

        <UFormField label="Password" name="password">
          <UInput v-model="state.password" type="password" class="w-full" />
        </UFormField>

        <UFormField label="Country" name="country">
          <USelectMenu
            v-model="state.country"
            value-key="value"
            placeholder="Select country"
            :items="countries"
            :search-input="false"
            class="w-full" />
        </UFormField>

        <UButton type="submit" :loading="isLoading" :disabled="isLoading" size="lg">
          Create Account
        </UButton>
      </UForm>
    </div>
  </div>
</template>

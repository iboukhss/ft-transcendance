<script setup lang="ts">
import type { RadioGroupItem, SelectMenuItem } from '@nuxt/ui'

const state = reactive({
  accountType: 'freelancer',
  firstName: '',
  lastName: '',
  email: '',
  password: '',
  country: undefined
})

const accountTypes: RadioGroupItem[] = [
  { label: 'Freelancer', description: 'I am looking for a job opportunity.', id: 'freelancer' },
  { label: 'Company', description: 'I am looking to hire somebody.', id: 'company' }
]

const countries: SelectMenuItem[] = [
  { label: 'Belgium', value: 'be' },
  { label: 'France', value: 'fr' },
  { label: 'Germany', value: 'de' },
  { label: 'Luxembourg', value: 'lu' }
]
</script>

<template>
  <div class="min-h-screen flex items-center justify-center">
    <UCard class="w-full max-w-lg shadow-sm">
      <template #header>
        <div>
          <h2 class="text-xl font-semibold ">
            Register
          </h2>
          <p class="text-sm text-muted">
            Create your LuxLink account.
          </p>
        </div>
      </template>

      <UForm
        :state="state"
        class="space-y-6"
      >
        <UFormField
          name="accountType"
        >
          <URadioGroup
            v-model="state.accountType"
            value-key="id"
            :items="accountTypes"
          />
        </UFormField>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
          <UFormField
            label="First name"
            name="firstName"
          >
            <UInput
              v-model="state.firstName"
              placeholder="Jane"
              size="md"
            />
          </UFormField>

          <UFormField
            label="Last name"
            name="lastName"
          >
            <UInput
              v-model="state.lastName"
              placeholder="Doe"
              size="md"
            />
          </UFormField>
        </div>

        <UFormField
          label="Email"
          name="email"
        >
          <UInput
            v-model="state.email"
            placeholder="jane@example.com"
          />
        </UFormField>

        <UFormField
          label="Password"
          name="password"
        >
          <UInput v-model="state.password" />
        </UFormField>

        <UFormField
          label="Country"
          name="country"
        >
          <USelectMenu
            v-model="state.country"
            value-key="value"
            placeholder="Select country"
            :items="countries"
            :search-input="false"
          />
        </UFormField>

        <UButton
          type="submit"
          block
          size="lg"
        >
          Create Account
        </UButton>
      </UForm>
    </UCard>
  </div>
</template>

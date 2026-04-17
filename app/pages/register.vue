<script setup lang="ts">
import type { AuthFormField } from '@nuxt/ui'

const fields = ref<AuthFormField[]>([
  {
    name: 'accountType',
    type: 'select',
    label: 'I am a...',
    defaultValue: 'Freelancer',
    items: [
      {
        label: 'Freelancer',
        value: 'freelancer'
      },
      {
        label: 'Company',
        value: 'company'
      }
    ]
  },
  {
    name: 'firstName',
    type: 'text',
    label: 'First name'
  },
  {
    name: 'lastName',
    type: 'text',
    label: 'Last name'
  },
  {
    name: 'email',
    type: 'text',
    label: 'Email'
  },
  {
    name: 'password',
    type: 'password',
    label: 'Password'
  },
  {
    name: 'country',
    type: 'select',
    label: 'Country',
    placeholder: 'Select country',
    items: [
      {
        label: 'Belgium',
        value: 'be'
      },
      {
        label: 'France',
        value: 'fr'
      },
      {
        label: 'Germany',
        value: 'de'
      },
      {
        label: 'Luxembourg',
        value: 'lu'
      }
    ]
  }
])
</script>

<template>
  <div class="flex flex-col items-center p-4">
    <UAuthForm
      title="Register"
      description="Create a new LuxLink account."
      :fields="fields"
      class="max-w-md"
    />
  </div>
</template>

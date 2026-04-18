<script setup lang="ts">
import type { AuthFormField } from '@nuxt/ui'

const fields = ref<AuthFormField[]>([
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
    name: 'remember',
    type: 'checkbox',
    label: 'Remember me'
  }
])
</script>

<template>
  <div class="flex flex-col items-center p-4">
    <UAuthForm
      title="Welcome Back"
      description="Enter your credentials to access to your LuxLink account."
      :fields="fields"
      class="max-w-md"
    />
  </div>
</template>

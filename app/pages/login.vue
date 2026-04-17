<script setup lang="ts">
const state = reactive({
  email: '',
  password: '',
  remember: false
})
</script>

<template>
  <div class="flex-1 flex flex-col items-center justify-center py-12 px-4">
    <div class="w-full max-w-lg space-y-6">
      <header class="text-center">
        <h2 class="text-xl font-bold">Welcome Back</h2>
        <p class="text-sm text-muted">Enter your credentials to access your LuxLink account.</p>
      </header>

      <USeparator />

      <UForm :state="state" class="space-y-6">
        <UFormField label="Email" name="email">
          <UInput v-model="state.email" placeholder="jane@example.com" class="w-full" />
        </UFormField>

        <UFormField label="Password" name="password">
          <UInput v-model="state.password" type="password" class="w-full" />
        </UFormField>

        <UCheckbox v-model="state.remember" label="Remember me" />

        <UButton type="submit" block size="lg">Log In</UButton>
      </UForm>
    </div>
  </div>
</template>

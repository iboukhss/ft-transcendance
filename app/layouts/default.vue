<script setup lang="ts">
import type { NavigationMenuItem } from '@nuxt/ui'

const items = computed<NavigationMenuItem[]>(() => [
  {
    label: 'Find Talents',
    to: '/profiles'
  },
  {
    label: 'Find Work',
    to: '/jobs'
  }
])
</script>

<template>
  <UApp>
    <UHeader title="LuxLink">
      <template #left>
        <NuxtLink to="/">
          <span class="text-2xl font-bold">LuxLink</span>
        </NuxtLink>
      </template>

      <UNavigationMenu :items="items" />

      <template #right>
        <UColorModeButton />
        <UButton
          label="Log In"
          to="/login"
          color="neutral"
          variant="ghost" />
        <UButton
          label="Join Now"
          to="/register"
          color="primary" />
      </template>
    </UHeader>

    <UMain>
      <slot />
    </UMain>

    <UFooter>
      <template #left>
        <span class="text-sm text-muted">© 2026 42 Luxembourg Students</span>
      </template>
    </UFooter>
  </UApp>
</template>

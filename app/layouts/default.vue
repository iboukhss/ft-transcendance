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
  <div>
    <UHeader title="LuxLink">
      <template #left>
        <NuxtLink to="/">
          <span class="font-bold text-xl">LuxLink</span>
        </NuxtLink>
      </template>

      <UNavigationMenu :items="items" />

      <template #right>
        <UColorModeButton />
        <UButton
          label="Log In"
          to="/login"
          variant="ghost"
          color="neutral"
        />
        <UButton
          label="Join Now"
          to="/register"
          color="primary"
        />
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
  </div>
</template>

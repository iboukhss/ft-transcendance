// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: ['@nuxt/eslint', 'nuxt-auth-utils', '@nuxt/ui'],
  devtools: { enabled: true },
  // From here: https://ui.nuxt.com/docs/getting-started/installation/nuxt
  css: ['~/assets/css/main.css'],
  // Stops useAppConfig warning spam
  experimental: {
    serverAppConfig: false
  },
  compatibilityDate: '2026-04-01',
  // Disabled typecheck due to random IPC crashes
  typescript: {
    typeCheck: false,
    strict: true,
    includeWorkspace: true
  },
  // Reference: https://eslint.style/rules
  eslint: {
    config: {
      stylistic: {
        indent: 2,
        quotes: 'single',
        semi: false,
        commaDangle: 'never'
      }
    }
  }
})

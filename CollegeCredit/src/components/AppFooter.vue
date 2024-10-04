<template>
  <v-footer height="40" app>

    <div
      class="text-caption text-disabled"
      style="position: absolute; right: 16px;"
    >
      &copy; {{ (new Date()).getFullYear() }} <span class="d-none d-sm-inline-block">Group 5</span>
      —
      <a
        class="text-decoration-none on-surface"
        href="https://vuetifyjs.com/about/licensing/"
        rel="noopener noreferrer"
        target="_blank"
      >
        Deutsche Bank Hackathon
      </a>
    </div>
  </v-footer>
</template>

<script setup lang="ts">
</script>

<style scoped lang="sass">
</style>

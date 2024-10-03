<template>
    <v-menu   
      v-model="menu"
      :close-on-content-click="false"
      location="end">
      <template v-slot:activator="{ props }">
        <v-btn
          location="end"
          :="mdiAccountTie"
          @click="showDetails()"
          v-bind="props"
        />
      </template>
  
      <v-card> 
        <v-list>
          <v-list-item key="username" :title="username" />
          <v-list-item key="password" :title="password" />
        </v-list>
      </v-card>
    </v-menu>
  </template>
  
<script lang="ts">
import { mdiAccountTie } from '@mdi/js';

const details = ref(false)
const showDetails = computed( () => 
    details.value = !(details.value)
);
const username = computed( () =>
    ''
);

</script>

<style scoped></style>
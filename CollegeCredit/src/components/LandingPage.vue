<template>
  <template v-if="logIn == false">
    <v-container class="d-flex justify-center align-center">
    <v-card width="60%" rounded>
        <userForm />
    </v-card>
  </v-container>
  </template>

  </template>
  
  <script lang="ts" setup>
    const logIn = false;
  </script>
  
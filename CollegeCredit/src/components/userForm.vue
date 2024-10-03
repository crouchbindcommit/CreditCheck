<template>

    <!-- Log In if no Suspicious Activtiy is suspected-->
    <template v-if="suspicousActivity == false">
        <v-text-field
            v-model="username"
            :counter="12"
            :rules="usernameRules"
            label="username"
            hide-details
            required
        >
        </v-text-field>

    </template>

</template>


<script setup lang="ts">

    var email = '';
    var password = ''; 
    var suspicousActivity = false;

    user:
    

</script>
  
  


<style scoped lang="sass"></style>
  
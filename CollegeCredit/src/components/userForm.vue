<template>

    <!-- Log In if no Suspicious Activtiy is suspected-->
   <v-card>
    <v-card-title>Log In</v-card-title>
    <template v-if="suspicousActivity == false">
        <v-text-field
            v-model="username"
            :counter="12"
            :rules="userRules"
            label="username"
            required
        >
        </v-text-field>
        <v-text-field
            v-model="password"
            :counter="15"
            :rules="securePass"
            label="password"
            required
        >
        </v-text-field>

    </template>
   </v-card>

</template>


<script setup lang="ts">
import {ref, computed} from 'vue';

    const username = ref('');
    const password = ref(''); 
    const suspicousActivity = ref(false);

const userRules = computed( () => {
    const rules = [];

    if (username.value == '') rules.push('Username is required.');
    if (username.value.length > 12) rules.push('Username must be less than 12 characters.');
    if(username.value.includes(' ' || '\t' || '\n'))rules.push('Username contains invalid character.')
    return rules;
}
)
    
const securePass = computed( () => {
    const rules = [];

    if (password.value == '') rules.push('Password is required.');
    if (password.value.length != 15) rules.push('password must be 15 characters.');
    if(password.value.includes(' ' || '\t' || '\n'))rules.push('Password contains invalid character.')
    return rules;
}
)

</script>
  
  


<style scoped lang="sass"></style>
  
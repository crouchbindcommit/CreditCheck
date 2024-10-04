<template>
    <v-card>
        <v-card-text> Hello, {{ username }}! </v-card-text>
        <v-card-text> Member Since: {{ creationDate }} </v-card-text>
    </v-card>
    <v-btn @Click="BackToDash()">Back to Dashboard</v-btn>
</template>

<script setup lang="js">
    const username = 'userSteve21';
    const creationDate = '10/03/2024';

    
const router = useRouter();
    function BackToDash() {
        router.push('/creditCheck')
    }
</script>

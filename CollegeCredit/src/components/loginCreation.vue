<template>
    <div>
        <div v-if="page == 1">
            <v-card>
                <v-card-title>Create Account</v-card-title>

                <v-card-text>Enter your First Name.</v-card-text>
                <v-text-field v-model="FirstName" label="First Name" required></v-text-field>

                <v-card-text>Enter your Last Name.</v-card-text>
                <v-text-field v-model="LastName" label="Last Name" required></v-text-field>

                <v-card-text>Enter your Birthday:</v-card-text>
                <VueDatePicker v-model="birthday"></VueDatePicker>

                <v-card-text>Choose how many years you have been a college student:</v-card-text>
                <div>
                    <v-checkbox v-model="yearsInCollege" label="1 Year" value="1"></v-checkbox>
                    <v-checkbox v-model="yearsInCollege" label="2 Years" value="2"></v-checkbox>
                    <v-checkbox v-model="yearsInCollege" label="3 Years" value="3"></v-checkbox>
                    <v-checkbox v-model="yearsInCollege" label="4+ Years" value="4+"></v-checkbox>
                </div>

                <v-card-text>Show how many years of work experience you have:</v-card-text>
                <span style="margin-left: 16px; font-weight: bold;">{{ workExperience }} years</span>
                <v-slider v-model="workExperience" min="0" max="21" step="1" label="Work Experience (years)"></v-slider>

                <v-btn @click="page = 2">Next</v-btn>
            </v-card>
        </div>

        <div v-if="page == 2">
            <v-card-text>Choose a Username:</v-card-text>
            <v-text-field v-model="Username" :counter="12" label="New Username" required></v-text-field>
            <v-card-text>Choose a Password:</v-card-text>
            <v-text-field v-model="Password" :counter="15" label="New Password" required></v-text-field>

            <v-row>
                <v-col cols="6">
                    <v-btn @click="page = 1">Back</v-btn>
                </v-col>
                <v-col cols="6">
                    <v-btn @click="page = 3">Finish</v-btn>
                </v-col>
            </v-row>
        </div>

        <div v-if="page == 3">
            Congratulations! Account setup complete. 
        </div>
        <div v-if="page == 3">
            <v-btn @Click="goToCreditCheck()">Click Continue to Credit Check</v-btn>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'; // Ensure to import ref
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';
import { useRouter } from 'vue-router';
import CreditCheck from './views/CreditCheck.vue'; // Ensure the path is correct

const FirstName = ref('');
const LastName = ref('');
const workExperience = ref(0);
const yearsInCollege = ref<string[]>([]); // To hold selected college years
const birthday = ref(new Date()); // Use a single date value
const page = ref(1);

const Username = ref('');
const Password = ref('');

const router = useRouter();

function goToCreditCheck(){
    router.push('/creditCheck'); 
}
</script>
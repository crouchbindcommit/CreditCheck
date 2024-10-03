<template>
  <div class="white-background fill-height d-flex justify-center align-center">
    <v-container class="pa-5" style="max-width: 600px;">
      <v-card elevation="2" class="pa-4 white-card">
        <div v-if="page == 1">
          <v-card-title class="headline mb-3 text-black">Create Account</v-card-title>

          <v-card-text class="mb-2 text-black">Enter your First Name</v-card-text>
          <v-text-field v-model="FirstName" label="First Name" outlined hide-details dense required class="text-gray"></v-text-field>

          <v-card-text class="mt-4 mb-2 text-black">Enter your Last Name</v-card-text>
          <v-text-field v-model="LastName" label="Last Name" outlined hide-details dense required class="text-gray"></v-text-field>

          <v-card-text class="mt-4 mb-2 text-black">Enter your Birthday</v-card-text>
          <VueDatePicker v-model="birthday" class="mt-2" />

          <v-card-text class="mt-4 mb-2 text-black">How many years have you been a college student?</v-card-text>
          <v-row class="text-black">
            <v-col cols="6">
              <v-checkbox v-model="yearsInCollege" label="1 Year" value="1"></v-checkbox>
            </v-col>
            <v-col cols="6">
              <v-checkbox v-model="yearsInCollege" label="2 Years" value="2"></v-checkbox>
            </v-col>
            <v-col cols="6">
              <v-checkbox v-model="yearsInCollege" label="3 Years" value="3"></v-checkbox>
            </v-col>
            <v-col cols="6">
              <v-checkbox v-model="yearsInCollege" label="4+ Years" value="4+"></v-checkbox>
            </v-col>
          </v-row>

          <v-card-text class="mt-4 mb-2 text-black">Work Experience (years)</v-card-text>
          <v-row align="center" class="mt-2">
            <v-col>
              <span class="font-weight-bold text-black">{{ workExperience }} years</span>
            </v-col>
          </v-row>
          <v-slider
            v-model="workExperience"
            min="0"
            max="21"
            step="1"
            class="mt-1"
            ticks="always"
          ></v-slider>

          <v-btn class="mt-4" color="#051B35" block @click="page = 2">Next</v-btn>
        </div>

        <div v-if="page == 2">
          <v-card-title class="headline mb-3 text-black">Account Details</v-card-title>

          <v-card-text class="mb-2 text-black">Choose a Username</v-card-text>
          <v-text-field v-model="Username" :counter="12" label="New Username" outlined hide-details dense required class="text-gray"></v-text-field>

          <v-card-text class="mt-4 mb-2 text-black">Choose a Password</v-card-text>
          <v-text-field v-model="Password" :counter="15" label="New Password" outlined hide-details dense required class="text-gray"></v-text-field>

          <v-row class="mt-4">
            <v-col cols="6">
              <v-btn color="#858B91" block @click="page = 1">Back</v-btn>
            </v-col>
            <v-col cols="6">
              <v-btn color="#051B35" block @click="page = 3">Finish</v-btn>
            </v-col>
          </v-row>
        </div>

        <div v-if="page == 3" class="text-center">
          <v-card-title class="headline mb-4 text-black">Congratulations!</v-card-title>
          <v-card-text class="mb-4 text-black">Account setup complete.</v-card-text>

          <v-btn color="#051B35" block @click="goToCreditCheck">Continue to Credit Check</v-btn>
        </div>
      </v-card>
    </v-container>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';
import { useRouter } from 'vue-router';

const FirstName = ref('');
const LastName = ref('');
const workExperience = ref(0);
const yearsInCollege = ref<string[]>([]);
const birthday = ref(new Date());
const page = ref(1);
const Username = ref('');
const Password = ref('');

const router = useRouter();

function goToCreditCheck() {
  router.push('/creditCheck');
}
</script>

<style scoped>
.white-background {
  background-color: white;
}

.fill-height {
  height: 100vh;
}

.white-card {
  background-color: white;
}

.v-text-field {
  background-color: #f5f5f5; /* Light gray for input field */
}

.text-black {
  color: black;
}

.text-gray {
  color: #D3D3D4;
}
</style>

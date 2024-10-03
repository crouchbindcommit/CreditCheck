// src/router.js
import { createRouter, createWebHistory } from 'vue-router';
import CreditCheck from './CreditCheck.vue'; // Adjust this import too

const routes = [
    {path: '/creditCheck', component: CreditCheck }
    
    // Add more routes as needed
];

const router = createRouter({
    history: createWebHistory(), // Use HTML5 History Mode
    routes, // short for `routes: routes`
});

export default router;

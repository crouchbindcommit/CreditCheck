// src/router.js
import { createRouter, createWebHistory } from 'vue-router';
import Home from './views/Home.vue'; 
import CreditCheck from './views/CreditCheck.vue'; // Adjust this import too
import Account from './views/Account.vue'; // Adjust this import too

const routes = [
    {
        path: '/credit-check',
        component: CreditCheck, // The component to load for this route
    },
    {
        path: '/account',
        component: Account, // The component to load for this route
    },
    // Add more routes as needed
];

const router = createRouter({
    history: createWebHistory(), // Use HTML5 History Mode
    routes, // short for `routes: routes`
});

export default router;

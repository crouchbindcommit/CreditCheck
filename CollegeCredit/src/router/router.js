// src/router.js
import { createRouter, createWebHistory } from 'vue-router';
import Home from './views/Home.vue'; 
import CreditCheck from './views/CreditCheck.vue'; // Adjust this import too
import Account from './views/Account.vue'; // Adjust this import too
import SignOut from './views/SignOut.vue'; // Adjust this import too
import Report from './views/report.vue'; // Adjust this import too
const routes = [
    {
        path: '/creditCheck',
        component: CreditCheck, // The component to load for this route
    },
    {
        path: '/account',
        component: Account, // The component to load for this route
    },
    {
        path: '/signOut',
        component: SignOut, // The component to load for this route
    },
    {
        path: '/report',
        component: Report, // The component to load for this route
    },
    // Add more routes as needed
];

const router = createRouter({
    history: createWebHistory(), // Use HTML5 History Mode
    routes, // short for `routes: routes`
});

export default router;

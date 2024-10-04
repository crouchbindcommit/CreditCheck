<template>
    <p> Credit Report for {{ username }}</p>
    <h1> {{ fname }} {{ lname }} : {{ creditScore }}</h1>
    <p> Your credit score is {{ creditScoreRank }}. CommonCreditApp uses the following to calculate your credit score:
        <v-list>
            <v-list-item v-for="(item, index) in factors" :key="index">
                {{ item.key }}
            </v-list-item>
        </v-list>
        We also use your payment history. 
        Your factors are:
        <v-list>
            <v-list-item v-for="(item, index) in factors" :key="index">
                {{ item.key }}: {{ item.value }}
            </v-list-item>
        </v-list>
    </p>
    <v-btn @click="downloadCSV">Download Payment History CSV</v-btn>
</template>

<script lang="ts" setup>
    const username = 'userSteve21';
    const fname = 'Steve';
    const lname = 'Doe';
    const creationDate = '10/03/2024';
    const creditScore = '681';
    const creditScoreRank = 'very good';

    const factors = [
        { key: 'GPA', value: '3.2' },
        { key: 'Year in School', value: '3' },
        { key: 'Major Category', value: 'STEM' },
        { key: 'Work History (Years)', value: '5' },
        { key: 'Parental Income', value: '165,000/yr' },
    ];
    
    const paymentHistory = 'paymentHistory.csv';

    function downloadCSV() {
        // Create a link element
        const link = document.createElement('a');
        link.href = paymentHistory; // Set the URL to the CSV file
        link.download = 'paymentHistory.csv'; // Set the name of the downloaded file
        document.body.appendChild(link); // Append to the body (necessary for Firefox)
        link.click(); // Programmatically click the link to trigger the download
        document.body.removeChild(link); // Remove the link after download
    }
</script>

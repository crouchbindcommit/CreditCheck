<template>
  <v-app>
    <v-navigation-drawer style="background-color: #10253D;" app>
     <p class="font-weight-bold" style="padding-top: 30px; padding-left: 20px; font-size: 23px; color: white;">Common Credit App</p> <!-- Inline styles for dark blue color -->

        <v-list style="padding-top: 30px;">
            <v-list-item v-for="item in items" :key="item.title" @click="goTo(item.link)">
            <v-list-item-icon>
                <div style="display: flex; align-items: center;">
                <v-icon>{{ item.icon }}</v-icon>
                <v-list-item-title class="item-title font-weight-light" style="margin-left: 8px;">{{ item.title }}</v-list-item-title>
                </div>
            </v-list-item-icon>
            </v-list-item>
        </v-list>
    </v-navigation-drawer>


    <v-app-bar color="white" >
      <v-toolbar-title class="font-weight-bold">Dashboard</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn icon @Click="goTo('/account')">
        <v-icon>mdi-account</v-icon>
      </v-btn>
      <v-btn icon @Click="goTo('/signOut')">
        <v-icon>mdi-logout</v-icon>
      </v-btn>
    </v-app-bar>

    <v-container fluid class="full-page-background" style="background-color: #FAFCFF; padding-top: 50px; padding-left: 275px;">
    <div> 
        <p class="font-weight-light" style="padding-top: 30px; padding-bottom: 30px; font-size: 25px; color: #10253D;">Hello Steve!</p> <!-- Inline styles for dark blue color -->
    </div>
      
      <v-row>
        <v-col cols="12" md="4">
          <v-card style="background-color: #F0F2F5;">
            <v-card-title class="d-flex justify-center">
                <div style="display: flex; flex-direction: column; align-items: center;">
                    <span class="font-weight-medium" style="font-size: 12px; color: black;">YOUR CREDIT SCORE</span>
                    <h1 style="padding-top:0px; margin-top:0px; font-size: 70px; color: #16202A;">{{ cibilScore }}</h1>
                    <v-btn @click="goTo('/report')" color="#10253D" class="mt-2">See Why</v-btn>
                    </div>
                </v-card-title>
                <v-card-text>
                    <v-progress-linear :value="cibilScore" height="20" color="" ></v-progress-linear>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      items: [
        { title: 'Score & Report', link: '/report', icon: 'mdi-file-document' },
        { title: 'Credit Summary', link: '/summary', icon: 'mdi-file-chart' },
        { title: 'Score History', link: '/history', icon: 'mdi-history' },
        { title: 'Where You Stand', link: 'https://www.debt.org/students/credit-scores/', icon: 'mdi-map' },
      ],
      cibilScore: 681,
      lastUpdated: '29th May \'23',
      showAccount: false,
    };
  },
  methods: {
    goTo(link) {
      this.$router.push(link); // Navigate to the selected route
    },
   openReportInNewTab() {
    const reportUrl = router.resolve({ path: '/report' }).href; // Get the full URL for the report route
    window.open(reportUrl, '_blank'); // Open in a new tab
  },

    refreshScore() {
      // Logic to refresh the score
      console.log('Score refreshed');
    },
    viewReport() {
      // Logic to view report
      console.log('View report clicked');
    },
    printReport() {
      // Logic to print report
      console.log('Print report clicked');
    },
    watchVideo() {
      // Logic to watch video
      console.log('Watch video clicked');
    },
  },
};
</script>

<style scoped>
body, html {
  background-color: blue; /* Set the background color to white */
  margin: 0;
  height: 100%;
}

.full-page-background {
  min-height: 100vh; /* Ensure the container fills the full height of the viewport */
  display: flex;
  flex-direction: column;
  justify-content: flex-start; /* Align items to the start */
}

.v-card {
  margin: 20px;
}
</style>

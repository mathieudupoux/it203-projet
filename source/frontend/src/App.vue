<template>
  <div id="app" class="block">
    <Navigation></Navigation>
    <div class="container is-fluid">
      <router-view></router-view>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Navigation from "./components/navigation.vue";


export default defineComponent({
  name: "App",
  components: { Navigation },
});
</script>

<style>
/* import style bulma */
@import "~bulma/css/bulma.css";
@import '@fortawesome/fontawesome-free/css/all.css';
@import "~bulma-calendar/dist/css/bulma-calendar.min.css";
</style>

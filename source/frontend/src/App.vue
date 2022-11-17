<template>
  <div id="app" class="container is-max-desktop"></div>
  <Games></Games>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Games from "./components/games.vue";

export default defineComponent({
  name: "App",
  components: { Games },
});
</script>

<style>
/* import style bulma */
@import "~bulma/css/bulma.css";
</style>

<template>
  <div class="container">
    <h1 class="title">Jeux</h1>
    <h2 class="subtitle">Jeux classés par thèmes</h2>
    <p>Vous pouvez ici sélectionner les jeux enregistrés selon leur thème :
      <select class="dropdown-content" @change="toggleThemeMenu($event)">
        <option class="dropdown-content" value="" selected disabled>Choisir un thème</option>
        <option class="dropdown-item" v-for="menuItem in themeMenuItems" :key="menuItem.numero_theme"
          :value="menuItem.numero_theme">
          {{ menuItem.theme }}
        </option>
      </select>
    </p>

    <table class="table is-striped is-bordered mt-2 is-fullwidth">
      <thead>
        <tr>
          <th>ID</th>
          <th>Nom</th>
          <th>Mécanique</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in items" :key="item.numero_jeu">
          <td>{{ item.numero_jeu }}</td>
          <td>{{ item.nom }}</td>
          <td>{{ item.mecanisme }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script lang="ts">
// import axios
import axios from "axios";
import { defineComponent } from "vue";

export default defineComponent({
  name: "GamesList",
  data() {
    return {
      themeMenuActive: false,
      themeMenuItems: [],
      items: [],
      selectedTheme: "",
    };
  },

  created() {
    this.getThemeNames();
  },

  methods: {
    toggleThemeMenu(e: any) {
      this.selectedTheme =
        e.target.options[e.target.options.selectedIndex].text;
      this.getGames();
    },

    async getThemeNames() {
      try {
        const response = await axios.get(
          "http://localhost:3000/games/themeNames"
        );
        this.themeMenuItems = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    // Get All Games
    async getGames() {
      try {
        const response = await axios.get(`http://localhost:3000/games/list/${this.selectedTheme}`);
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
    },
  },
});
</script>

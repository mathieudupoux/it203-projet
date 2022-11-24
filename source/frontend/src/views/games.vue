<template>
  <div class="block">
    <h1 class="title">Jeux</h1>
    Vous trouverez ici la liste des jeux recensés dans notre base de donnée. Celle-ci peut être filtrée par thème si
    nécessaire.
    <p>Trier par thème :
      <select class="dropdown-content" @change="toggleThemeMenu($event)">
        <option class="dropdown-content" value="" selected enabled></option>
        <option class="dropdown-item" v-for="menuItem in themeMenuItems" :key="menuItem.numero_theme"
          :value="menuItem.numero_theme">
          {{ menuItem.theme }}
        </option>
      </select>
    </p>

    <div class="container">
      <div class="block" v-for="item in items" :key="item.numero_jeu">
        <GameView :jeu='item'></GameView>
      </div>
    </div>

  </div>
</template>

<script lang="ts">
// import axios
import GameView from "@/components/gameView.vue";
import axios from "axios";
import { defineComponent } from "vue";

export default defineComponent({
  name: "GamesList",
  components: { GameView },
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

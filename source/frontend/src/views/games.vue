<template>
  <div class="block">
    <h1 class="title">Jeux</h1>
    Vous trouverez ici la liste des jeux recensés dans notre base de données. Celle-ci peut être filtrée par thème si
    nécessaire.
    <p>Trier par thème :
      <ThemeList v-model="selectedTheme"></ThemeList>
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
import ThemeList from "@/components/utils/ThemeList.vue";

import axios from "axios";
import { defineComponent } from "vue";
import { Game } from '../types/Game';

export default defineComponent({
  name: "GamesList",
  components: { ThemeList, GameView },
  data() {
    return {
      themeMenuActive: false,
      items: [] as Game[],
      selectedTheme: "",
    };
  },

  created() {
    this.getGames();
  },

  watch: {
    selectedTheme() {
      this.getGames();
    }
  },

  methods: {
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

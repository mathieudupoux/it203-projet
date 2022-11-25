<template>
  <div class="block">
    <h1 class="title">Derniers commentaires</h1>
    Vous trouverez ici la liste des derniers commentaires données sur la plate-forme.

    <div class="container">
      <div class="block">
        <CommentView></CommentView>
      </div>
    </div>

  </div>
</template>

<script lang="ts">
// import axios
import CommentView from "@/components/commentView.vue";
import axios from "axios";
import { defineComponent } from "vue";

export default defineComponent({
  name: "CommentList",
  components: { CommentView },
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

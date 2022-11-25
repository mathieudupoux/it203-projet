<template>
  <div class="block">
    <h1 class="title">Derniers commentaires</h1>
    Vous trouverez ici la liste des derniers commentaires données sur la plate-forme.

    <div class="container">
      <div class="block" v-for="comments in commentsItems" :key="comments.numero_avis">
        <CommentView :avis='comments'></CommentView>
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
      commentsItems: [],
      items: [],
      selectedTheme: "",
    };
  },

  created() {
    this.getAllComments();
  },

  methods: {

    async getAllComments() {
      try {
        const response = await axios.get(
          "http://localhost:3000/comments"
        );
        this.commentsItems = response.data;
      } catch (err) {
        console.log(err);
      }
    }
  },
});
</script>

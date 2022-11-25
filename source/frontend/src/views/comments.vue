<template>
  <div class="block">
    <h1 class="title">Top commentaire</h1>
    Voici le commentaire le plus jugé du site :
    <div class="block">
      <CommentView :avis='mostDebatedComment'></CommentView>
    </div>
    <h1 class="title">Commentaires récents</h1>
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
      commentsItems: [],
      mostDebatedComment: String,
    };
  },

  created() {
    this.getMostDebatedComment();
    this.getAllComments();
  },

  methods: {
    async getMostDebatedComment() {
      try {
        const response = await axios.get(
          "http://localhost:3000/comments/mostDebated"
        );
        this.mostDebatedComment = response.data[0];
      } catch (err) {
        console.log(err);
      }
    },

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

<template>
  <div class="block">
    <h1 class="title">Top commentaire</h1>
    Voici le commentaire le plus jugé du site :
    <div class="card">
      <header class="card-header subtitle">
        <p class="card-header-title">Sur {{ mostDebatedComment.nom }} :</p>
      </header>
      <CommentView :avis='mostDebatedComment'></CommentView>
    </div>
  </div>
  <div class="block">
    <h1 class="title">Tous les commentaires</h1>
    <div class="tabs is-centered">
      <ul>
        <li :class="viewMostRecent" @click="getMostRecentComments()">
          <a>
            <span>Les plus récents</span>
            <span class="icon is-small"><i class="fas fa-clock" aria-hidden="true"></i></span>
          </a>
        </li>
        <li :class="viewMostReliable" @click="getMostReliableComments()">
          <a>
            <span>Les plus fiables</span>
            <span class="icon is-small"><i class="far fa-star-half-stroke" aria-hidden="true"></i></span>
          </a>
        </li>
      </ul>
    </div>
    <div class="container">
      <div class="field is-horizontal">
        <div class="field-label is-normal">
          <label class="label">Nombre d'éléments à afficher</label>
        </div>
        <div class="field-body">
          <div class="field">
            <p class="control">
              <input v-model="nbRecentComments" @keyup.enter="getMostRecentComments()" type="number" min="0" max="100"
                class="input" />
              <button @click="getMostRecentComments()" class="button is-primary">Valider</button>
            </p>
          </div>
        </div>
      </div>
      <div class="block" v-for="comment in commentsItems" :key="comment.numero_avis">
        <div class="card">
          <header class="card-header subtitle">
            <p class="card-header-title">Sur {{ comment.nom }} :</p>
          </header>
          <CommentView :avis='comment'></CommentView>
        </div>
      </div>
    </div>

  </div>
</template>

<script lang="ts">
// import axios
import CommentView from "@/components/commentView.vue";
import axios from "axios";
import { defineComponent } from "vue";
import { Comment } from '../types/Comment';

export default defineComponent({
  name: "CommentList",
  components: { CommentView },
  data() {
    return {
      viewMostRecent: "is-active",
      viewMostReliable: "",
      commentsItems: [] as Comment[],
      mostDebatedComment: {} as Comment,
      nbRecentComments: 100,
    };
  },

  created() {
    this.getMostDebatedComment();
    this.getMostReliableComments();
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

    async getMostRecentComments() {
      try {
        const response = await axios.get(
          `http://localhost:3000/comments/all/mostRecent/${this.nbRecentComments}`
        );
        this.viewMostRecent = "is-active";
        this.viewMostReliable = "";
        this.commentsItems = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    async getMostReliableComments() {
      try {
        const response = await axios.get(
          `http://localhost:3000/comments/all/mostReliable/`
        );
        this.viewMostRecent = "";
        this.viewMostReliable = "is-active";
        this.commentsItems = response.data;
      } catch (err) {
        console.log(err);
      }
    }
  },
});
</script>

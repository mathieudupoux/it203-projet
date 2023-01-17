<template>
  <div class="block">
    <div class="block">
      <h1 class="title">Top commentaire</h1>
      <p>Voici le commentaire le plus jugé du site :</p>
      <div class="card">
        <div class="block" v-for="comment in mostDebatedComment" :key="comment.numero_avis">
          <div class="card">
            <!--<header class="card-header">
              <p class="card-header-title subtitle">Sur {{ mostDebatedConfig.nom_jeu }} +
                {{ mostDebatedConfig.nom_extension }}</p>
            </header>-->
            <CommentView :avis='comment' @reload="update"></CommentView>
          </div>
        </div>
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
        <div class="field is-horizontal" :class="viewMostRecentNb">
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
            <CommentView class="card-content" :avis='comment' @reload="update"></CommentView>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
// import axios
import CommentView from "../components/commentView.vue";
import axios from "axios";
import { defineComponent } from "vue";
import { Comment } from '../types/Comment';
import { Config } from '../types/Config'

export default defineComponent({
  name: "CommentList",
  components: { CommentView },
  data() {
    return {
      viewMostRecent: "is-active",
      viewMostReliable: "",
      viewMostRecentNb: "",
      commentsItems: [] as Comment[],
      mostDebatedComment: [] as Comment[],
      mostDebatedConfig: {} as Config,
      nbRecentComments: 100,
    };
  },

  created() {
    this.getMostDebatedComment();
    this.getMostRecentComments();
  },

  methods: {
    update() {
      this.getMostDebatedComment();
      this.getMostRecentComments();
    },

    async getMostDebatedConfig() {
      try {
        await axios.get(
          `http://localhost:3000/games/config/FromID/${this.mostDebatedComment[0].numero_avis}`
        ).then(res => {
          this.mostDebatedComment = res.data;
        });
      } catch (err) {
        console.log(err);
      }
    },

    async getMostDebatedComment() {
      this.mostDebatedComment = [];
      try {
        await axios.get(
          "http://localhost:3000/comments/mostDebated"
        ).then(res => {
          this.mostDebatedComment = res.data;
          this.mostDebatedConfig = res.data[0]
        });
      } catch (err) {
        console.log(err);
      }
    },

    async getMostRecentComments() {
      this.commentsItems = [];
      try {
        await axios.get(
          `http://localhost:3000/comments/all/mostRecent/${this.nbRecentComments}`
        ).then(res => {
          this.viewMostRecent = "is-active";
          this.viewMostReliable = "";
          this.viewMostRecentNb = "";
          this.commentsItems = res.data;
        })
      } catch (err) {
        console.log(err);
      }
    },

    async getMostReliableComments() {
      this.commentsItems = [];
      try {
        await axios.get(
          `http://localhost:3000/comments/all/mostReliable/`
        ).then(res => {
          this.viewMostRecent = "";
          this.viewMostReliable = "is-active";
          this.viewMostRecentNb = "is-hidden";
          this.commentsItems = res.data;
        })
      } catch (err) {
        console.log(err);
      }
    }
  },
});
</script>

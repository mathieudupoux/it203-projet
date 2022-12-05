<template>

  <div class="box">
    <article class="media">
      <div class="media-content">
        <div class="field">
          <p class="control">
            <textarea class="textarea" placeholder="Votre commentaire" v-model="item.commentaire"></textarea>
          </p>
        </div>
        <nav class="level">
          <div class="level-left">
            <div class="level-item">
              <p class="control subtitle"><label class="label">Joueur</label></p>
            </div>
            <div class="level-item">
              <div class="field">
                <p class="control">
                  <select class="dropdown-content" v-model="item.numero_personne">
                    <option class="dropdown-item" v-for="player in players" :key="player.numero_personne"
                      :value="player.numero_personne">
                      {{ player.pseudo }}
                    </option>
                  </select>
                </p>
              </div>
            </div>

            <div class="level-item">
              <p class="control"><label class="label">Note</label></p>
            </div>
            <div class="level-item">
              <div class="field">
                <p class="control">
                  <select class="dropdown-content" v-model="item.note">
                    <option class="dropdown-item" v-for="n in 21" :key="n" :value="(n - 1)">
                      {{ n - 1 }}
                    </option>
                  </select>
                </p>
              </div>
            </div>

            <div class="level-item">
              <p class=control><label class="label">Configurations disponibles</label></p>
            </div>
            <div class="level-item">
              <div class="field">
                <p class="control">
                  <select class="dropdown-content" v-model="item.numero_configuration">
                    <option class="dropdown-item" v-for="config in configList" :key="config.numero_configuration"
                      :value="config.numero_configuration">
                      {{ config.nom_jeu }} avec l'extension {{ config.nom_extension }}
                    </option>
                  </select>
                </p>
              </div>
            </div>
          </div>
          <div class="level-right">
            <div class="level-item">

              <button class="button is-info" v-on:click="notif">Commenter</button>
            </div>
          </div>
        </nav>
      </div>
    </article>
    <div class="field">
    </div>

    <div class="notification is-info is-light">
      <button class="delete"></button>
      Requete sql ici !
    </div>
  </div>

</template>
  
<script lang="ts">
import { defineComponent } from "vue";
import axios from "axios";
import { Comment } from "../types/Comment";
import { Player } from "../types/Player";
import { Config } from "../types/Config";

export default defineComponent({

  props: ["mainGame"],

  data() {
    return {
      configList: [] as Array<Config>,
      players: [] as Array<Player>,
      item: {} as Comment,
    };

  },

  created() {
    this.getPlayers();
    this.getConfigList();
  },

  methods: {
    notif() {
      console.log("Le bouton a été activé");
      console.log(this.item);
      this.postNewComment();
    },

    getCurrentDate() {
      let d = new Date;
      return d.toISOString().slice(0, 10) + " " + d.toISOString().slice(11, 19);
    },

    async getConfigList() {
      const res = await axios.get(`http://localhost:3000/games/config/${this.mainGame}`);
      this.configList = res.data;
    },

    async getPlayers() {
      const res = await axios.get(`http://localhost:3000/players`);
      this.players = res.data;
    },

    async postNewComment() {
      try {
        this.item.date_avis = this.getCurrentDate();
        console.log("verif arg : note :" + this.item.note + " avis :" + this.item.commentaire);
        const res = await axios.post(
          `http://localhost:3000/comments/new`, this.item);
        console.log("My res", res);
      } catch (err) {
        console.log("Erreur pour ajout d'une personne");
      }
    },
  }
});
</script>
  
  <!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
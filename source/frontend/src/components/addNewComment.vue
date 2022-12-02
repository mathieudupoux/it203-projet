<template>


  <div class="box">
    <h1 class="title">Commenter</h1>

    <div class="field">
      <label class="label">Joueur</label>
      <select class="dropdown-content" v-model="item.numero_personne">
        <option class="dropdown-content" value="" selected enabled></option>
        <option class="dropdown-item" v-for="player in players" :key="player.numero_personne"
          :value="player.numero_personne">
          {{ player.pseudo }}
        </option>
      </select>
    </div>

    <div class="field">
      <label class="label">Note</label>
      <select class="dropdown-content" v-model="item.note">
        <option class="dropdown-content" value="" selected enabled></option>
        <option class="dropdown-item" v-for="n in 21" :key="n" :value="n">
          {{ n - 1 }}
        </option>
      </select>
    </div>

    <div class="field">
      <label class="label">Configurations disponibles</label>
      <select class="dropdown-content" v-model="item.numero_configuration">
        <option class="dropdown-content" value="" selected enabled></option>
        <option class="dropdown-item" v-for"config in configList" :key="config.numero_configuration"
          :value="config.numero_configuration">
          {{ (config.nomJeu }} "avec l'extension" {{ config.nomExtension }}
        </option>
      </select>
    </div>
    <div class="field">
      <label class="label">Commentaire</label>
      <textarea class="textarea" placeholder="Votre commentaire" v-model="item.commentaire"></textarea>
    </div>

    <button class="button is-info" v-on:click="notif">Commenter</button>


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

export default defineComponent({
  data() {
    return {
      configList: [] as Array<Config>,
      players: [] as Array<Player>,
      item: {} as Comment,
    };

  },

  created() {
    this.getPlayers();
  },

  methods: {
    notif() {
      console.log("Le bouton a été activé");
      console.log(this.item);
      this.postNewComment();
    },

    getCurrentDate() {
      let currentDate = new Date;
      return currentDate.toISOString();
    },

    async getPlayers() {
      const res = await axios.get(`http://localhost:3000/players`);
      this.players = res.data;
    },

    async postNewComment() {
      try {
        let currentDate = new Date;
        this.item.date_avis = currentDate.toISOString();
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
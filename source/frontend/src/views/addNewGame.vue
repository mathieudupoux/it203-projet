<template>


  <div class="box">
    <h1 class="title">Ajouter un jeu</h1>

    <div class="field">
      <label class="label">Nom du jeu</label>
      <div class="control">
        <input class="input" v-model.lazy="item.nom_jeu" />
      </div>
    </div>

    <div class="field">
      <label class="label">Editeur</label>
      <div class="control">
        <input class="input" v-model.lazy="item.editeur" />
      </div>
    </div>

    <div class="field">
      <label class="label">Date de parution</label>
      <div class="control">
        <input class="input" v-model.lazy="item.date_de_parution" />
      </div>
    </div>

    <div class="field">
      <label class="label">Type de jeu</label>
      <div class="control">
        <input class="input" v-model.lazy="item.type_de_jeu" />
      </div>
    </div>

    <div class="field">
      <label class="label">Duree du jeu</label>
      <div class="control">
        <input class="input" v-model.lazy="item.duree_jeu" />
      </div>
    </div>

    <button class="button is-info" v-on:click='addGame'>Soumettre</button>


    <div class="notification is-info is-light">
      <button class="delete"></button>
      Requete sql ici !
    </div>
  </div>

</template>
  
<script lang="ts">
import axios from "axios";
import { defineComponent } from "vue";


export default defineComponent({
  name: "addGameRequest",
  data() {
    return {
      item: {
        nom_jeu: "",
        editeur: "",
        date_de_parution: "",
        type_de_jeu: "",
        duree_jeu: ""
      }
    };
  },
  created() {
    this.addGame();
  },

  methods: {
    async addGame() {
      try {
        const response = await axios.post(`http://localhost:3000/games/add`,this.item);
      } catch (err) {
        console.log(err);
      }
    },
  },
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


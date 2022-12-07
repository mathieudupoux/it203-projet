<template>

  <div class="box">
    <h1 class="title">Ajouter une extension</h1>

    <div class="field">
      <label class="label">Nom de l'extension</label>
      <div class="control">
        <input class="input" v-model.lazy="item.nom_extension" />
      </div>
    </div>

    <div class="field">
      <label class="label">Date de parution</label>
      <div class="control">
        <input type="date" class="demo input" v-model.lazy="item.date_de_parution" />
      </div>
    </div>


    <div class="field">
      <label class="label">Jeu associé à l'extension</label>
      <div class="control">
        <select class="dropdown-content"  v-model="selectedGame">
          <option v-for="menuItem in GameMenuItems" :key="menuItem.numero_jeu" v-bind:value="menuItem.nom">

              {{ menuItem.nom}}
          </option>
        </select>
      </div>
    </div>

  

    <router-link class="button is-primary" to="/games" v-on:click="getGameConfig(); AddExtension()">Soumettre</router-link>

    <div class="notification is-info is-light">
      <button class="delete"></button>
    </div>
  </div>


</template>
  
<script lang="ts">
import axios from "axios";
import { defineComponent } from "vue";
import { Game } from "../types/Game";
import { Config } from "../types/Config";
import bulmaCalendar from "bulma-calendar";


export default defineComponent({
  name: "addExtensionRequest",
  data() {
    return {
      value: "",
      item: {
        nom_extension: "",
        date_de_parution: "",
      },
      GameMenuItems: [] as Array<Game>,
      ConfigMenuItems: [] as Array<Config>,
      selectedGame: "",
      dateTime: bulmaCalendar.attach(".date", {
        type: "datetime" 
      }),
    };
  },
  created() {
    this.getGameNames();
  },

  methods: {
    async getGameNames() {
      try {
        const response = await axios.get("http://localhost:3000/games/");
        this.GameMenuItems = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    async getGameConfig() {
      try {
        const response = await axios.get(`http://localhost:3000/games/configByGameName?nom_jeu=${this.selectedGame}`);
        this.ConfigMenuItems = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    async AddExtension(){  
      console.log("Try to add Extension ...")
      try {
        await axios.post(`http://localhost:3000/games/extensions/add?nom_jeu=${this.selectedGame}&nom_extension=${this.item.nom_extension}&date_de_parution=${this.item.date_de_parution}`);
        console.log("Success !")
      }
      catch (err) {
        console.log(err);
        console.log("Error !")
      }

      console.log("Try to link Extension ...")
      this.ConfigMenuItems.forEach(el => {
          try {
            axios.post(`http://localhost:3000/games/extensions/link?nom_extension=${this.item.nom_extension}&num_config=${el.numero_configuration}`);
            console.log("Success !")
          }
          catch (err) {
            console.log(err);
            console.log("Error !")
          }
      });
    },
  },
});

</script>

  <!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/* @import "~bulma-calendar/dist/css/bulma-calendar.min.css"; */

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

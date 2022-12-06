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
        <input type="date" class="demo input" v-model.lazy="item.date_de_parution" />
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

    <div class="field">
      <label class="label">Thème</label>
      <div class="control">
        <ul class="is-info">
          <li v-for="menuItem in themeMenuItems" :key="menuItem.numero_theme" :value="menuItem.numero_theme">
            <div class="b-checkbox is-info">
              <input type="checkbox" :id="'themeCheckbox' + menuItem.numero_theme" :value="menuItem.theme"
                class="styled is-info" v-model="selectedTheme">
              <label :for="'checkbox' + menuItem.numero_theme" class="checkbox"> {{ menuItem.theme
              }}</label>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <div class="field">
      <label class="label">Mécaniques</label>
      <div class="control">
        <ul class="is-info">
          <li v-for="menuItem in mechanicMenuItems" :key="menuItem.numero_mecanique" :value="menuItem.numero_mecanique">
            <div class="b-checkbox is-info">
              <input type="checkbox" :id="'mechanicsCheckbox' + menuItem.numero_mecanique" :value="menuItem.mecanisme"
                class="styled is-info" v-model="selectedMechanics">
              <label :for="'mechanicCheckbox' + menuItem.numero_mecanique" class="checkbox"> {{ menuItem.mecanisme
              }}</label>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <button class="button is-info" v-on:click="addGame">Soumettre</button>

    <div class="notification is-info is-light">
      <button class="delete"></button>
    </div>
  </div>


</template>
  
<script lang="ts">
import axios from "axios";
import { defineComponent } from "vue";
import { Theme } from "../types/Theme";
import { Mechanic } from "@/types/Mechanic";
import bulmaCalendar from "bulma-calendar";


export default defineComponent({
  name: "addGameRequest",
  data() {
    return {
      value: "",
      themeMenuItems: [] as Array<Theme>,
      mechanicMenuItems: [] as Array<Mechanic>,
      item: {
        nom_jeu: "",
        editeur: "",
        date_de_parution: "",
        type_de_jeu: "",
        duree_jeu: "",
      },
      selectedTheme: [] as Array<Theme>,
      selectedMechanics: [] as Array<Mechanic>,
      dateTime: bulmaCalendar.attach(".date", {
        type: "datetime"
      }),
    };
  },
  created() {
    this.getThemeNames();
    this.getMecanicName();
  },

  methods: {
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

    async getMecanicName() {
      try {
        const response = await axios.get(
          "http://localhost:3000/games/MechanicNames"
        );
        this.mechanicMenuItems = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    async addGame() {
      console.log("Try to add Game ...")
      try {
        await axios.post(`http://localhost:3000/games/add?nom=${this.item.nom_jeu}&editeur=${this.item.editeur}&date_de_parution=${this.item.date_de_parution}&type_de_jeu=${this.item.type_de_jeu}&duree=${this.item.duree_jeu}`);
        console.log("Success !")
      } catch (err) {
        console.log(err);
        console.log("Error !")
      }
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


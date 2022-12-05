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
        <ThemeCheckBox></ThemeCheckBox> 
      </div>
    </div>

    <div class="field">
      <label class="label">Mécaniques</label>
      <div class="control">
        <MechanicCheckBox></MechanicCheckBox>
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
import ThemeCheckBox from "@/components/utils/ThemeCheckbox.vue";
import MechanicCheckBox from "@/components/utils/MecanicCheckbox.vue";
import bulmaCalendar from "bulma-calendar";


export default defineComponent({
  name: "addGameRequest",
  components : { ThemeCheckBox, MechanicCheckBox},
  data() {
    return {
      value: "",
      item: {
        nom_jeu: "",
        editeur: "",
        date_de_parution: "",
        type_de_jeu: "",
        duree_jeu: "",
        selectedMecanics: MechanicCheckBox.data().selectedMecanics,
        selectedThemes:  ThemeCheckBox.data().selectedThemes,
        
      },
      dateTime: bulmaCalendar.attach(".date", {
        type: "datetime"
      }),
    };
  },
  // created() {
  //   this.addGame();
  // },

  methods: {
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


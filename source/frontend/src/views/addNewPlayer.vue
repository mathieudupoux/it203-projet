<template>


  <div class="box">
    <h1 class="title">Ajouter un joueur</h1>

    <div class="field">
      <label class="label">Nom</label>
      <div class="control">
        <input class="input" v-model.lazy="item.nom_joueur" />
      </div>
    </div>

    <div class="field">
      <label class="label">Prenom</label>
      <div class="control">
        <input class="input" v-model.lazy="item.prenom_joueur" />
      </div>
    </div>

    <div class="field">
      <label class="label">Pseudo</label>
      <div class="control">
        <input class="input" v-model.lazy="item.pseudo" />
      </div>
    </div>

    <div class="field">
      <label class="label">Mail</label>
      <div class="control">
        <input class="input" v-model.lazy="item.mail" />
      </div>
    </div>

    <div class="field">
      <label class="label">Thème</label>
      <div class="control">
        <ul class="is-info">
          <li v-for="menuItem in themeMenuItems" :key="menuItem.numero_theme" :value="menuItem.numero_theme">
            <div class="b-checkbox is-info">
              <input type="checkbox" :id="'themeCheckbox' + menuItem.numero_theme" :value="menuItem.theme"
                class="styled is-info" v-model="selectedThemes">
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


    <button class="button is-info" v-on:click="notif">Soumettre</button>


    <div class="notification is-info is-light">
      <button class="delete"></button>
      Requete sql ici !
    </div>
  </div>

</template>
  
<script lang="ts">
import { defineComponent } from "vue";
import axios from "axios";
import { Player } from "../types/Player";
import { Theme } from "../types/Theme";
import { Mechanic } from "@/types/Mechanic";
import bulmaCalendar from "bulma-calendar";


export default defineComponent({
  data() {
    return {
      themeMenuItems: [] as Array<Theme>,
      mechanicMenuItems: [] as Array<Mechanic>,
      selectedThemes: [] as Array<Theme>,
      selectedMechanics: [] as Array<Mechanic>,
      id_personne : "",
      item: {
        nom_joueur: "",
        prenom_joueur: "",
        pseudo: "",
        mail: "",
      },
    };

  },

  created(){
    this.getThemeNames();
    this.getMecanicName();
  },

  methods: {
    notif() {
      console.log("Le bouton a été activé");
      console.log(this.item);
      this.postNewUser().then(this.postNewPlayer, () => { console.log("Probleme") });

    },
    async postNewUser() {
      try {
        console.log("verif arg : nom :" + this.item.nom_joueur + " prenom :" + this.item.prenom_joueur);
        const res = await axios.post(
          `http://localhost:3000/users/new?nom=${this.item.nom_joueur}&prenom=${this.item.prenom_joueur}`);
        console.log("My res", res);
        console.log("My id :", res.data.insertId)
        return res.data.insertId;
      } catch (err) {
        console.log("Erreur pour ajout d'une personne");
      }
    },



    async postNewPlayer(id: string) {
      this.id_personne = id;
      try {
        const res = await axios.post(
          `http://localhost:3000/players/new?pseudo=${this.item.pseudo}&mail=${this.item.mail}&id=${id}`);
        console.log("My res", res);
      } catch (err) {
        console.log("Erreur pour ajout d'un joueur");
      }
    },

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
   async postPreferdMecanicsAndThemes(){
    if (this.selectedMechanics.length !== 0) {
        this.selectedMechanics.forEach(el => {
          try {
            axios.post(`http://localhost:3000/players/link/PlayerMecanic?numero_personne=${this.id_personne}&mecanisme=${el}`);
            console.log("Success !")
          }
          catch (err) {
            console.log(err);
            console.log("Error !")
          }
        });
      }
      if (this.selectedThemes.length !== 0) {
        this.selectedThemes.forEach(el => {
          try {
            axios.post(`http://localhost:3000/players/link/PlayerTheme?numero_personne=${this.id_personne}&theme=${el}`);
            console.log("Success !")
          }
          catch (err) {
            console.log(err);
            console.log("Error !")
          }
        });
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
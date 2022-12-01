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


export default defineComponent({
  data() {
    return {
      item: {
        nom_joueur: "",
        prenom_joueur: "",
        pseudo: "",
        mail: "",
      },
    };
    
  },

  // created() {
  //   this.postNewUser();
  // },

  methods : {
    notif(){
      console.log("Le bouton a été activé");
      console.log(this.item);
      this.postNewUser();
    },
    async postNewUser() {
      try{
        console.log("verif arg : nom :"+this.item.nom_joueur+" prenom :"+ this.item.prenom_joueur);
        const res = await axios.post(
          "http://localhost:3000/users/new", {nom : this.item.nom_joueur, prenom : this.item.prenom_joueur});
          console.log("My res", res);
      }catch(err){
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
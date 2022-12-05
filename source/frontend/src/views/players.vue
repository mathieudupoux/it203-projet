<template>

  <div class="block">

    <h1 class="title">Joueurs</h1>
    <h2 class="subtitle">Liste de tous les joueurs</h2>

    <table class="table is-striped is-bordered mt-2 is-fullwidth">
      <thead>
        <tr>
          <th>ID</th>
          <th>Pseudo</th>
          <th>Mail</th>
          <th>Action1</th>
          <th>Action2</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in items" :key="item.numero_personne">
                <!-- modal -->
                <div class="modal" :id="item.numero_personne" :class="{'is-active' : showModalFlag}">
                <div class="modal-background"></div>
                <div class="modal-card">
                  <header class="modal-card-head">
                    <p class="modal-card-title">Modifier joueur {{item.numero_personne}}</p>
                    <button class="delete" aria-label="close"></button>
                  </header>
                  <section class="modal-card-body">

                    <!-- beginning form -->
                    <div class="field">
                    <label class="label">Pseudo</label>
                    <div class="control">
                      <input class="input" v-model="item.pseudo" />
                    </div>
                  </div>

                  <div class="field">
                    <label class="label">Mail</label>
                    <div class="control">
                      <input class="input" v-model="item.mail" />
                    </div>
                  </div>
                  <!-- end form -->

                  </section>
                  <footer class="modal-card-foot">
                    <button class="button is-success" @click="okModal(item.numero_personne, item.pseudo, item.mail)">Save changes</button>
                    <button class="button" @click="cancelModal">Cancel</button>
                  </footer>
                </div>
              </div>
              <!-- end modal  -->

          <td>{{ item.numero_personne }}</td>
          <td>{{ item.pseudo }}</td>
          <td>{{ item.mail }}</td>
          <td><button class="button is-small is-success" @click="showModal">Modifier</button></td>
          <td><button class="button is-small is-danger" @click="deletePlayer(item.numero_personne)">Supprimer</button></td>

        </tr>
      </tbody>
    </table>
  

  </div>
</template>
  
<script lang="ts">
// import axios
import axios from "axios";
import { defineComponent } from "vue";
import { Player } from "../types/Player";

export default defineComponent({
  name: "GamesList",
  data() {
    return {
      showModalFlag : false, 
      okPressed : false, 
      message : "Press OK or Cancel",
      items: [] as Player[],
    };
  },

  created() {
    this.getListPlayers();
  },

  methods: {
    async getListPlayers() {
      try {
        const response = await axios.get(
          "http://localhost:3000/players/"
        );
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
    },
    async modifyPlayer(id : number, pseudo : string, mail : string){
      console.log("Modify :",id);
      // this.showModal();
      try {
        const response = await axios.get(
          `http://localhost:3000/players/remove/${id.toString()}`
        );
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
    },
    async deletePlayer(id : number){
      console.log("Delete :",id);
      try {
        const response = await axios.get(
          `http://localhost:3000/players/remove/${id.toString()}`
        );
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
      location.reload();
    },
    showModal(){
      this.okPressed = false;
      this.showModalFlag = true;
    },
    okModal(id : number, pseudo : string, mail : string){
      this.okPressed = true;
      this.showModalFlag = false;
    },
    cancelModal() {
      this.okPressed = false;
      this.showModalFlag = false;
    }

  },
});
</script>
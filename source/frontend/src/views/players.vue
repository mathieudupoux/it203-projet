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
          <td>{{ item.numero_personne }}</td>
          <td>{{ item.pseudo }}</td>
          <td>{{ item.mail }}</td>
          <td><button class="button is-small is-success" @click="modifyPlayer(item.numero_personne)">Modifier</button></td>
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
    async modifyPlayer(id : number){
      console.log("Modify :",id);

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
    }

  },
});
</script>
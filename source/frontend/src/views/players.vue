<template>

    <div class="container">

      <h1 class="title">Joueurs</h1>
      <h2 class="subtitle">Liste de tous les joueurs</h2>
  
      <table class="table is-striped is-bordered mt-2 is-fullwidth">
        <thead>
          <tr>
            <th>ID</th>
            <th>Pseudo</th>
            <th>Mail</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in items" :key="item.numero_joueur">
            <td>{{ item.numero_personne }}</td>
            <td>{{ item.pseudo }}</td>
            <td>{{ item.mail }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </template>
  
  <script lang="ts">
  // import axios
  import axios from "axios";
  import { defineComponent } from "vue";
  
  export default defineComponent({
    name: "GamesList",
    data() {
      return {
        items: [],
      };
    },
  
    created() {
      this.getListPlayers();
    },
  
    methods: {
      async getListPlayers() {
        try {
          const response = await axios.get(
            "http://localhost:3000/users/list"
          );
          this.items = response.data;
        } catch (err) {
          console.log(err);
        }
      },
  
    },
  });
  </script>
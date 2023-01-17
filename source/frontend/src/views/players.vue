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
          <th>Nombre d'avis donné</th>
          <th>Afficher les commentaires</th>
          <th>Modier le joueur</th>
          <th>Supprimer le joueur</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in items" :key="item.numero_personne">
          <!-- modal -->
          <div class="modal" :class="{ 'is-active': showModalFlag }">
            <div class="modal-background"></div>
            <div class="modal-card">
              <header class="modal-card-head">
                <p class="modal-card-title">Modifier joueur {{ tmp_id }}</p>
                <button class="delete" aria-label="close"></button>
              </header>
              <section class="modal-card-body">

                <!-- beginning form -->
                <div class="field">
                  <label class="label">Pseudo</label>
                  <div class="control">
                    <input class="input" v-model="tmp_pseudo" />
                  </div>
                </div>

                <div class="field">
                  <label class="label">Mail</label>
                  <div class="control">
                    <input class="input" v-model="tmp_mail" />
                  </div>
                </div>
                <!-- end form -->

              </section>
              <footer class="modal-card-foot">
                <button class="button is-success" @click="modifyPlayer">Save changes</button>
                <button class="button" @click="cancelModal">Cancel</button>
              </footer>
            </div>
          </div>
          <!-- end modal  -->
          <td>{{ item.numero_personne }}</td>
          <td>{{ item.pseudo }}</td>
          <td>{{ item.mail }}</td>
          <td>{{ item.nombre_avis }}</td>
          <td><button class="button is-small is-info" @click="displayComments(item)">Afficher les
              commentaires</button></td>
          <td><button class="button is-small is-success"
              @click="showModal(item.numero_personne, item.pseudo, item.mail)">Modifier</button></td>
          <td><button class="button is-small is-danger" @click="deletePlayer(item.numero_personne)">Supprimer</button>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Comment of players prefered list -->
    <h1 class="title">Commentaires sur les jeux préférés de {{ selectedPlayer.pseudo }}</h1>
    <div class="block" v-for="comment in commentsItems" :key="comment.numero_avis">
      <div class="card">
        <header class="card-header subtitle">
        </header>
        <CommentView :avis='comment'></CommentView>
      </div>
    </div>

  </div>
</template>
  
<script lang="ts">
// import axios
import axios from "axios";
import { defineComponent } from "vue";
import CommentView from "../components/commentView.vue";
import { Player } from "../types/Player";
import { Comment } from "../types/Comment";

export default defineComponent({
  name: "GamesList",
  components: { CommentView },
  data() {
    return {
      showModalFlag: false,
      okPressed: false,
      message: "Press OK or Cancel",
      items: [] as Player[],
      tmp_id: "default",
      tmp_pseudo: "default",
      tmp_mail: "default",
      commentsItems: [] as Comment[],
      selectedPlayer: {} as Player,
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
        console.log("Error here");
        console.log(err);
      }
    },

    async displayComments(player: Player) {
      try {
        this.selectedPlayer = player;
        const response = await axios.get(
          `http://localhost:3000/comments/player/OnlyPrefered/${this.selectedPlayer.numero_personne}`
        );
        this.commentsItems = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    async modifyPlayer() {
      console.log("Modify :", this.tmp_id);
      console.log("Modify :", this.tmp_pseudo);
      console.log(this.tmp_mail);
      // this.showModal();
      try {
        const response = await axios.post(
          `http://localhost:3000/players/update?id=${this.tmp_id}&pseudo=${this.tmp_pseudo}&mail=${this.tmp_mail}`
        );
        this.items = response.data;
        console.log("update");
      } catch (err) {
        console.log("Error here");
        console.log(err);
      }
      this.okPressed = true;
      this.showModalFlag = false;
      this.getListPlayers();
    },
    async deletePlayer(id: number) {
      console.log("Delete :", id);
      try {
        const response = await axios.get(
          `http://localhost:3000/players/remove/${id.toString()}`
        );
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
      this.getListPlayers();
    },
    showModal(id: number, pseudo: string, mail: string) {
      this.tmp_pseudo = pseudo;
      this.tmp_mail = mail;
      this.tmp_id = id.toString();

      this.okPressed = false;
      this.showModalFlag = true;
    },
    // async okModal(id : number, pseudo : string, mail : string){
    //   this.modifyPlayer(id,pseudo,mail);
    //   this.okPressed = true;
    //   this.showModalFlag = false;
    // },
    cancelModal() {
      this.okPressed = false;
      this.showModalFlag = false;
    }

  },
});
</script>
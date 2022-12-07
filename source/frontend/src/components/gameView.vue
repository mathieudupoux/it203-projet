<template>
  <div class="card">
    <header class="card-header">
      <p class="card-header-title">
        {{ jeu.nom }}
      </p>
      <button class="card-header-icon" aria-label="more options">
        <span class="icon">
          <i class="fas fa-angle-down" aria-hidden="true"></i>
        </span>
      </button>
    </header>
    <div class="card-content">
      <div class="content">
        <ul>
          <li>Éditeur : {{ jeu.editeur }}</li>
          <li>Date de parution : {{ formatDate(jeu.date_de_parution) }}</li>
          <li>Type de jeu : {{ jeu.type_de_jeu }}</li>
          <li>Mécanisme : {{ jeu.mecanisme }}</li>
          <li>Thème : {{ jeu.theme }}</li>
        </ul>
      </div>
    </div>
    <div class="card-content">
      <div class="content">
        <NewComment :mainGame='jeu.numero_jeu'></NewComment>
      </div>
    </div>
    <footer class="card-footer buttons">
      <button href="#" class="button card-footer-item is-info is-light is-rounded" @click="showModal">Modifier</button>

      <!-- modal -->
      <div class="modal" :class="{ 'is-active': showModalFlag }">
        <div class="modal-background"></div>
        <div class="modal-card">
          <header class="modal-card-head">
            <p class="modal-card-title">Modifier joueur {{ tmp_game.numero_jeu }}</p>
            <button class="delete" aria-label="close" @click="cancelModal"></button>
          </header>
          <section class="modal-card-body">

            <!-- beginning form -->
            <div class="field">
              <label class="label">Nom du jeu</label>
              <div class="control">
                <input class="input" v-model.lazy="tmp_game.nom" />
              </div>
            </div>

            <div class="field">
              <label class="label">Editeur</label>
              <div class="control">
                <input class="input" v-model.lazy="tmp_game.editeur" />
              </div>
            </div>

            <div class="field">
              <label class="label">Date de parution</label>
              <div class="control">
                <input type="date" class="demo input" v-model.lazy="tmp_game.date_de_parution" />
              </div>
            </div>

            <div class="field">
              <label class="label">Type de jeu</label>
              <div class="control">
                <input class="input" v-model.lazy="tmp_game.type_de_jeu" />
              </div>
            </div>


            <div class="field">
              <label class="label">Duree du jeu</label>
              <div class="control">
                <input class="input" v-model.lazy="tmp_game.duree" />
              </div>
            </div>
            <!-- 
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
    </div> -->
            <!-- end form -->

          </section>
          <footer class="modal-card-foot">
            <button class="button is-success" @click="okModal">Save changes</button>
            <button class="button" @click="cancelModal">Cancel</button>
          </footer>
        </div>
      </div>
      <!-- end modal  -->


      <button href="#" class="button card-footer-item is-danger is-rounded"
        @click="delGame(jeu.numero_jeu)">Supprimer</button>
    </footer>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import NewComment from "./addNewComment.vue";
import axios from "axios";
import { Game } from "../types/Game"

export default defineComponent({
  name: "GameView",
  components: { NewComment },
  props: [
    "jeu",
    "type_de_jeu",
    "duree",
    "mecanisme",
    "theme"],
  emits: ["reload"],

  data() {
    return {
      showModalFlag: false,
      okPressed: false,
      items: [],
      tmp_game: {} as Game,
    }
  },

  methods: {
    cp_game() {
      this.tmp_game.nom = this.jeu.nom;
      this.tmp_game.editeur = this.jeu.editeur;
      this.tmp_game.numero_jeu = this.jeu.numero_jeu;
      this.tmp_game.date_de_parution = this.jeu.date_de_parution.split('T')[0]; // keep only the first part of the date
      this.tmp_game.type_de_jeu = this.jeu.type_de_jeu;
      this.tmp_game.duree = this.jeu.duree;
    },
    // peut-etre a deplacer a un autre endroit si c'est possible pcq ca fait bizarre ici 
    async deleteGames(id: string) {
      try {
        const response = await axios.get(`http://localhost:3000/games/remove/${id}`);
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    async updateGame() {
      try {
        const response = await axios.post(`http://localhost:3000/games/update/`, this.tmp_game);
        this.items = response.data;
      } catch (err) {
        console.log(err);
      }
    },

    delGame(id: string) {
      console.log("notif plus", id);
      this.deleteGames(id).then(() => this.$emit("reload"));
    },

    formatDate(value: string) {
      if (value != "") {
        const d = new Date(value);
        return new Intl.DateTimeFormat('fr-FR', { dateStyle: 'long', timeZone: 'Europe/Paris' }).format(d);
      }
    },
    showModal() {
      this.showModalFlag = true;
      this.cp_game();
    },
    okModal() {
      this.updateGame().then(() => this.$emit("reload"));
      this.showModalFlag = false;
    },
    cancelModal() {
      this.okPressed = false;
      this.showModalFlag = false;
    }

  },
});
</script>
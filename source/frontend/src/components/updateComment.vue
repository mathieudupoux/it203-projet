<template>
  <div class="modal" :class="{ 'is-active': showModalFlag }">
    <div class="modal-background"></div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">Modifier commentaire {{ avis.numero_avis }}</p>
        <button class="delete" aria-label="close" @click="cancelModal"></button>
      </header>
      <section class="modal-card-body">

        <!-- beginning form -->
        <div class="card-content">
          <div class="content">
            <div class="box">
              <article class="media">
                <div class="media-content">
                  <div class="field">
                    <p class="control">
                      <textarea class="textarea" placeholder="Votre commentaire"
                        v-model="tmp_item.commentaire"></textarea>
                    </p>
                  </div>
                  <nav class="level">
                    <div class="level-left">
                      <div class="level-item">
                        <p class="control subtitle"><label class="label">Joueur</label></p>
                      </div>
                      <div class="level-item">
                        <div class="field">
                          <p class="control">
                            <select class="dropdown-content" v-model="tmp_item.numero_personne">
                              <option class="dropdown-item" v-for="player in players" :key="player.numero_personne"
                                :value="player.numero_personne">
                                {{ player.pseudo }}
                              </option>
                            </select>
                          </p>
                        </div>
                      </div>

                      <div class="level-item">
                        <p class="control"><label class="label">Note</label></p>
                      </div>
                      <div class="level-item">
                        <div class="field">
                          <p class="control">
                            <select class="dropdown-content" v-model="tmp_item.note">
                              <option class="dropdown-item" v-for="n in 21" :key="n" :value="(n - 1)">
                                {{ n - 1 }}
                              </option>
                            </select>
                          </p>
                        </div>
                      </div>
                    </div>
                  </nav>

                  <!-- <nav class="level">
          <div>
            <div class="level-left">
              <div class="level-item">
                <p class=control><label class="label">Configurations disponibles</label></p>
              </div>
            </div>
            <div class="level-item">
              <div class="field">
                <p class="control">
                  <select class="dropdown-content" v-model="item.numero_configuration">
                    <option class="dropdown-item" v-for="config in configList" :key="config.numero_configuration"
                      :value="config.numero_configuration">
                      {{ config.nom_jeu }} avec l'extension {{ config.nom_extension }}
                    </option>
                  </select>
                </p>
              </div>
            </div>
          </div>
          </nav> -->

                </div>
              </article>
              <div class="field">
              </div>

              <div class="notification is-info is-light">
                <button class="delete"></button>
                Requete sql ici !
                {{ showModalFlag }}
                {{ avis }}
                {{ configList }}
              </div>
            </div>
            J e ne sais pas ce que je fais !
            <!-- {{ avis }} -->
          </div>
        </div>
        <!-- end form -->

      </section>
      <footer class="modal-card-foot">
        <button class="button is-success" @click="okModal">Save changes</button>
        <button class="button" @click="cancelModal">Cancel</button>
      </footer>
    </div>
  </div>


</template>
  
<script lang="ts">
import { defineComponent } from "vue";
import axios from "axios";
import { Comment } from "../types/Comment";
import { Player } from "../types/Player";
import { Config } from "../types/Config";

export default defineComponent({

  props: ["toggleModal", "avis", "mainGame"],
  emits: ["reload"],

  data() {
    return {
      configList: [] as Array<Config>,
      players: [] as Array<Player>,
      item: {} as Comment,
      tmp_item: {} as Comment,
      showModalFlag: false,
    };

  },

  created() {
    this.getPlayers();
    this.getConfigList();
    this.cp_avis();
  },

  watch: {
    toggleModal() {
      if (this.toggleModal == true) {
        this.showModal();
      }
    }
  },

  methods: {
    cp_avis() {
      this.tmp_item.commentaire = this.avis.commentaire;
      this.tmp_item.numero_personne = this.avis.numero_personne;
      this.tmp_item.note = this.avis.note;
      this.tmp_item.date_avis = this.avis.date_avis;
      this.tmp_item.numero_avis = this.avis.numero_avis;
      this.tmp_item.numero_configuration = this.avis.numero_configuration;
    },
    notif() {
      console.log("Le bouton a été activé");
      console.log(this.item);
      // this.postNewComment();
    },

    getCurrentDate() {
      let d = new Date;
      return d.toISOString().slice(0, 10) + " " + d.toISOString().slice(11, 19);
    },

    async getConfigList() {
      const res = await axios.get(`http://localhost:3000/games/config/byMainGame/${this.mainGame}`);
      this.configList = res.data;
    },

    async getPlayers() {
      const res = await axios.get(`http://localhost:3000/players`);
      this.players = res.data;
    },

    async updateComment() {
      try {
        this.tmp_item.date_avis = this.getCurrentDate();
        // console.log("verif arg : note :" + this.item.note + " avis :" + this.item.commentaire);
        console.log("item", this.tmp_item);
        const res = await axios.post(
          `http://localhost:3000/comments/update`, this.tmp_item);
        console.log("My res", res);
      } catch (err) {
        console.log("Erreur pour update une personne");
      }
    },
    async showModal() {
      this.showModalFlag = true;
    },

    async okModal() {
      this.updateComment().then(() => this.$emit('reload'));
      this.showModalFlag = false;
    },
    cancelModal() {
      this.showModalFlag = false;
      this.$emit('reload')
    }
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
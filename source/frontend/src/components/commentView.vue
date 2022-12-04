<template>
    <article class="media box">
        <figure class="media-left">
            <span class="tag is-large is-success">{{ avis.note }}/20</span>
        </figure>
        <div class="media-content">
            <div class="content">
                <p><strong> {{ player.pseudo }}</strong> <small>{{ getDate() }}</small></p>
            </div>

            <div class="content">
                <p>{{ avis.commentaire }}</p>
            </div>
        </div>
        <nav class="media-right">
            <div class="level-right">
                <div id="appreciators" class="modal" v-bind:class="{ 'is-active': openAppreciators }">
                    <div class="modal-background" @click="openAppreciators = false"></div>
                    <div class="modal-content" @click="openAppreciators = false">
                        <div class="card">
                            <div class="card-content">
                                <h1 class="title">Joueurs ayant appréciés ce commentaire :</h1>
                                <ul class="content" v-for="a in appreciators" :key="a.numero_personne">
                                    <li>{{ a.pseudo }}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <button class="modal-close is-large" aria-label="open" @click="openAppreciators = false"></button>
                </div>
                <button class="button level-item js-modal-trigger" data-target="appreciators"
                    @click="openAppreciators = !openAppreciators" v-bind:class="{ 'is-active': openAppreciators }">
                    <span>{{ avis.nbUp }}</span><span class="icon"><i class="fas fa-thumbs-up"></i></span>
                </button>
                <button class="button level-item is-info">
                    <span class="icon"><i class="fas fa-edit"></i></span>
                </button>
                <button class="button level-item is-danger">
                    <span class="icon"><i class="fas fa-trash"></i></span>
                </button>
            </div>
        </nav>
    </article>

</template>

<script lang="ts">
import axios from 'axios';
import { defineComponent } from 'vue';
import { Player } from '../types/Player';

export default defineComponent({
    name: "CommentView",
    props: [
        "avis"
    ],

    data() {
        return {
            openAppreciators: false,
            player: {} as Player,
            appreciators: [] as Player[],
            nbAppreciatons: Number,
        }
    },

    created() {
        this.getAuthor();
        this.getAppreciators();
    },

    methods: {
        async getAuthor() {
            try {
                const response = await axios.get(
                    `http://localhost:3000/players/${this.avis.numero_personne}`
                );
                this.player = response.data[0];
                if (this.player.pseudo === "") {
                    this.player.pseudo = "Unknown"
                }
            } catch (err) {
                console.log(err);
            }
        },

        async getAppreciators() {
            try {
                const response = await axios.get(
                    `http://localhost:3000/comments/${this.avis.numero_avis}/Appreciators`
                );
                this.appreciators = response.data;
            } catch (err) {
                console.log(err);
            }
        },

        getDate() {
            const value = this.avis.date_avis;
            if (value) {
                const d = new Date(this.avis.date_avis);
                return new Intl.DateTimeFormat('fr-FR', { dateStyle: 'short', timeStyle: 'short', timeZone: 'Europe/Paris' }).format(d);
            }
        },
    }
})

</script>
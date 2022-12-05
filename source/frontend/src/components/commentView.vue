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
            <div class="level">
                <div class="level-right">
                    <div class="level-item">
                        <Popper :hover="true" class="container" :disabled="avis.nb_appreciations == 0">
                            <span :hover="openAppreciators">{{ avis.nb_appreciations }} jugements</span>
                            <template #content>
                                <ul class="content" v-for="a in appreciators" :key="a.numero_personne">
                                    <li>{{ a.pseudo }}</li>
                                </ul>
                            </template>
                        </Popper>
                    </div>
                    <button class="button level-item">
                        <span>{{ avis.indice }}</span><span class="icon"><i class="fas fa-star-half-stroke"></i></span>
                    </button>
                    <div CLASS="level-item">
                        <button class="button is-primary is-outlined">
                            <span class="icon"><i class="fas fa-thumbs-up"></i></span>
                        </button>
                        <button class="button is-danger is-outlined">
                            <span class="icon"><i class="fas fa-thumbs-down"></i></span>
                        </button>
                    </div>
                    <button class="button level-item is-info">
                        <span class="icon"><i class="fas fa-edit"></i></span>
                    </button>
                    <button class="button level-item is-danger">
                        <span class="icon"><i class="fas fa-trash"></i></span>
                    </button>
                </div>
            </div>
        </nav>
    </article>

</template>

<script lang="ts">
import Popper from "vue3-popper";
import axios from 'axios';
import { defineComponent } from 'vue';
import { Player } from '../types/Player';

export default defineComponent({
    name: "CommentView",
    props: [
        "avis"
    ],
    components: { Popper },
    data() {
        return {
            openAppreciators: false,
            player: {} as Player,
            appreciators: [] as Array<Player>,
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


<style>
#app {
    --popper-theme-background-color: #ffffff;
    --popper-theme-background-color-hover: #ffffff;
    --popper-theme-text-color: inherit;
    --popper-theme-border-width: 1px;
    --popper-theme-border-style: solid;
    --popper-theme-border-color: #eeeeee;
    --popper-theme-border-radius: 6px;
    --popper-theme-padding: 16px;
    --popper-theme-box-shadow: 0 6px 30px -6px rgba(0, 0, 0, 0.25), width: 500px;
}
</style>

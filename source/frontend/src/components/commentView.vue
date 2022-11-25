<template>
    <article class="card box">
        <div class="card-content">
            <div class="media">
                <figure class="media-left">
                    <span class="tag is-large is-success">{{ avis.note }}/20</span>
                </figure>
                <div class="media-content">
                    <p class="title is-4">{{ player.pseudo }}</p>
                    <p class="subtitle is-6">{{ getDate() }}</p>
                </div>
            </div>

            <div class="content">
                <p>{{ avis.commentaire }}</p>
            </div>

            <nav class="level is-mobile">
                <div class="level-left">
                    <button class="button level-item">
                        <span>15 </span>
                        <span class="icon">
                            <i class="fas fa-thumbs-up"></i>
                        </span>
                    </button>
                </div>
                <div class="level-right">
                    <button class="button level-item is-info">
                        <span class="icon"><i class="fas fa-edit"></i></span>
                    </button>
                    <button class="button level-item is-danger">
                        <span class="icon"><i class="fas fa-trash"></i></span>
                    </button>
                </div>
            </nav>
        </div>
    </article>

</template>

<script lang="ts">
import axios from 'axios';
import { defineComponent } from 'vue';
export default defineComponent({
    name: "CommentView",
    props: [
        "avis"
    ],

    data() {
        return {
            player: String,
            appreciators: [],
            nbAppreciatons: Number,
        }
    },

    created() {
        this.getAuthor();
    },

    methods: {
        async getAuthor() {
            try {
                const response = await axios.get(
                    `http://localhost:3000/players/${this.avis.numero_personne}`
                );
                this.player = response.data[0];
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
                const d = new Date(value);
                console.log(d)
                const months = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Jullet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
                const year = d.getFullYear();
                const month = d.getMonth();
                const day = d.getDay();
                return day.toString() + " " + months[month] + " " + year.toString();
            }
        },
    }
})

</script>
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
            <button href="#" class="button card-footer-item is-info is-light is-rounded" @click="changeGame">Modifier</button>
            <button href="#" class="button card-footer-item is-danger is-rounded" @click="delGame(jeu.numero_jeu)">Supprimer</button>
        </footer>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import NewComment from "./addNewComment.vue";
import axios from "axios";

export default defineComponent({
    name: "GameView",
    components: { NewComment },
    props: [
        "jeu",
        "type_de_jeu",
        "duree",
        "mecanisme",
        "theme"],

    data() {
        return {
            items: []
        }
    },

    methods: {
        // peut-etre a deplacer a un autre endroit si c'est possible pcq ca fait bizarre ici 
        async deleteGames(id : string) {
            try {
            const response = await axios.get(`http://localhost:3000/games//remove/${id}`);
            this.items = response.data;
            } catch (err) {
                console.log(err);
            }
        },

        delGame(id : string){
            console.log("notif plus", id);
            this.deleteGames(id);
            location.reload(); // a modiifer si on trouve qqch de plus propre !
        },

        changeGame(){
            console.log("notif2");
        },
        formatDate(value: string) {
            if (value != "") {
                const d = new Date(value);
                return new Intl.DateTimeFormat('fr-FR', { dateStyle: 'long', timeZone: 'Europe/Paris' }).format(d);
            }
        },
    },

})
</script>
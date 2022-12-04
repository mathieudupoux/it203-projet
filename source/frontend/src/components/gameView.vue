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
            <button href="#" class="button card-footer-item is-info is-light is-rounded">Modifier</button>
            <button href="#" class="button card-footer-item is-danger is-rounded">Supprimer</button>
        </footer>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import NewComment from "./addNewComment.vue"
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
        formatDate(value: string) {
            if (value != "") {
                const d = new Date(value);
                return new Intl.DateTimeFormat('fr-FR', { dateStyle: 'long', timeZone: 'Europe/Paris' }).format(d);
            }
        },
    },

})
</script>
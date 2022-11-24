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
        <footer class="card-footer buttons">
            <button href="#" class="button card-footer-item is-info is-light is-rounded">Modifier</button>
            <button href="#" class="button card-footer-item is-danger is-rounded">Supprimer</button>
        </footer>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
export default defineComponent({
    name: "GameView",
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
                console.log(d)
                const months = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Jullet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
                const year = d.getFullYear();
                const month = d.getMonth();
                const day = d.getDay();
                return day.toString() + " " + months[month] + " " + year.toString();
            }
        },
    },

})
</script>
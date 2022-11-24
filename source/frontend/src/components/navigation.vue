<template>
  <nav class="navbar is-light" role="navigation" aria-label="main navigation">

    <!-- Navbar Brand containing the Heading -->
    <div class="navbar-brand">
      <a class="navbar-item has-background-info" href="#">
        <router-link class="navbar-item has-text-white" to="/">Sujet Jeux</router-link>
      </a>

      <!-- Burger Icons for responsive navbar -->
      <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <!-- Navbar Menu containing a list of items -->
    <div id="navbarBasicExample" class="navbar-menu">
      <div class="navbar-start">
        <router-link class="navbar-item" to="/"> Accueil </router-link>
        <div class="navbar-item has-dropdown is-hoverable">
          <a class="navbar-link"> Jeux </a>
          <div class="navbar-dropdown">
            <router-link class="navbar-item" to="/games"> Voir les jeux </router-link>
            <router-link class="navbar-item" to="/games/add"> Ajouter un jeux </router-link>
            <a class="navbar-item"> Supprimer un jeu </a>
          </div>
        </div>
        <router-link class="navbar-item" to="/players"> Joueurs </router-link>

        <div class="navbar-item has-dropdown is-hoverable">
          <a class="navbar-link"> Admininatration </a>

          <div class="navbar-dropdown">
            <a class="navbar-item"> Modération </a>
            <a class="navbar-item"> Jeux référencés </a>
            <a class="navbar-item"> Utilisateurs </a>
          </div>
        </div>
      </div>

    </div>
  </nav>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "NavBar",

  data() {
    return {
      isActive: false,
      showNavBar: true,
    }
  }
});
</script>

<style>
/* import style bulma */
@import "~bulma/css/bulma.css";
</style>

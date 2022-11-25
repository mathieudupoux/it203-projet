<template>
  <section class="hero is-small is-warning">
    <div class="hero-body has-text-centered">
      <p class="title">
        Sujet Jeux
      </p>
      <p class="subtitle">
        Par Marine, Nolan, Théodore et Mathieu
      </p>
    </div>

    <div class="hero-foot">
      <nav class="navbar" role="navigation" aria-label="main navigation">

        <!-- Navbar Brand containing the Heading -->
        <div class="navbar-brand">
          <a class="navbar-item" href="#">
            <router-link class="navbar-item" to="/">Sujet Jeux</router-link>
          </a>

          <!-- Burger Icons for responsive navbar -->
          <a role="button" class="navbar-burger burger" data-target="navMenu" aria-label="menu" aria-expanded="false"
            @click="isOpen = !isOpen" v-bind:class="{ 'is-active' : isOpen}">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
          </a>
        </div>

        <!-- Navbar Menu containing a list of items -->
        <div id="navMenu" class="navbar-menu" v-bind:class="{ 'is-active': isOpen }">
          <div class="navbar-start">
            <div class="navbar-item has-dropdown is-hoverable">
              <router-link class="navbar-link" to="/games"> Jeux </router-link>
              <div class="navbar-dropdown">
                <router-link class="navbar-item" to="/games"> Voir les jeux </router-link>
                <router-link class="navbar-item" to="/games/add"> Ajouter un jeux </router-link>
                <a class="navbar-item"> Supprimer un jeu </a>
              </div>
            </div>
            <router-link class="navbar-item" to="/comments"> Derniers commentaires </router-link>
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
    </div>
  </section>
  <br />
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "NavBar",

  data() {
    return {
      isOpen: false,
      showNavBar: true,
    }
  },

});
</script>

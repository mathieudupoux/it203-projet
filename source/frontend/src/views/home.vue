<!-- eslint-disable prettier/prettier -->
<template>
  <div class="block is-centered">
    <h1 class="title">Welcome Here !</h1>
    <article>
      <p>Bienvenue sur le prototype de serveur de la communauté <strong>VGDB</strong></p>
      <p>Actuellement, il existe 3 onglets principaux pour manipuler notre base de donnée : </p>
      <ul>
        <li><router-link class="button" to="/games"> Jeux </router-link>,
          pour voir, ajouter, modifier et supprimer un jeu et/ou ses extensions</li>
        <li><router-link class="button" to="/comments"> Commentaires </router-link>
          pour voir, ajouter, modifier et supprimer les avis des joueurs sur leurs jeux préférés (ou pas)</li>
        <li><router-link class="button" to="/comments"> Joueurs </router-link>
          pour voir, ajouter, modifier et supprimer les joueurs membre de la communauté VGDB</li>
      </ul>
    </article>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "HelloWorld",
  props: {
    msg: String,
  },
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

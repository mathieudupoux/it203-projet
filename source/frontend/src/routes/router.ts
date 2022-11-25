import { createWebHistory, createRouter } from "vue-router";
import NotFound from "../views/notFound.vue";
import Home from "../views/home.vue";
import Comments from "../views/comments.vue";
import Games from "../views/games.vue";
import AddGame from "../views/addNewGame.vue";
import Players from "../views/players.vue";



const routes = [
    { path: "/", name: "Accueil", component: Home },
    { path: "/comments", name: "Derniers commentaires", component: Comments },
    { path: "/games", name: "Jeux", component: Games },
    { path: "/games/add", name: "Ajouter un jeu", component: AddGame },
    { path: "/players", name: "Joueurs", component: Players },
    { path: "/: catchAll(.*)", name: "Notfound", component: NotFound }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
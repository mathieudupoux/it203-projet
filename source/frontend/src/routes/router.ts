import { createWebHistory, createRouter } from "vue-router";
import NotFound from "../views/notFound.vue";
import Home from "../views/home.vue"
import Games from "../views/games.vue";

const routes = [
    { path: "/", name: "Accueil", component: Home },
    { path: "/games", name: "Jeux", component: Games },
    { path: "/: catchAll(.*)", name: "Notfound", component: NotFound }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
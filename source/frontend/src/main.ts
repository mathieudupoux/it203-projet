import { createApp } from "vue";
import './styles/app.css'; // Here
import App from "./App.vue";
import router from "./routes/router";

createApp(App).use(router).mount("#app");

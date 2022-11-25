import { createApp } from "vue";
import { library } from '@fortawesome/fontawesome-svg-core'
import { faEdit, faTrash, faLevelUp } from '@fortawesome/free-solid-svg-icons'

import App from "./App.vue";
import router from "./routes/router";

library.add(faEdit, faTrash, faLevelUp);

createApp(App).use(router).mount("#app");

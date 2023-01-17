<template>
    <select class="dropdown-content" @change="$emit('theme', $event)" v-model="theme">
        <option class="dropdown-content" value="" selected enabled></option>
        <option class="dropdown-item" v-for="menuItem in themeMenuItems" :key="menuItem.numero_theme"
            :value="menuItem.numero_theme">
            {{ menuItem.theme }}
        </option>
    </select>
</template>

<script lang="ts">
import axios from 'axios';
import { defineComponent } from 'vue';
import { Theme } from '../../types/Theme';

export default defineComponent({
    name: "ThemeList",
    props: ["value"],
    emits: {
        theme: Number,
    },

    data() {
        return {
            themeMenuActive: false,
            themeMenuItems: [] as Theme[],
            theme: "",
        };
    },

    created() {
        this.getThemeNames();
    },

    methods: {
        toggleThemeMenu(e: any) {
            this.theme =
                e.target.options[e.target.options.selectedIndex].text;
        },

        async getThemeNames() {
            try {
                const response = await axios.get(
                    "http://localhost:3000/games/themeNames"
                );
                this.themeMenuItems = response.data;
            } catch (err) {
                console.log(err);
            }
        },

    }
})

</script>
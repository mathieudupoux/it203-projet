<template>
    <div class="control" @change="$emit('theme', $event)">
        <ul class="is-info">
            <li v-for="menuItem in themeMenuItems" :key="menuItem.numero_theme" :value="menuItem.numero_theme">
                <div class="b-checkbox is-info">
                    <input :id="'checkbox' + menuItem.numero_theme" type="checkbox" class="styled is-info">

                    <label :for="'checkbox' + menuItem.numero_theme" class="checkbox" value=""> {{ menuItem.theme
                    }}</label>
                </div>
            </li>
        </ul>
    </div>
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
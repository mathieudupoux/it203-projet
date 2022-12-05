<template>
    <div class="control">
        <ul class="is-info">
            <li v-for="menuItem in mechanicMenuItems" :key="menuItem.numero_mecanique" :value="menuItem.numero_mecanique">
                <div class="b-checkbox is-info">
                    <input type="checkbox" :id="'checkbox' + menuItem.numero_mecanique" :value="menuItem.mecanisme" class="styled is-info" v-model="selectedMecanics">
                    <label :for="'checkbox' + menuItem.numero_mecanique" class="checkbox"> {{ menuItem.mecanisme
                    }}</label>
                </div>
            </li>
        </ul>
    <span>Mécaniques cochées : {{ selectedMecanics}} </span>
    </div>
</template>

<script lang="ts">
import axios from 'axios';
import { defineComponent } from 'vue';
import { Mechanic } from '../../types/Mechanic';

export default defineComponent({
    name: "MecanicList",
    props: ["value"],
    emits: {
        mechanic: Number,
    },
    data() {
        return {
            mechanicMenuActive: false,
            mechanicMenuItems: [] as Mechanic[],
            mechanic: "",
            selectedMecanics: [],
        };
    },

    created() {
        this.getMecanicName();
    },

    methods: {
        togglemechanicMenu(e: any) {
            this.mechanic =
                e.target.options[e.target.options.selectedIndex].text;
        },

        async getMecanicName() {
            try {
                const response = await axios.get(
                    "http://localhost:3000/games/MechanicNames"
                );
                this.mechanicMenuItems = response.data;
            } catch (err) {
                console.log(err);
            }
        },

    }
})

</script>
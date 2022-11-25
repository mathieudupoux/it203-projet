<template>
    <article class="media box">
        <figure class="media-left">
            <span class="tag is-large is-success">15/20</span>
        </figure>
        <div class="media-content">
            <div class="content">
                <p>
                    <strong>Pseudo</strong> <small>31m</small>
                    <br>
                    Review content :
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque
                    tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
                </p>
            </div>
            <nav class="level is-mobile">
                <div class="level-left">
                    <button class="button level-item">
                        <span>15 </span>
                        <span class="icon">
                            <i class="fas fa-thumbs-up"></i>
                        </span>
                    </button>
                </div>
                <div class="level-right">
                    <button class="button level-item is-info">
                        <span class="icon"><i class="fas fa-edit"></i></span>
                    </button>
                    <button class="button level-item is-danger">
                        <span class="icon"><i class="fas fa-trash"></i></span>
                    </button>
                </div>
            </nav>
        </div>
    </article>

</template>

<script lang="ts">
import { defineComponent } from 'vue';
export default defineComponent({
    name: "CommentView"
})

</script>
<template>
    <v-file-input :rules="rules" @change="changeFile" @click:clear="changeFile"
        variant="underlined"></v-file-input>
</template>

<script setup>
import { ref } from 'vue';

let file = ref(null)

const emit = defineEmits(['file'])

const changeFile = (event) => {
    if (event.target.files) {
        file.value = event.target.files[0]
        emit('file', file)
    } else {
        emit('file', null)
    }
}

const rules = [
    v => (v[0]) || 'Обязательное поле'
]

</script>

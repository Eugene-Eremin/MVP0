<template>
    <v-file-input @change="changeFile" variant="underlined"></v-file-input>
</template>

<script setup>
let file = []

const changeFile = (event) => {
    file = event.target.files[0]
    console.log(file)
}
</script>

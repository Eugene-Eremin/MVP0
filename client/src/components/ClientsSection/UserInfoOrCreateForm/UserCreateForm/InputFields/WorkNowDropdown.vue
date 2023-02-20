<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" variant="underlined"></v-autocomplete>
</template>

<script>
export default {
    data() {
        return {
            select: [],
            items: [
                'Да',
                'Нет'
            ],

            rules: [
                v => !!v || 'Обязательное поле'
            ]
        }
    },
}
</script>
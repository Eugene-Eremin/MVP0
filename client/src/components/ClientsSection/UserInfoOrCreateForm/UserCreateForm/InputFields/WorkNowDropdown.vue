<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" item-title="name" return-object
        variant="underlined"></v-autocomplete>
</template>

<script>
export default {
    data() {
        return {
            select: [],
            items: [],

            rules: [
                v => !!v || 'Обязательное поле'
            ]
        }
    },
    mounted() {
        // Тут приходят данные с бека
        // this.items = ...
        // ...

        // Пока так
        this.items = [
            { name: 'Нет', num: 0 },
            { name: 'Да', num: 1 },
        ]
    },
}
</script>
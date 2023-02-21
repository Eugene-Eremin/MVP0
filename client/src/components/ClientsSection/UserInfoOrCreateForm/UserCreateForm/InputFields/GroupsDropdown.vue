<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" variant="underlined" item-title="name" item-value="num"
        return-value multiple></v-autocomplete>
</template>

<script>
export default {
    data() {
        return {
            select: [],
            items: [],

            rules: [
                v => (v.length != 0) || 'Обязательное поле'
            ]
        }
    },
    mounted() {
        // Тут приходят данные с бека
        // this.items = ...
        // ...

        // Пока так
        this.items = [
            { name: 'Администратор', num: 0 },
            { name: 'Работодатель', num: 1 },
            { name: 'Соискатель', num: 2 },
        ]
    },
    watch: {
        select() {
            this.$emit('addGroups', this.select)
        }
    }
}
</script>
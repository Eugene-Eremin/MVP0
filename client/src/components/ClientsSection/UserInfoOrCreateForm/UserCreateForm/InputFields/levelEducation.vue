<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" item-title="name" item-value="num" return-value
        variant="underlined"></v-autocomplete>
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
    watch: {
        select() {
            this.$emit('addLevelEducation', this.select)
        }
    },
    mounted() {
        // Тут приходят данные с бека
        // this.items = ...
        // ...

        // Пока так
        this.items = [
            { name: 'Законченное высшее', num: 0 },
            { name: 'Незаконченное высшее', num: 1 },
            { name: 'Среднее специальное', num: 2 },
        ]
    },
}
</script>
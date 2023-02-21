<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" item-title="name" item-value="num" return-value
        variant="underlined" multiple></v-autocomplete>
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
            { name: 'Металлургия', num: 0 },
            { name: 'Энергетика', num: 1 },
            { name: 'Сырье', num: 2 },
            { name: 'Нефтегаз', num: 3 },
            { name: 'Недвижимость', num: 4 },
            { name: 'Фармацевтика', num: 5 },
            { name: 'Транспорт', num: 6 },
            { name: 'Информационные технологии', num: 7 },
            { name: 'Телекоммуникации', num: 8 },
        ]
    },
    watch: {
        select() {
            this.$emit('addJobSearchAreas', this.select)
        }
    }
}
</script>
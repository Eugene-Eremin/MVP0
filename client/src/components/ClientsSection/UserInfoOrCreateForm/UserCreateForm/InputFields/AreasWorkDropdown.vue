<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" variant="underlined" multiple></v-autocomplete>
</template>

<script>
export default {
    data() {
        return {
            select: [],
            items: [
                'Металлургия',
                'Энергетика',
                'Сырье',
                'Нефтегаз',
                'Недвижимость',
                'Фармацевтика',
                'Транспорт',
                'Информационные технологии',
                'Телекоммуникации',
            ],

            rules: [
                v => (v.length != 0) || 'Обязательное поле'
            ]
        }
    },
}
</script>
<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" variant="underlined" multiple></v-autocomplete>
</template>

<script>
export default {
    data() {
        return {
            select: [],
            items: [],

            data: [],

            rules: [
                v => (v.length != 0) || 'Обязательное поле'
            ]
        }
    },
    watch: {
        select() {
            let selected = []

            console.log(this.select)
            this.select.forEach(elSelect => {
                this.data.forEach(elData => {
                    // elSelect == elData.name
                })
            })
        }
    },
    mounted() {
        // ...
        // Приходят данные и записываются сюда
        this.data = [
            { name: 'Администратор', num: 0 },
            { name: 'Работодатель', num: 1 },
            { name: 'Соискатель', num: 2 }
        ]

        this.data.forEach(el => {
            this.items.push(el.name)
        })
    }
}
</script>
<template>
    <div>
        <v-container fluid>
            <v-row>
                <v-col cols="12">
                    <v-combobox v-model="select" :items="items" variant="underlined" multiple></v-combobox>
                </v-col>
            </v-row>
        </v-container>
    </div>
</template>

<script>
export default {
    data() {
        return {
            select: [],
            items: [],

            data: [],
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
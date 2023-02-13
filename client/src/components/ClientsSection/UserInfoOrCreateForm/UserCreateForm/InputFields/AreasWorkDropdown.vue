<template>
    <div>
        <v-container fluid>
            <v-row>
                <v-col cols="12">
                    <v-combobox v-model="select" :items="items" variant="underlined"
                    multiple></v-combobox>
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
            items: [
                'Недвижимость',
                'Строительство',
                'IT',
                'Юрисдикция',
                'Кулинария',
                'Тест 1',
                'Тест 2',
                'Тест 3',
                'Тест 4',
                'Тест 5',
            ],
        }
    },
}
</script>
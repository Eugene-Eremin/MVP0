<template>
    <div>
        <v-container fluid>
            <v-row>
                <v-col cols="12">
                    <v-combobox v-model="select" :items="items" variant="underlined"></v-combobox>
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
                'Законченное высшее',
                'Незаконченное высшее',
                'Среднее специальное'
            ],
        }
    },
}
</script>
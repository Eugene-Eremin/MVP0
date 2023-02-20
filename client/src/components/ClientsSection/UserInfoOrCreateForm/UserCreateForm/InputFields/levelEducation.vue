<template>
    <v-autocomplete v-model="select" :items="items" variant="underlined"></v-autocomplete>
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
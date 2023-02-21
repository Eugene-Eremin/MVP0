<template>
    <v-autocomplete v-model="select" :rules="rules" :items="items" item-title="name" item-value="num" return-value
        variant="underlined"></v-autocomplete>
</template>

<script>
export default {
    data() {
        return {
            select: null,
            items: [
                { name: 'Нет', num: 0 },
                { name: 'Да', num: 1 },
            ],

            rules: [
                v => (v.length != 0) || 'Обязательное поле'
            ]
        }
    },
    watch: {
        select() {
            this.$emit('addWorkNow', this.select)
        }
    }
}
</script>
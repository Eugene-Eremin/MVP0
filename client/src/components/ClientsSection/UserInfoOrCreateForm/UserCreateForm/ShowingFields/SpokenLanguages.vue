<template>
    <div v-for="spokenLanguage, index in props.spokenLanguageArray" :key="index" class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
        <div class="m-auto flex-1 p-1">
            {{ spokenLanguage.language }}
        </div>
        <div class="m-auto flex-1 p-1">
            {{ spokenLanguage.grade }}
        </div>
    </div>
</template>

<script setup>

const props = defineProps({
    spokenLanguageArray: {
        type: Array,
        required: true
    }
})

</script>
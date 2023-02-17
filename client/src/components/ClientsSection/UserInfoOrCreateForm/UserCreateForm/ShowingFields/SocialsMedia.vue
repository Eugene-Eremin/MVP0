<template>
    <div v-for="socialMedia, index in props.socialMediaArray" :key="index" class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
        <div class="m-auto flex-1 p-1">
            {{ socialMedia.socialMediaName }}
        </div>
        <div class="m-auto flex-1 p-1">
            {{ socialMedia.link }}
        </div>
    </div>
</template>

<script setup>

const props = defineProps({
    socialMediaArray: {
        type: Array,
        required: true
    }
})

</script>
<template>
    <div v-for="ownedSkill, index in props.ownedSkillArray" :key="index" class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
        <div class="m-auto flex-1 p-1">
            {{ ownedSkill.skill }}
        </div>
        <div class="m-auto flex-1 p-1">
            {{ ownedSkill.grade }}
        </div>
    </div>
</template>

<script setup>

const props = defineProps({
    ownedSkillArray: {
        type: Array,
        required: true
    }
})

</script>
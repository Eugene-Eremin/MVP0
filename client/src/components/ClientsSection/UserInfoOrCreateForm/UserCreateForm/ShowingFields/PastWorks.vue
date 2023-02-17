<template>
    <div v-for="pastWork, index in props.pastWorkArray" :key="index" class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
        <div class="m-auto flex-1 p-1">
            {{ pastWork.companyName }}
        </div>
        <div class="m-auto flex-1 p-1">
            {{ pastWork.scopeWork }}
        </div>
        <div class="m-auto flex-1 p-1">
            {{ pastWork.jobTitle }}
        </div>
        <div class="m-auto flex-1 p-1">
            {{ pastWork.beginningWork.split('-')[0] }}
            <br>
            {{ pastWork.beginningWork.split('-')[2] }}/{{ pastWork.beginningWork.split('-')[1] }}
        </div>
    </div>
</template>

<script setup>


const props = defineProps({
    pastWorkArray: {
        type: Array,
        required: true
    }
})

</script>
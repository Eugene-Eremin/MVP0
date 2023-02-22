<template>
    <div class="lg:ml-auto mr-auto mt-4 w-full sm:w-1/2 lg:w-1/3">
        <button @click="changeSelectedOrCreate"
            class="flex flex-row items-center text-gray-400 mr-auto transition ease-in-out duration-350 w-full border text-sm rounded-md p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 hover:bg-gray-600 active:bg-gray-800">
            <div v-if="props.selectedOrCreate">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="M19 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zM4 19.235v-.11a6.375 6.375 0 0112.75 0v.109A12.318 12.318 0 0110.374 21c-2.331 0-4.512-.645-6.374-1.766z" />
                </svg>
            </div>
            <div v-else>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 15L3 9m0 0l6-6M3 9h12a6 6 0 010 12h-3" />
                </svg>
            </div>
            <div class="ml-2">
                <div v-if="props.selectedOrCreate">Добавить пользователя</div>
                <div v-else>Назад</div>
            </div>
        </button>
    </div>
</template>

<script setup>

const emit = defineEmits(['changeSelectedOrCreate'])
const changeSelectedOrCreate = () => {
    emit('changeSelectedOrCreate')
}

const props = defineProps({
    selectedOrCreate: {
        type: Boolean,
        required: true
    },
})

</script>

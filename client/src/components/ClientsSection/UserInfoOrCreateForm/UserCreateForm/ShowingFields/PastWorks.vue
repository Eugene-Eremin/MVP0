<template>
    <TransitionGroup name="slide-fade">
        <div v-for="pastWork, index in props.pastWorkArray" :key="index">
            <div class="flex flex-row">
                <button @click="$emit('remove', index)"
                    class="hover:bg-red-600 active:bg-red-700 transition ease-in-out duration-350 flex flex-row rounded-t-md border-b-0 w-16 overflow-hidden border bg-red-700 border-gray-700">
                    <div class="flex-1 text-white">
                        удалить
                    </div>
                </button>
                <button v-show="!change" @click="changeData"
                    class="hover:bg-yellow-600 active:bg-yellow-700 transition ease-in-out duration-350 flex flex-row rounded-t-md border-b-0 w-20 overflow-hidden border bg-yellow-700 border-gray-700">
                    <div class="flex-1 text-white">
                        изменить
                    </div>
                </button>
                <button v-show="change" @click="changeData"
                    class="hover:bg-gray-700 active:bg-gray-800 transition ease-in-out duration-350 flex flex-row rounded-t-md border-b-0 w-20 overflow-hidden border bg-gray-800 border-gray-700">
                    <div class="flex-1 text-white">
                        назад
                    </div>
                </button>
                <button v-show="change" @click="changeData"
                    class="hover:bg-green-600 active:bg-green-700 transition ease-in-out duration-350 flex flex-row rounded-t-md border-b-0 w-20 overflow-hidden border bg-green-700 border-gray-700">
                    <div class="flex-1 text-white">
                        сохранить
                    </div>
                </button>
            </div>
            <div v-show="!change"
                class="mb-2 flex flex-row rounded-md rounded-tl-none overflow-hidden border border-gray-700">
                <div class="m-auto flex-1 p-1">
                    {{ pastWork.companyName }}
                </div>
                <div class="m-auto flex-1 p-1">
                    {{ pastWork.scopeWork.name }}
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
            <div v-show="change"
                class="mb-2 flex flex-row rounded-md rounded-tl-none overflow-hidden border border-gray-700">
                <div class="m-auto flex-1 p-1">
                    ...
                </div>
                <div class="m-auto flex-1 p-1">
                    ...
                </div>
                <div class="m-auto flex-1 p-1">
                    ...
                </div>
                <div class="m-auto flex-1 p-1">
                    ...
                    <br>
                    ...
                </div>
            </div>
        </div>
    </TransitionGroup>
</template>

<script setup>
import { ref } from 'vue';

const props = defineProps({
    pastWorkArray: {
        type: Array,
        required: true
    }
})

let change = ref(false)
const changeData = () => {
    change.value = !change.value
}

</script>

<style scoped>
.slide-fade-enter-active {
    transition: all 0.3s ease-out;
}

.slide-fade-leave-active {
    transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
}

.slide-fade-enter-from,
.slide-fade-leave-to {
    transform: translateX(20px);
    opacity: 0;
}
</style>
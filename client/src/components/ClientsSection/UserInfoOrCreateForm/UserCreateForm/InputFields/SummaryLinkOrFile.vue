<template>
    <div v-show="optionsStore.summaryLinkOrFile"
        class="border-b border-gray-700 bg-gray-800  px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium">
            Резюме:
            <br>
            <button @click="changeSummary(false)"
                class="mt-2 flex flex-row items-center text-gray-400 transition ease-in-out duration-350 w-full border text-sm rounded-md p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 hover:bg-gray-600 active:bg-gray-800">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-5 h-5">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M11.35 3.836c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m8.9-4.414c.376.023.75.05 1.124.08 1.131.094 1.976 1.057 1.976 2.192V16.5A2.25 2.25 0 0118 18.75h-2.25m-7.5-10.5H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V18.75m-7.5-10.5h6.375c.621 0 1.125.504 1.125 1.125v9.375m-8.25-3l1.5 1.5 3-3.75" />
                    </svg>
                </div>
                <div class="ml-2">
                    Ссылка
                </div>
            </button>
        </dt>
        <dd class="text-sm pr-5 sm:col-span-2 sm:mt-0">
            <AddSummaryFile />
        </dd>
    </div>
    <div v-show="!optionsStore.summaryLinkOrFile"
        class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
        <dt class="text-sm font-medium ">
            Ссылка на резюме:
            <br>
            <button @click="changeSummary(true)"
                class="mt-2 flex flex-row items-center text-gray-400 transition ease-in-out duration-350 w-full border text-sm rounded-md p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 hover:bg-gray-600 active:bg-gray-800">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-5 h-5">
                        <path stroke-linecap="round" stroke-linejoin="round"
                            d="M18.375 12.739l-7.693 7.693a4.5 4.5 0 01-6.364-6.364l10.94-10.94A3 3 0 1119.5 7.372L8.552 18.32m.009-.01l-.01.01m5.699-9.941l-7.81 7.81a1.5 1.5 0 002.112 2.13" />
                    </svg>
                </div>
                <div class="ml-2">
                    Файл
                </div>
            </button>
        </dt>
        <dd class="mt-5 text-sm sm:col-span-2 sm:mt-0 break-words">
            <!-- Тут вывести в общюю инфу -->
            <!-- in input - v-model="userInfoCreate.summaryLink" -->
            <input
                class="transition ease-in-out duration-350 focus:outline-none focus:ring focus:ring-gray-400 focus:border-gray-500 w-full border text-sm rounded-md block p-1 bg-gray-700 border-gray-600 placeholder-gray-400"
                type="text" />
        </dd>
    </div>

    <button @click="goEmitOne">
        отправить родителю emitOne
    </button>
    <button @click="goEmitTwo">
        отправить родителю emitTwo
    </button>
    <button @click="getProps">
        получить пропс
    </button>
</template>

<script setup>
import AddSummaryFile from './AddSummaryFile.vue';

import { useOptionsStore } from '../../../../../store/oprionsStore';


const optionsStore = useOptionsStore()

const changeSummary = (boolean) => {
    optionsStore.setSummaryLinkOrFile(boolean)
}

const emit = defineEmits(['testemitone', 'testemittwo'])
const props = defineProps({
    propss: {
        type: String,
        required: true
    }
})
const goEmitOne = () => {
    emit('testemitone', 'test one')
}
const goEmitTwo = () => {
    emit('testemittwo', 'test two')
}
const getProps = () => {
    console.log(props.propss)
}

</script>

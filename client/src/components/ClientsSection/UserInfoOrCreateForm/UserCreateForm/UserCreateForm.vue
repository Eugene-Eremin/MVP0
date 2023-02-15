<template>
    <!-- Создать пользователя  -->
    <div class="overflow-hidden rounded-md">

        <div class="px-4 py-1 flex bg-gray-700">
            <h3 class="my-auto text-lg font-medium leading-6 text-gray-400">Создать пользователя</h3>

            <!-- Выпадающий список с опциями -->
            <div class="ml-auto h-[49.2px] flex my-auto items-center text-gray-400">

                <OptionsDropdown v-if="userStore.admin == 'admin'" />

            </div>
        </div>

        <div class="h-[550px] border-t border-gray-700 text-gray-400 overflow-y-auto">

            <dl>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Имя:</dt>
                    <dd class="mt-1 text-sm sm:col-span-2 sm:mt-0 break-words">
                        <input v-model="userInfoCreate.name"
                            class="transition ease-in-out duration-350 focus:outline-none focus:ring focus:ring-gray-400 focus:border-gray-500 w-full border text-sm rounded-md block p-1 bg-gray-700 border-gray-600 placeholder-gray-400"
                            type="text" />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Группы пользователя:</dt>
                    <dd class=" text-sm sm:col-span-2 sm:mt-0 break-words">
                        <GroupsDropdown />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Номер телефона:</dt>
                    <dd class="mt-1 text-sm  sm:col-span-2 sm:mt-0 break-words">
                        <input v-model="userInfoCreate.phoneNumber"
                            class="transition ease-in-out duration-350 focus:outline-none focus:ring focus:ring-gray-400 focus:border-gray-500 w-full border text-sm rounded-md block p-1 bg-gray-700 border-gray-600 placeholder-gray-400"
                            type="text" />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Сфера поиска работы:</dt>
                    <dd class=" text-sm sm:col-span-2 sm:mt-0 break-words">
                        <AreasWorkDropdown />
                    </dd>
                </div>

                <!-- Файл или ссылку -->
                <div>
                    <SummaryLinkOrFile />
                </div>

                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Работает сейчас:</dt>
                    <dd class="mt-1 text-sm sm:col-span-2 sm:mt-0 break-words">
                        <WorkNowDropdown />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">
                        Последние работы:
                        <br>
                        <button @click="openDialog()"
                            class="mt-2 flex flex-row items-center text-gray-400 transition ease-in-out duration-350 w-full border text-sm rounded-md p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 hover:bg-gray-600 active:bg-gray-800">
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 00.75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 00-3.413-.387m4.5 8.006c-.194.165-.42.295-.673.38A23.978 23.978 0 0112 15.75c-2.648 0-5.195-.429-7.577-1.22a2.016 2.016 0 01-.673-.38m0 0A2.18 2.18 0 013 12.489V8.706c0-1.081.768-2.015 1.837-2.175a48.111 48.111 0 013.413-.387m7.5 0V5.25A2.25 2.25 0 0013.5 3h-3a2.25 2.25 0 00-2.25 2.25v.894m7.5 0a48.667 48.667 0 00-7.5 0M12 12.75h.008v.008H12v-.008z" />
                                </svg>
                            </div>
                            <div class="ml-2">
                                Добавить работу
                            </div>
                        </button>
                    </dt>
                    <dd class="mt-1 text-sm sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <AddPastWork :addPastWork="true" />
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Название компании: Google
                                    </div>
                                    <div class="m-auto p-1">
                                        Сфера: IT
                                    </div>
                                    <div class="m-auto p-1">
                                        Должность: Директор
                                    </div>
                                    <div class="m-auto p-1">
                                        Начало работы: 2022/11
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Уровень образования:</dt>
                    <dd class="mt-1 text-sm  sm:col-span-2 sm:mt-0 break-words">Высшее</dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Владеемые языки:</dt>
                    <dd class="mt-1 text-sm  sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Английский
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Английский
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Английский
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Английский
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Владеемые навыки:</dt>
                    <dd class="mt-1 text-sm sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Стрессоустойчивость
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Стрессоустойчивость
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Стрессоустойчивость
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Стрессоустойчивость
                                    </div>
                                    <div class="m-auto p-1">
                                        Уровень владения 0-10: 5
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Социальные сети:</dt>
                    <dd class="mt-1 text-sm sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto p-1">
                                        Linkedin
                                    </div>
                                    <div class="m-auto p-1">
                                        <a class="underline" href="https://test.com">https://test.com</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
            </dl>
        </div>

    </div>
</template>

<script setup>
import OptionsDropdown from './OptionsDropdown.vue';

import GroupsDropdown from './InputFields/GroupsDropdown.vue'
import AreasWorkDropdown from './InputFields/AreasWorkDropdown.vue';
import WorkNowDropdown from './InputFields/WorkNowDropdown.vue'
import SummaryLinkOrFile from './InputFields/SummaryLinkOrFile.vue';
import AddPastWork from './InputFields/AddPastWork.vue';
import AddSpokenLanguages from './InputFields/AddSpokenLanguages.vue';
import AddOwnedSkills from './InputFields/AddOwnedSkills.vue';
import AddSocialMedia from './InputFields/AddSocialMedia.vue';

import { ref, reactive } from 'vue';

import { useOptionsStore } from '../../../../store/oprionsStore';
import { useUserStore } from '../../../../store/userStore';

const userStore = useUserStore()

let dialog = false;

const openDialog = () => {
    dialog = true;
}

const userInfoCreate = reactive({
    name: null, // ввод вручную ФИО...
    groups: null, // [0 (админ), 2(работодатель)] - будет выбирать из выпад. списка
    phoneNumber: null, // ввод вручную только цифры
    searchScopeJob: null, // 1 (недвижимость) или 3 (строительство) - выбирает из выпад. списка
    summary: null, // функционал загрузки файла и закрепления его за этим пользователем
    summaryLink: null, // или вместо файла ссылка на резюме в ручную
    workNow: null, // true (да) или false (нет)
    lastJobs: null, // [ ['Google', 'IT', 'Директор', '2022/11'], [...], ...]
    eucationLevel: null, // 1 (высшее), 2 (среднее)
    spokenLanguages: null, // [ ['Английский', '9'], [...], ...]
    ownedSkills: null, // [ ['Стрессоустойчиость', '6'], [...], ...]
    socialMedia: null, // [ ['Linkedin', 'https://test.com'], [...], ...]
})

</script>
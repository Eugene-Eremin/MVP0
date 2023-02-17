<template><!-- Создать пользователя  -->
    <div class="overflow-hidden rounded-md">

        <div class="px-4 py-1 flex bg-gray-700">
            <h3 class="my-auto text-lg font-medium leading-6 text-gray-400">Создать пользователя</h3>

            <!-- Выпадающий список с опциями -->
            <div class="ml-auto h-[49.2px] flex my-auto items-center text-gray-400">

                <OptionsDropdown v-if="userStore.admin == 'admin'" />

            </div>
        </div>

        <div class="h-[550px] border-t w-full border-gray-700 text-gray-400 overflow-y-auto">

            <dl>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Имя:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">
                        <input v-model="userInfoCreate.name"
                            class="transition ease-in-out duration-350 focus:outline-none focus:ring focus:ring-gray-400 focus:border-gray-500 w-full border text-sm rounded-md block p-1 bg-gray-700 border-gray-600 placeholder-gray-400"
                            type="text" />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Группы пользователя:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">
                        <!-- Выпадающий список с группами -->
                        <GroupsDropdown />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Номер телефона:</dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0 break-words">
                        <input v-model="userInfoCreate.phoneNumber"
                            class="transition ease-in-out duration-350 focus:outline-none focus:ring focus:ring-gray-400 focus:border-gray-500 w-full border text-sm rounded-md block p-1 bg-gray-700 border-gray-600 placeholder-gray-400"
                            type="text" />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Сфера поиска работы:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">
                        <!-- Выпадающий список с сферами работы -->
                        <AreasWorkDropdown />
                    </dd>
                </div>

                <!-- Файл или ссылку -->
                <div>
                    <SummaryLinkOrFile />
                </div>

                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Работает сейчас:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">
                        <!-- Выпадающий список с выбором - да/нет -->
                        <WorkNowDropdown />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">
                        <div>
                            Последние работы:
                        </div>
                        <div class="mt-5 mb-5">
                            <!-- Форма добавления данных пользователя -->
                            <AddPastWork @addPastWorkData="addPastWorkData" class=" mx-auto" />
                        </div>
                    </dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div
                                class="pr-4 bg-gray-700 text-center flex flex-row rounded-md overflow-hidden border-b border-gray-700">
                                <div class="m-auto flex-1 p-1">
                                    Название компании
                                </div>
                                <div class="m-auto flex-1 p-1">
                                    Сфера
                                </div>
                                <div class="m-auto flex-1 p-1">
                                    Должность
                                </div>
                                <div class="m-auto flex-1 p-1">
                                    Начало работы
                                </div>
                            </div>
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <!-- Список добавленых прошлых работ -->
                                <PastWorks :pastWorkArray="pastWorkArray" />
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Уровень образования:</dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0 break-words">
                        <!-- Выпадающий список с выбором уровнем образования -->
                        <LevelEducation />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">
                        <div>
                            Владеемые языки:
                        </div>
                        <div class="mt-5 mb-5">
                            <!-- Форма добавления языков -->
                            <AddSpokenLanguage @addSpokenLanguage="addSpokenLanguage" class=" mx-auto" />
                        </div>
                    </dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div
                                class="pr-4 bg-gray-700 text-center flex flex-row rounded-md overflow-hidden border-b border-gray-700">
                                <div class="m-auto flex-1 p-1">
                                    Язык
                                </div>
                                <div class="m-auto flex-1 p-1">
                                    Уровень владени
                                    <br>
                                    от 0 до 10
                                </div>
                            </div>
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <!-- Список добавленых языков -->
                                <SpokenLanguages :socialMediaArray="socialMediaArray" />
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">
                        <div>
                            Владеемые навыки:
                        </div>
                        <div class="mt-5 mb-5">
                            <!-- Форма добавления навыков -->
                            <AddOwnedSkill @addOwnedSkill="addOwnedSkill" class=" mx-auto" />
                        </div>
                    </dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div
                                class="pr-4 bg-gray-700 text-center flex flex-row rounded-md overflow-hidden border-b border-gray-700">
                                <div class="m-auto flex-1 p-1">
                                    Навык
                                </div>
                                <div class="m-auto flex-1 p-1">
                                    Уровень владения
                                    <br>
                                    от 0 до 10
                                </div>
                            </div>
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <!-- Список добавленых навыков -->
                                <OwnedSkills :ownedSkillArray="ownedSkillArray" />
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">
                        <div>
                            Социальные сети:
                        </div>
                        <div class="mt-5 mb-5">
                            <!-- Форма добавления соц. сетей -->
                            <AddSocialMedia @addSocialMedia="addSocialMedia" class=" mx-auto" />
                        </div>
                    </dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0">
                        <div class="rounded-md overflow-hidden border border-gray-700">
                            <div
                                class="pr-4 bg-gray-700 text-center flex flex-row rounded-md overflow-hidden border-b border-gray-700">
                                <div class="m-auto flex-1 p-1">
                                    Название
                                    <br>
                                    социальной сети
                                </div>
                                <div class="m-auto flex-1 p-1">
                                    Ссылка
                                </div>
                            </div>
                            <div class="text-center overflow-y-auto p-2 pb-0 h-32 w-full">
                                <!-- Список добавленых соц. сетей -->
                                <SocialsMedia :socialMediaArray="socialMediaArray" />
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
import LevelEducation from './InputFields/LevelEducation.vue';
import AddSpokenLanguage from './InputFields/AddSpokenLanguage.vue';
import AddOwnedSkill from './InputFields/AddOwnedSkill.vue';
import AddSocialMedia from './InputFields/AddSocialMedia.vue';

import PastWorks from './ShowingFields/PastWorks.vue'
import SpokenLanguages from './ShowingFields/SpokenLanguages.vue';
import OwnedSkills from './ShowingFields/OwnedSkills.vue';
import SocialsMedia from './ShowingFields/SocialsMedia.vue';

import { ref, reactive } from 'vue';

import { useOptionsStore } from '../../../../store/oprionsStore';
import { useUserStore } from '../../../../store/userStore';

const userStore = useUserStore()

let dialog = false;
const openDialog = () => {
    dialog = true;
}

let pastWorkArray = ref([])
const addPastWorkData = (data) => {
    pastWorkArray.value = [...pastWorkArray.value, data]
}

let ownedSkillArray = ref([])
const addOwnedSkill = (data) => {
    ownedSkillArray.value = [...ownedSkillArray.value, data]
}

let spokenLanguageArray = ref([])
const addSpokenLanguage = (data) => {
    spokenLanguageArray.value = [...spokenLanguageArray.value, data]
}

let socialMediaArray = ref([])
const addSocialMedia = (data) => {
    socialMediaArray.value = [...socialMediaArray.value, data]
}

// все сюда объединить
const userInfoCreate = reactive({
    name: null, // ввод вручную ФИО...
    groups: null, // [0 (админ), 2(работодатель)] - будет выбирать из выпад. списка
    phoneNumber: null, // ввод вручную только цифры
    searchScopeJob: null, // 1 (недвижимость) или 3 (строительство) - выбирает из выпад. списка
    summary: null, // функционал загрузки файла и закрепления его за этим пользователем
    summaryLink: null, // или вместо файла ссылка на резюме в ручную
    workNow: null, // true (да) или false (нет)
    lastJobs: null, // [ { companyName: 'Google', ...: 'IT', ...: 'Директор', ...: '2004-07-31'}, {...}, ...]
    eucationLevel: null, // 1 (высшее), 2 (среднее)
    spokenLanguages: null, // [ {...}, ...]
    ownedSkills: null, // [ {...}, ...]
    socialMedia: null, // [ {...}, ...]
})

</script>
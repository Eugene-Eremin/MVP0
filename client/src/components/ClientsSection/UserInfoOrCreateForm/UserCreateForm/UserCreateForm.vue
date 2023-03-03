<template>
    <div class="overflow-hidden rounded-md">
        <div class="px-4 py-1 flex bg-gray-700">
            <h3 class="my-auto text-lg font-medium leading-6 text-gray-400">Создать пользователя</h3>
            <!-- Выпадающий список с опциями -->
            <div class="ml-auto h-[49.2px] flex my-auto items-center text-gray-400">
                <OptionsDropdown v-if="userStore.admin == 'admin'" />
            </div>
        </div>

        <div class="h-[550px] border-t w-full border-gray-700 text-gray-400 overflow-x-hidden overflow-y-auto">
            <!-- class="2xl:w-[517.6px] xl:w-[462.25px]" -->
            <dl class="  max-w-none ">
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Имя:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words px-4">
                        <v-text-field maxlength="64" v-model="userInfoCreate.name" :counter="64" :rules="generalRules"
                            variant="underlined" required></v-text-field>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Группы пользователя:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words px-4">
                        <!-- Выпадающий список с группами -->
                        <GroupsDropdown @addGroups="addGroups" />
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Номер телефона:</dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0 break-words px-4">
                        <v-text-field v-model="userInfoCreate.phoneNumber" v-mask="'+# ### ### ## ##'"
                            :rules="phoneNumberRules" variant="underlined" required></v-text-field>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Сфера поиска работы:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words px-4">
                        <!-- Выпадающий список с сферами работы -->
                        <AreasWorkDropdown @addJobSearchAreas="addJobSearchAreas" />
                    </dd>
                </div>
                <!-- Файл или ссылку -->
                <div>
                    <SummaryLinkOrFile @addSummaryLinkOrFile="addSummaryLinkOrFile" />
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Работает сейчас:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words px-4">
                        <!-- Выпадающий список с выбором - да/нет -->
                        <WorkNowDropdown @addWorkNow="addWorkNow" />
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
                                <PastWorks @remove="removePastWork" @changePastWork="changePastWork"
                                    :pastWorkArray="pastWorkArray" />
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Уровень образования:</dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0 break-words px-4">
                        <!-- Выпадающий список с выбором уровнем образования -->
                        <LevelEducation @addLevelEducation="addLevelEducation" />
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
                                <SpokenLanguages @remove="removeSpokenLanguage" @changeSpokenLanguage="changeSpokenLanguage"
                                    :spokenLanguageArray="spokenLanguageArray" />
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
                            <AddOwnedSkill :jobSearchAreas="userInfoCreate.jobSearchAreas" @addOwnedSkill="addOwnedSkill" class=" mx-auto" />
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
                                <OwnedSkills @remove="removeOwnedSkill" @changeOwnedSkill="changeOwnedSkill"
                                    :ownedSkillArray="ownedSkillArray" :jobSearchAreas="userInfoCreate.jobSearchAreas" />
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

import PastWorks from './ShowingFields/PastWorks/PastWorks.vue';
import SpokenLanguages from './ShowingFields/SpokenLanguages/SpokenLanguages.vue';
import OwnedSkills from './ShowingFields/OwnedSkills/OwnedSkills.vue';
import SocialsMedia from './ShowingFields/SocialsMedia/SocialsMedia.vue';

import { ref, reactive } from 'vue';

import { useUserStore } from '../../../../store/userStore';

const userStore = useUserStore()

// ...

const addGroups = (data) => {
    userInfoCreate.groupsArray = data
}

const addJobSearchAreas = (data) => {
    userInfoCreate.jobSearchAreas = data

}

const addSummaryLinkOrFile = (data) => {
    if (typeof data == 'object') {
        userInfoCreate.summaryLink = null
        userInfoCreate.summaryFile = data
    } else {
        userInfoCreate.summaryFile = null
        userInfoCreate.summaryLink = data
    }
}

const addWorkNow = (data) => {
    userInfoCreate.workNow = data
}

const addLevelEducation = (data) => {
    userInfoCreate.eucationLevel = data
}

// -

let pastWorkArray = ref([])
const addPastWorkData = (data) => {
    let thisData = { ...data }
    pastWorkArray.value = [...pastWorkArray.value, data]
    thisData.scopeWork = thisData.scopeWork.num
    userInfoCreate.lastJobs = [...userInfoCreate.lastJobs, thisData]
}

const removePastWork = (removeIndex) => {
    let thisRemoveIndex = removeIndex
    userInfoCreate.lastJobs = userInfoCreate.lastJobs.filter((el, index) => { return index !== thisRemoveIndex });
    pastWorkArray.value = pastWorkArray.value.filter((el, index) => { return index !== thisRemoveIndex });
}

const changePastWork = (object) => {
    let thisObjectData = { ...object.data }
    pastWorkArray.value[object.index] = object.data
    thisObjectData.scopeWork = thisObjectData.scopeWork.num
    userInfoCreate.lastJobs[object.index] = thisObjectData
}

// -

let spokenLanguageArray = ref([])
const addSpokenLanguage = (data) => {
    let thisData = { ...data }
    spokenLanguageArray.value = [...spokenLanguageArray.value, data]
    thisData.language = thisData.language.num
    userInfoCreate.spokenLanguages = [...userInfoCreate.spokenLanguages, thisData]
}

const removeSpokenLanguage = (removeIndex) => {
    let thisRemoveIndex = removeIndex
    userInfoCreate.spokenLanguages = userInfoCreate.spokenLanguages.filter((el, index) => { return index !== thisRemoveIndex });
    spokenLanguageArray.value = spokenLanguageArray.value.filter((el, index) => { return index !== thisRemoveIndex });
}

const changeSpokenLanguage = (object) => {
    let thisObjectData = { ...object.data }
    spokenLanguageArray.value[object.index] = object.data
    thisObjectData.language = thisObjectData.language.num
    userInfoCreate.spokenLanguages[object.index] = thisObjectData
}

// -

// Даделать в папке OwnedSkills 
let ownedSkillArray = ref([])
const addOwnedSkill = (data) => {
    let thisData = { ...data }
    ownedSkillArray.value = [...ownedSkillArray.value, data]
    thisData.skill = thisData.skill.num
    userInfoCreate.ownedSkills = [...userInfoCreate.ownedSkills, thisData]
}

const removeOwnedSkill = (removeIndex) => {
    let thisRemoveIndex = removeIndex
    userInfoCreate.ownedSkills = userInfoCreate.ownedSkills.filter((el, index) => { return index !== thisRemoveIndex });
    ownedSkillArray.value = ownedSkillArray.value.filter((el, index) => { return index !== thisRemoveIndex });
}

const changeOwnedSkill = (object) => {
    let thisObjectData = { ...object.data }
    ownedSkillArray.value[object.index] = object.data
    thisObjectData.skill = thisObjectData.skill.num
    userInfoCreate.ownedSkills[object.index] = thisObjectData
}

// -

let socialMediaArray = ref([])
const addSocialMedia = (data) => {
    socialMediaArray.value = [...socialMediaArray.value, data]
}

// Информация о создаваемом пользователе
const userInfoCreate = reactive({
    name: '',
    groupsArray: [],
    phoneNumber: '',
    // Number(number.substring(1, number.length).split(' ').join(''))
    jobSearchAreas: null,
    summaryFile: {},
    summaryLink: '',
    workNow: null,
    lastJobs: [],
    eucationLevel: null,
    spokenLanguages: [],
    ownedSkills: [], // ?
    socialMedia: null,
})

// ...

const generalRules = [
    v => !!v || 'Обязательное поле'
]

const phoneNumberRules = [
    v => !!v || 'Обязательное поле',
    v => (v.length > 15) || 'Введите номер полностью',
]

</script>
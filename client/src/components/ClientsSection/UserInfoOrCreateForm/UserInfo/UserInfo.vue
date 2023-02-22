<template>
    <div class="overflow-hidden rounded-md">
        <div class="px-4 py-1 flex bg-gray-700">
            <h3 class="my-auto text-lg font-medium leading-6 text-gray-400">Выбранный пользователь</h3>
            <!-- Выпадающий список с опциями -->
            <div class="ml-auto h-[49.2px] flex my-auto items-center text-gray-400">
                <OptionsDropdown v-if="userStore.admin == 'admin'" />
            </div>
        </div>

        <div class="h-[550px] border-t border-gray-700 text-gray-400 overflow-x-hidden overflow-y-auto">
            <!-- Пока так-->
            <dl class="w-full">
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Имя:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">Сергей Сергеев Сергеевич</dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Группы пользователя:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">Администратор, Работадатель
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Номер телефона:</dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0 break-words">+7 900 000 00 00</dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Сфера поиска работы:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">Недвижимость</dd>
                </div>
                <!-- Показывать в зависимости у пользователя файл или ссылка -->
                <div v-if="true"
                    class="border-b border-gray-700 bg-gray-800  px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Резюме:</dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0">
                        <ul role="list" class="divide-y divide-gray-700 rounded-md border border-gray-700">
                            <li class="flex items-center justify-between py-3 pl-3 pr-4 text-sm">
                                <div class="flex w-0 flex-1 items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                        class="w-6 h-6">
                                        <path
                                            d="M11.47 1.72a.75.75 0 011.06 0l3 3a.75.75 0 01-1.06 1.06l-1.72-1.72V7.5h-1.5V4.06L9.53 5.78a.75.75 0 01-1.06-1.06l3-3zM11.25 7.5V15a.75.75 0 001.5 0V7.5h3.75a3 3 0 013 3v9a3 3 0 01-3 3h-9a3 3 0 01-3-3v-9a3 3 0 013-3h3.75z" />
                                    </svg>
                                    <span class="ml-2 w-0 flex-1 truncate">resume_back_end_developer.pdf</span>
                                </div>
                                <div class="ml-4 flex-shrink-0">
                                    <a @click="downloadSelectedResume"
                                        class="cursor-pointer active:text-gray-500 transition ease-in-out duration-350 font-medium text-gray-400 hover:text-gray-300">Скачать</a>
                                </div>
                            </li>
                        </ul>
                    </dd>
                </div>
                <div v-else class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Ссылка на резюме:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">...</dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Работает сейчас:</dt>
                    <dd class="text-sm sm:col-span-2 sm:mt-0 break-words">Нет</dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Последние работы:</dt>
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
                                <!-- Пока так -->
                                <div v-for="item in 5"
                                    class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto flex-1 p-1">
                                        Google
                                    </div>
                                    <div class="m-auto flex-1 p-1">
                                        IT
                                    </div>
                                    <div class="m-auto flex-1 p-1">
                                        Директор
                                    </div>
                                    <div class="m-auto flex-1 p-1">
                                        2022
                                        <br>
                                        11/11
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Уровень образования:</dt>
                    <dd class="text-sm  sm:col-span-2 sm:mt-0 break-words">Среднее специальное</dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Владеемые языки:</dt>
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
                                <!-- Пока так -->
                                <div v-for="item in 5"
                                    class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto flex-1 p-1">
                                        Английский
                                    </div>
                                    <div class="m-auto flex-1 p-1">
                                        5
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium">Владеемые навыки:</dt>
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
                                <!-- Пока так -->
                                <div v-for="item in 5"
                                    class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto flex-1 p-1">
                                        Стрессоустойчивость
                                    </div>
                                    <div class="m-auto flex-1 p-1">
                                        5
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dd>
                </div>
                <div class="border-b border-gray-700 bg-gray-800 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                    <dt class="text-sm font-medium ">Социальные сети:</dt>
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
                                <!-- Пока так -->
                                <div class="mb-2 flex flex-row rounded-md overflow-hidden border border-gray-700">
                                    <div class="m-auto flex-1 p-1">
                                        Linkedin
                                    </div>
                                    <div class="m-auto flex-1 p-1">
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

import { useUserStore } from '../../../../store/userStore';

const userStore = useUserStore()

const downloadSelectedResume = () => {
    console.log('Скачать резюме выбранного пользователся')
    // ...
}

</script>

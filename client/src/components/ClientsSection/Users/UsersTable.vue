<template>
    <div class="overflow-y-scroll md:w-auto 1.8xl:h-[545px] h-[488px]">
        <table class="w-full text-center text-sm text-gray-400">
            <thead class="text-xs uppercase bg-gray-700">
                <tr>
                    <th class="px-6 py-3">
                        Номер телефона
                    </th>
                    <th class="px-6 py-3">
                        Имя
                    </th>
                    <th class="px-6 py-3">
                        Сфера
                    </th>
                    <th class="px-6 py-3">
                        Резюме
                    </th>
                    <th v-if="userStore.admin == 'admin'" class="px-6 py-3"></th>
                </tr>
            </thead>

            <tbody class="mt-10">
                <!-- Пока так -->
                <tr v-for="item in 10"
                    class="cursor-pointer transition ease-in-out duration-350 border-b bg-gray-800 border-gray-700 hover:bg-gray-600">
                    <td @click="openUser" class="px-6 py-3">
                        +7 900 000 00 00
                    </td>
                    <td @click="openUser" class="px-6 py-3">
                        Сергей Сергеев Сергеевич
                    </td>
                    <td @click="openUser" class="px-6 py-3">
                        Недвижимость
                    </td>
                    <td class="px-6 py-3">
                        <svg @click="downloadResume" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                            fill="currentColor"
                            class="active:bg-gray-800 transition ease-in-out duration-350 w-10 h-10 mx-auto rounded-md p-2 hover:bg-gray-700">
                            <path
                                d="M11.47 1.72a.75.75 0 011.06 0l3 3a.75.75 0 01-1.06 1.06l-1.72-1.72V7.5h-1.5V4.06L9.53 5.78a.75.75 0 01-1.06-1.06l3-3zM11.25 7.5V15a.75.75 0 001.5 0V7.5h3.75a3 3 0 013 3v9a3 3 0 01-3 3h-9a3 3 0 01-3-3v-9a3 3 0 013-3h3.75z" />
                        </svg>
                    </td>
                    <td v-if="userStore.admin == 'admin'" scope="col" class="px-6 py-3">
                        <svg @click="deleteUser" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                            class="active:bg-gray-800 transition ease-in-out duration-350 w-10 h-10 mx-auto rounded-md p-2 hover:bg-gray-700">
                            <path fill-rule="evenodd"
                                d="M16.5 4.478v.227a48.816 48.816 0 013.878.512.75.75 0 11-.256 1.478l-.209-.035-1.005 13.07a3 3 0 01-2.991 2.77H8.084a3 3 0 01-2.991-2.77L4.087 6.66l-.209.035a.75.75 0 01-.256-1.478A48.567 48.567 0 017.5 4.705v-.227c0-1.564 1.213-2.9 2.816-2.951a52.662 52.662 0 013.369 0c1.603.051 2.815 1.387 2.815 2.951zm-6.136-1.452a51.196 51.196 0 013.273 0C14.39 3.05 15 3.684 15 4.478v.113a49.488 49.488 0 00-6 0v-.113c0-.794.609-1.428 1.364-1.452zm-.355 5.945a.75.75 0 10-1.5.058l.347 9a.75.75 0 101.499-.058l-.346-9zm5.48.058a.75.75 0 10-1.498-.058l-.347 9a.75.75 0 001.5.058l.345-9z"
                                clip-rule="evenodd" />
                        </svg>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
import { useUserStore } from '../../../store/userStore';

const userStore = useUserStore()

const openUser = () => {
    console.log('Открыть пользователя')
    // ...
}

const downloadResume = () => {
    console.log('Скачать резюме')
    // ...
}

const deleteUser = () => {
    console.log('Удалить пользователя')
    // ...
}

</script>

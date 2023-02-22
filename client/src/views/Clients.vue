<template>
    <div class="flex flex-col xl:flex-row justify-center items-start">
        <!-- Пользователи -->
        <div class="w-[370px] 0.5sm:w-[490px] md:w-[750px] mx-auto p-10 drop-shadow-2xl lg:w-3/5">
            <div class="pb-4 flex flex-col 1.8xl:flex-row items-center">
                <!-- Search форма -->
                <SearchForm />
                <!-- Кнопка добавить пользователя -->
                <AddOrViewUser @changeSelectedOrCreate="selectedOrCreate = !selectedOrCreate"
                    v-if="userStore.admin == 'admin'" :selectedOrCreate="selectedOrCreate" />
            </div>
            <div class="rounded-md overflow-hidden">
                <!-- Таблица -->
                <UsersTable />
            </div>
        </div>

        <!-- Инфо. выбранного пользователя или форма создание нового -->
        <div class="w-[370px] 0.5sm:w-[490px] md:w-[750px] drop-shadow-2xl mx-auto p-10 lg:w-2/5">
            <!-- Информация выбранного пользователя  -->
            <div v-show="selectedOrCreate">
                <UserInfo />
            </div>
            <!-- Создать пользователя -->
            <div v-if="userStore.admin == 'admin'" v-show="!selectedOrCreate">
                <UserCreateForm />
            </div>
        </div>
    </div>
</template>

<script setup>
import SearchForm from '../components/ClientsSection/Users/SearchForm.vue'
import AddOrViewUser from '../components/ClientsSection/Users/AddOrViewUser.vue';
import UsersTable from '../components/ClientsSection/Users/UsersTable.vue';
import UserInfo from '../components/ClientsSection/UserInfoOrCreateForm/UserInfo/UserInfo.vue';
import UserCreateForm from '../components/ClientsSection/UserInfoOrCreateForm/UserCreateForm/UserCreateForm.vue';

import { ref } from 'vue';
import { useRoute } from 'vue-router'

import { useNavbarStore } from '../store/navbarStore';
import { useUserStore } from '../store/userStore'

const userStore = useUserStore()

const navbarStore = useNavbarStore()
navbarStore.pathNow = useRoute().path

// ---

let selectedOrCreate = ref(true)

// ---

document.title = 'Клиенты'

</script>
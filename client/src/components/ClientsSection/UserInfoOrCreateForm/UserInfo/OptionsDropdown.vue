<template>
    <!-- Выпадающий список с опциями -->
    <Menu as="div" class="relative inline-block text-left">
        <div>
            <MenuButton
                class="transition ease-in-out duration-350 inline-flex w-full justify-center rounded-md bg-gray-800 px-4 py-2 text-sm font-medium hover:bg-opacity-50 active:bg-gray-900 focus:outline-none focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-75">
                <div class="mr-1">Опции</div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                    class="w-5 h-5">
                    <path fill-rule="evenodd"
                        d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"
                        clip-rule="evenodd" />
                </svg>
            </MenuButton>
        </div>

        <transition enter-active-class="transition duration-100 ease-out"
            enter-from-class="transform scale-95 opacity-0" enter-to-class="transform scale-100 opacity-100"
            leave-active-class="transition duration-75 ease-in"
            leave-from-class="transform scale-100 opacity-100"
            leave-to-class="transform scale-95 opacity-0">
            <MenuItems
                class="absolute right-0 mt-2 w-56 origin-top-right divide-y divide-gray-100 rounded-md bg-gray-900 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                <div class="px-1 py-1">
                    <MenuItem v-slot="{ active }">
                    <button @click="saveSelectedChanges" :class="[
                        active ? 'transition ease-in-out duration-350 bg-green-700 text-gray-900' : 'text-gray-400',
                        'group flex w-full items-center rounded-md px-2 py-2 text-sm',
                    ]">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                            class="w-5 h-5">
                            <path fill-rule="evenodd"
                                d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z"
                                clip-rule="evenodd" />
                        </svg>
                        <div class="ml-2">Сохранить</div>
                    </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                    <button @click="removeSelectedChanges" :class="[
                        active ? 'transition ease-in-out duration-350 bg-yellow-700 text-gray-900' : 'text-gray-400',
                        'group flex w-full items-center rounded-md px-2 py-2 text-sm',
                    ]">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                            class="w-5 h-5">
                            <path fill-rule="evenodd"
                                d="M15.312 11.424a5.5 5.5 0 01-9.201 2.466l-.312-.311h2.433a.75.75 0 000-1.5H3.989a.75.75 0 00-.75.75v4.242a.75.75 0 001.5 0v-2.43l.31.31a7 7 0 0011.712-3.138.75.75 0 00-1.449-.39zm1.23-3.723a.75.75 0 00.219-.53V2.929a.75.75 0 00-1.5 0V5.36l-.31-.31A7 7 0 003.239 8.188a.75.75 0 101.448.389A5.5 5.5 0 0113.89 6.11l.311.31h-2.432a.75.75 0 000 1.5h4.243a.75.75 0 00.53-.219z"
                                clip-rule="evenodd" />
                        </svg>
                        <div class="ml-2">Убрать изменения</div>
                    </button>
                    </MenuItem>
                    <MenuItem v-slot="{ active }">
                    <button @click="deleteSeletedUser" :class="[
                        active ? 'transition ease-in-out duration-350 bg-red-700 text-gray-900' : 'text-gray-400',
                        'group flex w-full items-center rounded-md px-2 py-2 text-sm',
                    ]">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                            class="w-5 h-5">
                            <path fill-rule="evenodd"
                                d="M8.75 1A2.75 2.75 0 006 3.75v.443c-.795.077-1.584.176-2.365.298a.75.75 0 10.23 1.482l.149-.022.841 10.518A2.75 2.75 0 007.596 19h4.807a2.75 2.75 0 002.742-2.53l.841-10.52.149.023a.75.75 0 00.23-1.482A41.03 41.03 0 0014 4.193V3.75A2.75 2.75 0 0011.25 1h-2.5zM10 4c.84 0 1.673.025 2.5.075V3.75c0-.69-.56-1.25-1.25-1.25h-2.5c-.69 0-1.25.56-1.25 1.25v.325C8.327 4.025 9.16 4 10 4zM8.58 7.72a.75.75 0 00-1.5.06l.3 7.5a.75.75 0 101.5-.06l-.3-7.5zm4.34.06a.75.75 0 10-1.5-.06l-.3 7.5a.75.75 0 101.5.06l.3-7.5z"
                                clip-rule="evenodd" />
                        </svg>
                        <div class="ml-2">Удалить</div>
                    </button>
                    </MenuItem>
                </div>
            </MenuItems>
        </transition>
    </Menu>
</template>

<script setup>
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'

const saveSelectedChanges = () => {
    console.log('Сохранить выбранного пользователя')
}

const removeSelectedChanges = () => {
    console.log('Убрать изменения выбранного пользователя')
}

const deleteSeletedUser = () => {
    console.log('Удалить выбранного пользователя')
}


</script>

<template>
    <div class="fixed top-16 w-56 text-right">
       
    </div>
</template>

<script setup>
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'

import { useRouter, useRoute } from 'vue-router'

import { useNavbarStore } from '../store/navbarStore';

const navbarStore = useNavbarStore()

navbarStore.pathNow = useRoute().path

let active = true

let checkDropdown = true;

const checkDropdownChange = () => {
    checkDropdown ? checkDropdown = false : checkDropdown = true
}


document.title = 'Подборки'

</script>

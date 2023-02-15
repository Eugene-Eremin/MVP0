<template>
    <div>
        <img src="http://localhost:5000/pinia.png" />
        <a href="http://localhost:5000/pinia.png" download>Содержимое элемента</a> 
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter, useRoute } from 'vue-router'

import { Dialog, DialogPanel, DialogTitle, TransitionChild, TransitionRoot } from '@headlessui/vue'
import { ExclamationTriangleIcon } from '@heroicons/vue/24/outline'

import { useNavbarStore } from '../store/navbarStore';

const navbarStore = useNavbarStore()

navbarStore.pathNow = useRoute().path

const aa = ref(true)

const open = ref(true)

document.title = 'Редактирование таблиц'
</script>
<template>
    <div>
        ConfirmationOfThePhoneNumber
    </div>
</template>

<script setup>
import { useRoute } from 'vue-router'

import { useNavbarStore } from '../../store/navbarStore';

const navbarStore = useNavbarStore()
navbarStore.pathNow = useRoute().path

document.title = 'Подтверждение номера телефона'

</script>

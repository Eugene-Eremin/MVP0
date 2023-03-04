<template>
    <div>
        EmailConfirmation
    </div>
</template>

<script setup>
import { useRoute } from 'vue-router'

import { useNavbarStore } from '../../store/navbarStore';

const navbarStore = useNavbarStore()
navbarStore.pathNow = useRoute().path

document.title = 'Подтверждение электронной почты'

</script>

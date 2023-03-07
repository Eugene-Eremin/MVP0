<template>
  <div>
    <header v-if="userStore.authorized" class="mb-16">
      <NavbarForAdmin v-if="userStore.role == 'admin'" />
      <NavbarForApplicant v-else-if="userStore.role == 'applicant'" />
      <NavbarForEmployer v-else />
    </header>
    <header v-else class="mb-16">
      <NavbarForUnauthorized />
    </header>
    <main>
      <RouterView />
    </main>
    <footer>
      <!-- ... -->
    </footer>
  </div>
</template>

<script setup>
import NavbarForAdmin from './components/Navbar/NavbarForAdmin.vue';
import NavbarForApplicant from './components/Navbar/NavbarForApplicant.vue';
import NavbarForEmployer from './components/Navbar/NavbarForEmployer.vue';
import NavbarForUnauthorized from './components/Navbar/NavbarForUnauthorized.vue';

import { onBeforeMount } from 'vue';
import { RouterView } from 'vue-router'

import { useUserStore } from './store/userStore'

const userStore = useUserStore()

onBeforeMount(() => {
  if (localStorage.getItem('token')) userStore.checkAuth()

  // const rolesTest = ['admin', 'applicant', 'employer']
  // userStore.authorized = false
  // userStore.role = rolesTest[0]
})

</script>
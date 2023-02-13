<template>
  <div>
    <header class="mb-16">
      <NavbarForAdmin v-if="userStore.admin == 'admin'" />
      <NavbarForApplicant v-else-if="userStore.admin == 'applicant'" />
      <NavbarForEmployer v-else />
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

import { ref, onBeforeMount } from 'vue';
import { RouterLink, RouterView } from 'vue-router'

import { useUserStore } from './store/userStore'

const userStore = useUserStore()

onBeforeMount(() => {
  // ...
  const rolesTest = ['admin', 'applicant', 'employer']
  userStore.admin = rolesTest[0]
  // ...
})

</script>
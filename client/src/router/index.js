// Composables
import { createRouter, createWebHistory } from 'vue-router'

import Home from '../views/Home.vue'
import Clients from '../views/Clients.vue'
import Vacancies from '../views/Vacancies.vue'
import Selections from '../views/Selections.vue'
import TableEditing from '../views/TableEditing.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home,
      meta: { auth: true }
    },
    {
      path: '/clients',
      name: 'Clients',
      component: Clients,
      meta: { auth: true, role: ['admin', 'employer'] }
    },
    {
      path: '/vacancies',
      name: 'Vacancies',
      component: Vacancies,
      meta: { auth: true }
    },
    {
      path: '/selections',
      name: 'Selections',
      component: Selections,
      meta: { auth: true, role: 'admin' }
    },
    {
      path: '/table-editing',
      name: 'TableEditing',
      component: TableEditing,
      meta: { auth: true, role: 'admin' }
    },
  ]
})

export default router

import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useUserStore = defineStore('userStore', () => {

    const role = ''

    const authorized = false

    return { role, authorized }
})
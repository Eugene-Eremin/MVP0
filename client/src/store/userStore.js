import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useUserStore = defineStore('userStore', () => {

    const role = null

    const authorized = null

    return { role, authorized }
})
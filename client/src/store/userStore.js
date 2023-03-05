import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useUserStore = defineStore('userStore', () => {

    const email = null
    const phoneNumber = null

    const isEmailActivated = null
    const isPhoneNumberActivated = null

    const role = null

    const authorized = null

    return { email, phoneNumber, isEmailActivated, isPhoneNumberActivated, role, authorized }
})
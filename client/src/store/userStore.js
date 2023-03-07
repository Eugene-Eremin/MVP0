import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

import AuthService from '@/services/AuthService'

import { API_URL } from '@/http/index'

import axios from 'axios'

export const useUserStore = defineStore('userStore', () => {

    const user = ref({})

    const authorized = ref(false)

    const isLoading = ref(null)

    const id = ref(null)

    const email = ref(null)
    const phoneNumber = ref(null)

    const isEmailActivated = ref(null)
    const isPhoneNumberActivated = ref(null)

    const setAuth = (bool) => {
        authorized.value = bool
    }

    const setUser = (thisUser) => {
        user.value = thisUser

        id.value = thisUser.id
        email.value = thisUser?.email
        phoneNumber.value = thisUser?.phoneNumber
        isEmailActivated.value = thisUser?.isEmailActivated
        isPhoneNumberActivated.value = thisUser?.isPhoneNumberActivated
    }

    const login = async (email, password) => {
        try {
            const response = await AuthService.login(email, password)
            console.log(response)
            localStorage.setItem('token', response.data.accessToken)
            setAuth(true)
            setUser(response.data.user)
        } catch (e) {
            console.log(e.response?.data?.message)
        }
    }

    const registration = async (email, password) => {
        try {
            const response = await AuthService.registration(email, password)
            console.log(response)
            localStorage.setItem('token', response.data.accessToken)
            setAuth(true)
            setUser(response.data.user)
        } catch (e) {
            console.log(e.response?.data?.message)
        }
    }

    const logout = async () => {
        try {
            const response = await AuthService.logout()
            localStorage.removeItem('token')
            setAuth(false)
            setUser({})
        } catch (e) {
            console.log(e.response?.data?.message)
        }
    }

    const checkAuth = async () => {
        setLoading(true)
        try {
            const response = await axios.get(`${API_URL}/refresh`, {
                withCredentials: true
            })
            console.log(response)
            localStorage.setItem('token', response.data.accessToken)
            setAuth(true)
            setUser(response.data.user)
        } catch (e) {
            console.log(e.response?.data?.message)
        } finally {
            setLoading(false)
        }
    }

    const setLoading = (bool) => {
        isLoading.value = bool
    }


    return {
        user,
        authorized,
        isLoading,
        email,
        phoneNumber,
        isEmailActivated,
        isPhoneNumberActivated,
        setAuth,
        setUser,
        login,
        registration,
        logout,
        checkAuth
    }
})
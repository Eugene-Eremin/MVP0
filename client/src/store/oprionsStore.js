import { ref, computed, watch } from 'vue'
import { defineStore } from 'pinia'

export const useOptionsStore = defineStore('optionsStore', () => {



    const selectedOrCreate = ref(true)

    const setSelectedOrCreate = () => {
        selectedOrCreate.value = !selectedOrCreate.value
    }

    const summaryLinkOrFile = ref(true)

    const setSummaryLinkOrFile = () => {
        summaryLinkOrFile.value = !summaryLinkOrFile.value
        console.log(summaryLinkOrFile.value)
    }




    return {
        selectedOrCreate,
        setSelectedOrCreate,
        summaryLinkOrFile,
        setSummaryLinkOrFile,




    }
})
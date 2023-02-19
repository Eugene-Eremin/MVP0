import { ref, computed, watch } from 'vue'
import { defineStore } from 'pinia'

export const useOptionsStore = defineStore('optionsStore', () => {



    const summaryLinkOrFile = ref(true)

    const setSummaryLinkOrFile = (boolean) => {
        summaryLinkOrFile.value = boolean
    }




    return {
        summaryLinkOrFile,
        setSummaryLinkOrFile,




    }
})
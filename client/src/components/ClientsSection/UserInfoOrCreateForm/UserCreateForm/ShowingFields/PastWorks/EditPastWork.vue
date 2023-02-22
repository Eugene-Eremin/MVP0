<template>
    <v-row justify="center">
        <v-dialog v-model="dialog" persistent width="600">
            <template v-slot:activator="{ props }">
                <button v-bind="props"
                    class="hover:bg-yellow-600 active:bg-yellow-700 transition ease-in-out duration-350 flex flex-row rounded-t-md border-b-0 w-20 overflow-hidden border bg-yellow-700 border-gray-700">
                    <div class="flex-1 text-white">
                        изменить
                    </div>
                </button>
            </template>
            <div>
                <v-card>
                    <v-card-title>
                        <div class="mt-2">
                            <span class="text-h5">Изменить данные прошлой работы</span>
                        </div>
                    </v-card-title>
                    <div class="p-2">
                        <v-card-text>
                            <v-form ref="form" @submit.prevent>
                                <v-text-field v-model="companyName" :rules="countRules" label="Название компании" required
                                    variant="underlined"></v-text-field>
                                <v-autocomplete v-model="scopeWork" :rules="countRules" :items="items" item-title="name"
                                    return-object label="Сфера" variant="underlined" required></v-autocomplete>
                                <v-text-field v-model="jobTitle" :rules="countRules" label="Должность" required
                                    variant="underlined"></v-text-field>
                                <v-text-field v-model="beginningWork" label="Начало работы" type="date" :rules="countRules"
                                    required variant="underlined"></v-text-field>
                                <v-btn type="submit" block color="blue-grey-darken-2" class="mt-4"
                                    @click="closeCard(false)">
                                    Назад
                                </v-btn>
                                <v-btn type="submit" block color="amber-accent-4" class="mt-4 text-white" @click="validate">
                                    Изменить
                                </v-btn>
                            </v-form>
                        </v-card-text>
                    </div>
                </v-card>
            </div>
        </v-dialog>
    </v-row>
</template>

<script>
export default {
    props: {
        pastWork: {
            type: Object,
            required: true
        },
        index: {
            type: Number,
            required: true
        }
    },
    data: () => ({
        dialog: false,
        items: [],

        origin: {},

        companyName: '',
        scopeWork: null,
        jobTitle: '',
        beginningWork: '',

        countRules: [
            v => !!v || 'Обязательное поле'
        ]
    }),
    methods: ({
        closeCard(boolean) {
            if (boolean) {
                const data = {
                    companyName: this.companyName,
                    scopeWork: this.scopeWork,
                    jobTitle: this.jobTitle,
                    beginningWork: this.beginningWork,
                }
                console.log(data)
                this.$emit("changePastWork", data)
            }

            this.dialog = false
            this.companyName = this.origin.companyName
            this.scopeWork = this.origin.scopeWork
            this.jobTitle = this.origin.jobTitle
            this.beginningWork = this.origin.beginningWork
        },
        async validate() {
            const { valid } = await this.$refs.form.validate()
            if (valid) this.closeCard(true)
        },
    }),
    mounted() {
        console.log(this.pastWork)

        this.origin = {
            companyName: this.pastWork.companyName,
            scopeWork: this.pastWork.scopeWork,
            jobTitle: this.pastWork.jobTitle,
            beginningWork: this.pastWork.beginningWork,
        }

        this.companyName = this.pastWork.companyName
        this.scopeWork = this.pastWork.scopeWork
        this.jobTitle = this.pastWork.jobTitle
        this.beginningWork = this.pastWork.beginningWork

        // Тут приходят данные с бека
        // this.items = ...
        // ...

        // Пока так
        this.items = [
            { name: 'Металлургия', num: 0 },
            { name: 'Энергетика', num: 1 },
            { name: 'Сырье', num: 2 },
            { name: 'Нефтегаз', num: 3 },
            { name: 'Недвижимость', num: 4 },
            { name: 'Фармацевтика', num: 5 },
            { name: 'Транспорт', num: 6 },
            { name: 'Информационные технологии', num: 7 },
            { name: 'Телекоммуникации', num: 8 },
        ]
    },
}
</script>

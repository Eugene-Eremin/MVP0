<!-- !!! Заметки (удалить) !!! -->

<!-- /// Отправка файла /// -->

<!-- 
<template>
    <div class="flex flex-col">
        <input @change="changeFile" type="file" />
        <button @click="sendFile" class="mr-auto">Отправить файл</button>
    </div>
</template>

<script setup>
import axios from 'axios'

testStore = useTestStore()

let file = []

const changeFile = (event) => {
    file = event.target.files[0]
    console.log(file)
}
const sendFile = async () => {
    let formData = new FormData();

    formData.append('file', file)

    await axios.post('http://localhost:5000/api/test2/testcontr2', formData)
        .then(function (response) {
            console.log(response);
        }).catch(function (error) {
            console.log(error);
        });
}

document.title = 'Home'
</script>
-->

<!-- /// Отправка данных между компонентами (props, emit) /// -->

<!-- App.vue -->
<!-- 
    <template>
    <div>
        <SomeComponent :prop="propsOne" @waitDispatchOne="getEmitOne" @waitDispatchTwo="getEmitTwo" />
    </div>
</template>

<script setup>

import SomeComponent from './SomeComponent.vue';

const getEmitOne = (event) => {
    console.log(event)
}
const getEmitTwo = (event) => {
    console.log(event)
}


const propsOne = 'props text'

</script>
-->

<!-- SomeComponent.vue -->
<!--
<template>
    <div>
        <button @click="goEmitOne">
            отправить родителю emitOne
        </button>
        <button @click="goEmitTwo">
            отправить родителю emitTwo
        </button>
        <button @click="getProps">
            получить пропс
        </button>
    </div>
</template>

<script setup>
const emit = defineEmits(['waitDispatchOne', 'testemittwo'])
const goEmitOne = () => {
    emit('waitDispatchOne', 'test one')
}
const goEmitTwo = () => {
    emit('testemittwo', 'test two')
}


const props = defineProps({
    prop: {
        type: String,
        required: true
    },
    // propTwo: {
    //     type: String,
    //     required: true
    // },
})
const getProps = () => {
    console.log(props.prop)
}
</script>
-->

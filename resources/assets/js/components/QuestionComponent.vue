<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                {{ question }}
                <message-component :question="question" v-if="showMessage"></message-component>
                <radio-component :question="question" v-if="showRadio"></radio-component>
                <input-component :question="question" v-if="showInput"></input-component>
            </div>
        </div>
    </div>
</template>

<script>
    import MessageComponent from './MessageComponent'
    import InputComponent from './InputComponent'
    import RadioComponent from './RadioComponent'



    export default {
        data() {
            return {
                question: null
            }
        },
        components: {
            MessageComponent,
            InputComponent,
            RadioComponent
        },
        mounted() {
            console.log(this.question);
            axios
                .post('/question')
                .then(response => (this.question = response.data));
        },
        computed: {
            showRadio:()=>{

                if (this.question && this.question.options && len(this.question.options) > 1){
                    return true
                }
                return false
            },
            showMessage:()=>{
                return false
            },
            showInput:()=>{
                return false
            },

        }
    }
</script>

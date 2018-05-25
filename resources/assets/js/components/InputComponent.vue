<template>
    <form class="form-signin">
        <div class="form-group row">
            <h1 class="h3 mb-3 font-weight-normal">Do you have a disability insurance?</h1>
        </div>

        <div class="form-group row">
            <input type="text" name="answer" class="form-control" required autofocus >
        </div>

        <div class="form-group row">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Next</button>
        </div>

    </form>
</template>

<script>
    export default {
        name: "InputComponent"
    }
</script>

<style scoped>

</style>
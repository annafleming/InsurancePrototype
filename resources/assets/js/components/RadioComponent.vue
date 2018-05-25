<template>
    <form class="form-signin">
        <div class="form-group row">
            <h1 class="h3 mb-3 font-weight-normal">Do you have a disability insurance?</h1>
        </div>

        <div class="form-group row justify-content-center">
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">
                <label class="form-check-label" for="inlineRadio1">Yes</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">
                <label class="form-check-label" for="inlineRadio2">No</label>
            </div>
        </div>

        <div class="form-group row">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Next</button>
        </div>

    </form>
</template>

<script>
    export default {
        name: "RadioComponent"
    }
</script>

<style scoped>

</style>
<template>
    <div class="container">
        <div v-if="formFill">
            <div class="form-group">
                <label for="email">Email:</label>
                <input
                    type="text"
                    class="form-control"
                    name="email"
                    v-model="email"
                />
            </div>
            <div class="form-group">
                <label for="email">Phone:</label>
                <input
                    type="text"
                    class="form-control"
                    name="phone"
                    v-model="phone"
                />
            </div>
            <div>
                <button
                    class="btn btn-warning btn-block"
                    type="submit"
                    @click="checkCustomer"
                >
                    Confirm
                </button>
            </div>
        </div>
        <div v-if="booleanError == true">
            <div class="alert alert-warning">
                <strong>Noop!</strong> Your email, phone not correct, try again
                !!
            </div>
        </div>
        <div v-if="confirm">
            <form :action="route" method="POST">
                <slot name="csrf"></slot>
                <div class="form-group">
                    <label for:reason>Reason:</label>
                    <textarea
                        class="form-control"
                        rows="3"
                        name="reason"
                    ></textarea>
                </div>
                <div class="form-group">
                    <input
                        hidden
                        type="number"
                        :value="ID"
                        name="id_customer"
                    />
                    <input
                        type="number"
                        :value="id_bill"
                        name="id_order"
                        hidden
                    />
                </div>
                <div class="form-group">
                    <button class="btn btn-success btn block" @click="submit()">
                        Submit
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            formFill: true,
            confirm: false,
            email: "",
            phone: "",
            booleanError: false,
            ID: this.customer.id
        };
    },
    props: ["customer", "id_bill", "route"],
    methods: {
        checkCustomer() {
            if (
                (this.email == this.customer.email) &
                (this.phone == this.customer.phone)
            ) {
                this.confirm = true;
                this.booleanError = false;
                this.formFill = false;
            } else {
                this.booleanError = true;
            }
        },
        submit() {
            alert(
                "Thank you, Your report is submitted. We will contact you later"
            );
        }
    }
};
</script>

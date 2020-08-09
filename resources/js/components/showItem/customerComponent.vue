<template>
    <div>
        <h2 class="text-center">Fill Information</h2>
        <div class="form-group">
            <label for="name">Your Full Name:</label>
            <input
                type="text"
                class="form-control"
                name="name"
                placeholder="Your Name"
            />
            <label for="gender">Gender:</label>
            <br />
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input
                        type="radio"
                        class="form-check-input"
                        value="f"
                        name="gender"
                    />Female
                </label>
            </div>
            <div class="form-check">
                <label class="form-check-label">
                    <input
                        type="radio"
                        class="form-check-input"
                        value="m"
                        name="gender"
                    />Male
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="phone">Your Phone:</label>
            <input
                type="text"
                class="form-control"
                name="phone"
                placeholder="Your Phone"
            />
            <label for="email">Email:</label>
            <input
                type="text"
                name="email"
                class="form-control"
                placeholder="Your Email"
            />
        </div>
        <div class="form-group">
            <label for="address">Address: </label>
            <input
                type="text"
                name="address"
                placeholder="Your Address"
                class="form-control"
            />
        </div>
        <div class="form-group">
            <label for="comment">Note:</label>
            <textarea
                class="form-control"
                rows="3"
                id="comment"
                name="note"
                placeholder="Note Time Receive"
            ></textarea>
        </div>
        <div>
            <div class="btn-group btn-group-lg offset-4">
                <button type="button" class="btn btn-warning" @click="back()">
                    Back
                </button>
                <button
                    type="submit"
                    class="btn btn-success"
                    @click="sesstion()"
                >
                    Confirm
                </button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ["itemForm", "customerForm", "sesstion"],
    methods: {
        back() {
            this.itemFormProp = true;
            this.customerFormProp = false;
        }
    },
    computed: {
        itemFormProp: {
            get() {
                return this.itemForm;
            },
            set(newValue) {
                this.$emit("itemFormWasChange", newValue);
            }
        },
        customerFormProp: {
            get() {
                return this.customerForm;
            },
            set(newValue) {
                this.$emit("customerFormWasChange", newValue);
            }
        }
    }
};
</script>

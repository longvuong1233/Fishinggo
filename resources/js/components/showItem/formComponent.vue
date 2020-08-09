<template>
    <div>
        <input type="text" hidden name="total" :value="totalPrice()" />
        <input type="text" name="cart" :value="getCart" hidden />
        <h4 class="text-center">Bill</h4>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in products">
                    <td>{{ index + 1 }}</td>
                    <td>{{ item.name }}</td>

                    <td>
                        <input
                            v-model="item.quantity"
                            type="number"
                            min="1"
                            max="360"
                        />
                    </td>

                    <td>{{ item.unit_price * item.quantity }},000</td>
                    <td>
                        <img
                            :src="item.image"
                            :alt="item.name"
                            class="rounded-circle"
                            style="width:50px; height:50px"
                        />
                    </td>
                    <td>
                        <button
                            type="button"
                            class="btn btn-warning"
                            @click="deleteProduct(item.id)"
                        >
                            Delete
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
            <div class="form-group">
                <label for="sel1">Select Payment:</label>
                <select class="form-control" id="sel1" name="payment">
                    <option value="cod" selected>COD</option>
                    <option value="online ">Online</option>
                </select>
            </div>
        </div>
        <div>
            <h4 style="text-align:right">Total: {{ totalPrice() }},000</h4>
        </div>
    </div>
</template>

<script>
import { store } from "../cart/store";
import { mapGetters } from "vuex";

export default {
    data() {
        return {
            newProducts: []
        };
    },
    props: ["products", "quantityProduct", "totalPrice"],

    computed: {
        ...mapGetters(["getCart"])
    },
    created() {},
    methods: {
        deleteProduct(id) {
            this.$store.commit("checkCart", [id, 0]);
        }
    },
    watch: {
        products: {
            deep: true,

            handler: function(val, oldVal) {
                this.products.forEach(element => {
                    let tempt = Object.assign({}, element);
                    this.newProducts.push(tempt);
                });
                let index_change;
                for (let i = 0; i < this.products.length; i++) {
                    if (
                        this.products[i].quantity !=
                        this.newProducts[i].quantity
                    ) {
                        this.newProducts[i].quantity = this.products[
                            i
                        ].quantity;

                        index_change = i;
                    }
                }

                if (index_change != null) {
                    this.$store.commit("checkCart", [
                        val[index_change].id,
                        val[index_change].quantity
                    ]);
                }
            }
        }
    }
};
</script>

<template>
    <div>
        <div>
            <span style="color:#000000;">
                <span
                    style="font-size:12px; position:absolute; z-index:1; left:1000px"
                >
                    <span style="font-family:arial,helvetica,sans-serif;">
                        <div>
                            <div class="shopping-cart">
                                <div class="shopping-cart-header">
                                    <i
                                        class="fa fa-shopping-cart cart-icon"
                                    ></i>

                                    <span class="badge">{{
                                        products.length
                                    }}</span>
                                    <div
                                        v-if="products.length == 0"
                                        class="pt-3"
                                    >
                                        <h6>No products in your cart</h6>
                                    </div>
                                    <div
                                        class="shopping-cart-total"
                                        v-if="products.length != 0"
                                    >
                                        <span class="lighter-text">Total:</span>
                                        <span class="main-color-text"
                                            >{{ totalPrice() }},000</span
                                        >
                                    </div>
                                </div>
                                <!--end shopping-cart-header -->

                                <ul
                                    class="shopping-cart-items"
                                    v-for="item in products"
                                >
                                    <li class="clearfix">
                                        <img
                                            :src="item.image"
                                            :alt="item.id"
                                            class="rounded-lg"
                                            style="width:50px; height:50px"
                                        />
                                        <span class="item-name">{{
                                            item.name
                                        }}</span>
                                        <span class="item-price"
                                            >{{
                                                item.unit_price *
                                                    quantityProduct(item.id)
                                            }},000</span
                                        >
                                        <span class="item-quantity"
                                            >Quantity:
                                            {{ quantityProduct(item.id) }}</span
                                        >
                                    </li>
                                </ul>

                                <div v-if="products.length != 0">
                                    <a
                                        href="#"
                                        class="button cart"
                                        @click="itemForm = !itemForm"
                                        >Checkout</a
                                    >
                                </div>
                            </div>
                            <!--end shopping-cart -->
                        </div>
                        <!--end container -->
                    </span>
                </span>
            </span>
        </div>
        <form :action="route" method="POST" enctype="multipart/form-data">
            <slot name="csrf"></slot>

            <div
                class="alert alert-primary"
                v-show="itemForm"
                style="position:absolute; z-index:3; width:50%"
            >
                <button
                    type="button"
                    class="close"
                    @click="itemForm = !itemForm"
                >
                    &times;
                </button>
                <form-component
                    :products="products"
                    :quantityProduct="quantityProduct"
                    :totalPrice="totalPrice"
                ></form-component>
                <button
                    class="btn btn-success btn-block"
                    type="button"
                    @click="openCustomer"
                >
                    Next
                </button>
            </div>

            <div v-show="customerForm">
                <div
                    class="alert alert-success"
                    style="position:absolute; z-index:3; width:50%"
                >
                    <div>
                        <button
                            type="button"
                            class="close"
                            @click="closeCustomer"
                        >
                            &times;
                        </button>
                        <customer-component
                            :customerForm="customerForm"
                            :itemForm="itemForm"
                            @itemFormWasChange="itemForm = $event"
                            @customerFormWasChange="customerForm = $event"
                            :sesstion="sesstion"
                        ></customer-component>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
import { store } from "../cart/store";
import { mapGetters } from "vuex";
import customerComponent from "./customerComponent";
import formComponent from "./formComponent";
export default {
    data() {
        return {
            products: [],
            customerForm: false,
            itemForm: false
        };
    },
    props: ["list", "route", "sesstion"],
    created() {
        this.list.forEach(element => {
            if (this.getCart.indexOf(element.id) != -1) {
                element["quantity"] = this.quantityProduct(element.id);
                this.products.push(element);
            }
        });
    },
    watch: {
        getCart() {
            this.products = [];
            this.list.forEach(element => {
                if (this.getCart.indexOf(element.id) != -1) {
                    element["quantity"] = this.quantityProduct(element.id);
                    this.products.push(element);
                }
            });
        }
    },
    methods: {
        quantityProduct(id) {
            let count = 0;
            this.getCart.forEach(element => {
                if (id == element) {
                    count += 1;
                }
            });
            return count;
        },
        totalPrice() {
            let total = 0;
            this.list.forEach(element => {
                if (this.getCart.indexOf(element.id) != -1) {
                    total +=
                        element.unit_price * this.quantityProduct(element.id);
                }
            });
            return total;
        },
        openCustomer() {
            this.customerForm = true;
            this.itemForm = false;
        },
        closeCustomer() {
            this.customerForm = false;
        },
        submit() {
            window.location.href = "confirm";
        }
    },
    computed: {
        ...mapGetters(["getCart"])
    },
    components: {
        customerComponent,
        formComponent
    }
};
</script>

<style scoped>
*,
*:before,
*:after {
    box-sizing: border-box;
}

body {
    font: 14px/22px "Lato", Arial, sans-serif;
}

.lighter-text {
    color: #abb0be;
}

.main-color-text {
    color: #6394f8;
}

nav {
    padding: 20px 0 40px 0;
    background: #f8f8f8;
    font-size: 16px;
}
nav .navbar-left {
    float: left;
}
nav .navbar-right {
    float: right;
}
nav ul li {
    display: inline;
    padding-left: 20px;
}
nav ul li a {
    color: #777777;
    text-decoration: none;
}
nav ul li a:hover {
    color: black;
}

.container {
    margin: auto;
    width: 80%;
}

.badge {
    background-color: #6394f8;
    border-radius: 10px;
    color: white;
    display: inline-block;
    font-size: 12px;
    line-height: 1;
    padding: 3px 7px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
}

.shopping-cart {
    margin: 20px 0;
    float: right;
    background: white;
    width: 320px;
    position: relative;
    border-radius: 3px;
    display: none;
    padding: 20px;
}
.shopping-cart .shopping-cart-header {
    border-bottom: 1px solid #e8e8e8;
    padding-bottom: 15px;
}
.shopping-cart .shopping-cart-header .shopping-cart-total {
    float: right;
}
.shopping-cart .shopping-cart-items {
    padding-top: 20px;
}
.shopping-cart .shopping-cart-items li {
    margin-bottom: 18px;
}
.shopping-cart .shopping-cart-items img {
    float: left;
    margin-right: 12px;
}
.shopping-cart .shopping-cart-items .item-name {
    display: block;
    padding-top: 10px;
    font-size: 16px;
}
.shopping-cart .shopping-cart-items .item-price {
    color: #6394f8;
    margin-right: 8px;
}
.shopping-cart .shopping-cart-items .item-quantity {
    color: #abb0be;
}

.shopping-cart:after {
    bottom: 100%;
    left: 89%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: white;
    border-width: 8px;
    margin-left: -8px;
}

.cart-icon {
    color: #515783;
    font-size: 24px;
    margin-right: 7px;
    float: left;
}

.button {
    background: #0099aa;
    color: white;
    text-align: center;
    padding: 12px;
    text-decoration: none;
    display: block;
    border-radius: 3px;
    font-size: 16px;
    margin: 25px 0 15px 0;
}
.button:hover {
    background: #729ef9;
}

.clearfix:after {
    content: "";
    display: table;
    clear: both;
}
</style>

<template>
    <div class="text-left">
        <div id="menu_ngang" class="">
            <nav class="navbar navbar-expand-sm bg-dark  navbar-dark">
                <div class="nav-item active">
                    <span class="navbar-brand ml-5">
                        <img
                            class="rounded-circle"
                            src="https://image.freepik.com/free-vector/baby-shark-cartoon-style_23-2148502728.jpg"
                            alt="Logo"
                            style="width:50px;"
                            title="https://image.freepik.com/"
                        />
                        fishinggo.com
                    </span>
                </div>
                <ul class="navbar-nav  ml-auto" id="menu_horizontal">
                    <li
                        class="nav-item active "
                        style="position:absolute;right:500px"
                    >
                        <form
                            :action="route"
                            method="POST"
                            class="form-inline"
                            autocomplete="off"
                        >
                            <slot name="csrf"></slot>
                            <input
                                type="text"
                                name="id"
                                class="form-control "
                                placeholder="ID Order"
                            />

                            <button class="btn btn-warning  ml-2" type="submit">
                                Search
                            </button>
                        </form>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link " href="/index">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/introduce">Introduce</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="/gg">Contact</a>
                    </li>

                    <li
                        class="nav-item cart"
                        @mouseover="
                            changeIcon('fa-shopping-cart', 'fa-cart-arrow-down')
                        "
                        @mouseleave="
                            changeIcon('fa-cart-arrow-down', 'fa-shopping-cart')
                        "
                    >
                        <a class="nav-link " href="#">
                            <i
                                class="fa  fa-shopping-cart"
                                style="color:red"
                                id="icon-cart"
                            ></i>
                            CART
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <div id="menu-doc" class="row">
            <div class="">
                <sidebar-menu :menu="menu" />
            </div>
        </div>
    </div>
</template>

<script>
import SidebarMenu from "./menu/SidebarMenu";
import { mapGetters } from "vuex";
export default {
    props: ["route"],
    data() {
        return {
            menu: [
                {
                    href: "/",
                    title: "Category",
                    icon: "fa fa-th-list",
                    type: "ha"
                },
                {
                    // href: "/fish",
                    title: "Fish",
                    icon: "fa fa-fish",
                    type: "fish"
                },
                {
                    //href: "/cayts",
                    title: "Plant",
                    icon: "fas fa-tree",
                    type: "cayts"
                },
                {
                    // href: "/shr_nail",
                    title: "Shrimp,  Nail",
                    icon: "fab fa-envira",
                    type: "shr_nail"
                },
                {
                    // href: "/light",
                    title: "Light",
                    icon: "far fa-lightbulb",
                    type: "light"
                },
                {
                    // href: "/aquarium",
                    title: "Aquarium",
                    icon: "fas fa-glass-whiskey",
                    type: "aquarium"
                },
                {
                    //href: "/tankfilter",
                    title: "Tank Filter",
                    icon: "fas fa-filter",
                    type: "tankfilter"
                },

                {
                    //href: "/food",
                    title: "Food",
                    icon: "fas fa-drumstick-bite",
                    type: "food"
                },
                {
                    //href: "/accessories",
                    title: "Accessories",
                    icon: "  fas fa-wrench",
                    type: "accessories"
                }
            ]
        };
    },
    components: {
        sidebarMenu: SidebarMenu
    },
    computed: {
        ...mapGetters(["getCart"])
    },
    methods: {
        changeIcon(oldClass, newClass) {
            let icon = document.getElementById("icon-cart");
            setTimeout(function() {
                icon.classList.remove(oldClass);
                icon.classList.add(newClass);
            }, 300);
        }
    }
};
</script>

<style scoped>
#menu_horizontal li {
    font-size: 17px;
}
</style>

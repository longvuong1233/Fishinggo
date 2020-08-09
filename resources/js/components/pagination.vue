<template>
    <div>
        <ul class="pagination">
            <li class="pagination-item">
                <button
                    type="button"
                    @click="onClickFirstPage"
                    :disabled="isInFirstPage"
                    aria-label="Go to first page"
                    class="btn-md btn btn-light text-primary"
                >
                    <i class="	fas fa-angle-double-left"></i>
                </button>
            </li>

            <li class="pagination-item">
                <button
                    type="button"
                    @click="onClickPreviousPage"
                    :disabled="isInFirstPage"
                    aria-label="Go to previous page"
                    class="btn-md btn btn-light text-primary"
                >
                    <i class="fas fa-angle-left"></i>
                </button>
            </li>

            <li v-for="page in pages" class="pagination-item">
                <button
                    type="button"
                    @click="onClickPage(page.name)"
                    :disabled="page.isDisabled"
                    :class="{ active: isPageActive(page.name) }"
                    :aria-label="`Go to page number ${page.name}`"
                    class="btn-sm btn btn-light text-primary"
                >
                    {{ page.name }}
                </button>
            </li>

            <li class="pagination-item">
                <button
                    type="button"
                    @click="onClickNextPage"
                    :disabled="isInLastPage"
                    aria-label="Go to next page"
                    class="btn-md btn btn-light text-primary"
                >
                    <i class="fas fa-angle-right"></i>
                </button>
            </li>

            <li class="pagination-item">
                <button
                    type="button"
                    @click="onClickLastPage"
                    :disabled="isInLastPage"
                    aria-label="Go to last page"
                    class="btn-md text-primary btn btn-light"
                >
                    <i class="fas fa-angle-double-right"></i>
                </button>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    props: {
        maxVisibleButtons: {
            type: Number,
            required: false,
            default: 2
        },
        totalPages: {
            type: Number,
            required: true
        },
        currentPage: {
            type: Number,
            required: true
        }
    },
    computed: {
        startPage() {
            if (this.currentPage == 1) {
                return 1;
            }

            if (this.currentPage == this.totalPages) {
                return this.totalPages - this.maxVisibleButtons + 1;
            }

            return this.currentPage - 1;
        },
        endPage() {
            return Math.min(
                this.startPage + this.maxVisibleButtons - 1,
                this.totalPages
            );
        },
        pages() {
            const range = [];

            for (let i = this.startPage; i <= this.endPage; i += 1) {
                range.push({
                    name: i,
                    isDisabled: i === this.currentPage
                });
            }

            return range;
        },
        isInFirstPage() {
            return this.currentPage === 1;
        },
        isInLastPage() {
            return this.currentPage === this.totalPages;
        }
    },
    methods: {
        onClickFirstPage() {
            this.$emit("pagechanged", 1);
        },
        onClickPreviousPage() {
            this.$emit("pagechanged", this.currentPage - 1);
        },
        onClickPage(page) {
            this.$emit("pagechanged", page);
        },
        onClickNextPage() {
            if (this.currentPage != this.otalPages) {
                this.$emit("pagechanged", this.currentPage + 1);
            }
        },
        onClickLastPage() {
            this.$emit("pagechanged", this.totalPages);
        },
        isPageActive(page) {
            return this.currentPage === page;
        }
    }
};
</script>
<style scoped>
.pagination {
    list-style-type: none;
}

.pagination-item {
    display: inline-block;
}

.active {
    background-color: #eeeb29;
    color: #ffffff;
}
</style>

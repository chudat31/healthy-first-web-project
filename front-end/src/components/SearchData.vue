<template>
  <PageHeader />
  <div class="search">
    <form @submit.prevent="getData()" class="d-flex search-box">
      <input
        class="form-control me-2"
        type="search"
        placeholder="Nhập cơ sở bạn muốn tìm kiếm"
        aria-label="Search"
        v-model="search"
        @input="debounceSearch()"
      />
      <button class="btn btn-success" type="submit" value="search">
        Search
      </button>
    </form>
    <span
      ><i style="margin-bottom:80px"
        >Các cơ sở có từ khóa <strong>{{ search }}</strong></i
      ></span
    >
    <div class="restaurants-list">
      <div class="restaurant">
        <router-link 
          :to="'/facility/' + restaurants.id"
          class="movie-link"
        >
          <div class="detail">
            <p>{{ restaurants.name }}</p>
          </div>
        </router-link>
      </div>
    </div>
  </div>
  <PageFooter />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import axios from "axios";
// import api from "@/api.js";
export default {
  name: "SearchData",
  components: { PageFooter, PageHeader },

  //Biến lưu trữ thông tin
  data() {
    return {
      search: "",
      restaurants: {},
    };
  },
  methods: {

    //Lấy thông tin nhà hàng thông qua API
    getData() {

      //Gọi API thông qua axios
      axios
        .get(
          `http://localhost:8090/res/name/${this.search}`, {
              headers: {
                  'Authorization': "Bearer " + localStorage.getItem("token"),
              }
          }
        )

        //Nếu thành công
        .then((res) => {
          console.log(res);
          this.restaurants = res.data.data;
        });
    },

    //Tìm kiếm nhanh
    debounceSearch() {
      clearTimeout(this.debounce);
      this.debounce = setTimeout(() => {
        this.getData();
      }, 0);
    },
  },
  mounted() {
    this.getData();
  },
};
</script>

<style lang="scss" scoped>
.search {
  margin: 50px;
  margin-bottom: 150px;
}
</style>>


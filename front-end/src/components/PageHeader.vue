<template>
  <div class="head">
    <div class="header">
      <img id="logo" src="https://vfa.gov.vn/public/images/logo.png" alt="" />
      <div id="web__name">
        <h4>
          Hệ thống quản lý các cơ sở sản xuất thực phẩm, kinh doanh dịch vụ ăn
          uống
        </h4>
        <div id="phone">
          <img src="https://vfa.gov.vn/public/images/hotline.png" alt="" />
          <div class="signup__signin">
            <!-- <p v-if="checkedUser">Welcome, <i><strong>{{userInfo.username}}</strong></i></p>
            <button @click.prevent="signOut()" v-if="checkedUser" class="btn btn-secondary">Đăng Xuất</button> -->
            <div v-if="checkedUser">
              <div class="nav-item dropdown">
                <div
                  class="active info dropdown-toggle"
                  id="navbarDropdown"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  <strong>Welcome,</strong>
                  <span
                    ><i
                      ><strong>{{ userInfo.username }}</strong></i
                    ></span
                  >
                  <img
                    id="avatar"
                    src="http://hinhnenhd.com/avt-trang-fb/tai-ngay-avt-trang-fb-moi-nhat-dep-nhat-doc-dao-12/"
                    alt=""
                  />
                </div>
                <div style="padding:10px" class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <div id="profile"><router-link id="route" :to="'/user/' + userInfo.userId">Thông Tin Cá Nhân</router-link></div>
                  <div id="signout" @click="signOut()">Đăng Xuất</div>
                </div>
              </div>
            </div>
            <button v-if="!checkedUser" class="btn btn-dark">
              <router-link style="color:#fff" to="/signin">Đăng nhập</router-link>
            </button>
          </div>
        </div>
      </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <router-link to="/" class="navbar-brand">
          <i width="16px" height="16px" class="fa fa-home"></i>
        </router-link>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <router-link
                to="/introduce"
                class="nav-link active"
                aria-current="page"
                >Giới Thiệu</router-link
              >
            </li>
            <li class="nav-item dropdown">
              <router-link
                to=""
                class="nav-link dropdown-toggle"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Phân Loại Cơ Sở
              </router-link>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <router-link to="/standardfacilities" class="dropdown-item"
                    >Cơ Sở Đạt Chuẩn</router-link
                  >
                </li>
                <li>
                  <router-link to="/substandardfacilities" class="dropdown-item"
                    >Cơ Sở Không Đạt Chuẩn</router-link
                  >
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <router-link
                to=""
                class="nav-link dropdown-toggle"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Quản Lý Các Cơ Sở
              </router-link>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <router-link to="/facilities" class="dropdown-item"
                    >Các Cơ Sở Đang Hoạt Động</router-link
                  >
                </li>
                <li>
                  <router-link to="/addfacility" class="dropdown-item"
                    >Thêm Cơ Sở Mới</router-link
                  >
                </li>
                <!-- <li>
                  <router-link to="" class="dropdown-item"
                    >Các Cơ Sở Cần Kiểm Tra</router-link
                  >
                </li> -->
              </ul>
            </li>
            <li class="nav-item dropdown">
              <router-link
                to=""
                class="nav-link dropdown-toggle"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Quản Lý Giấy Chứng Nhận
              </router-link>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <router-link to="/certificates" class="dropdown-item"
                    >Danh Sách Giấy Chứng Nhận</router-link
                  >
                </li>
                <li>
                  <router-link to="/addcertificate" class="dropdown-item"
                    >Cấp Mới Giấy Chứng Nhận</router-link
                  >
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <router-link
                to=""
                class="nav-link dropdown-toggle"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Hoạt Động Thanh, Kiểm Tra
              </router-link>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <router-link to="/allplans" class="dropdown-item"
                    >Kế Hoạch Thanh, Kiểm Tra</router-link
                  >
                </li>
                <li>
                  <router-link to="/badfacilities" class="dropdown-item"
                    >Các Cơ Sở Cần Kiểm Tra</router-link
                  >
                </li>
                <li>
                  <router-link to="/allsamples" class="dropdown-item"
                    >Các Mẫu Thực Phẩm Được Kiểm Tra</router-link
                  >
                </li>
              </ul>
            </li>
            <li v-if="checkAdmin" class="nav-item">
              <router-link
                to="/signup"
                class="nav-link active"
                aria-current="page"
                >Cấp Tài Khoản Cho Chuyên Viên</router-link
              >
            </li>
          </ul>
          <form class="d-flex">
            <button class="btn btn-outline-success" type="submit">
              <router-link to="/search">Search</router-link>
            </button>
          </form>
        </div>
      </div>
    </nav>
  </div>
</template>

<script>
import { onMounted, reactive, ref } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
export default {
  setup() {

    //Biến lưu trữ thông tin
    const router = useRouter();
    const checkedUser = ref(false);
    const checkAdmin = ref(false);
    const userInfo = reactive({
      username: "",
      userId:"",
    });

    // Kiểm tra quyền cho phép truy cập dữ liệu User
    onMounted(async () => {
      const data = await axios.get("http://localhost:8090/users/detail", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      });
      checkedUser.value = true;
      userInfo.username = data.data.data.username;
      userInfo.userId = data.data.data.id;
      if(userInfo.username==='chudat') {
        checkAdmin.value = true;
      }
    });

    //Đăng xuất
    function signOut() {
      localStorage.removeItem("token");
      checkedUser.value = false;
      router.push("/signin");
    }

    //Trả kết quả
    return {
      checkedUser, checkAdmin,
      signOut,
      userInfo,
    };
  },
};
</script>

<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Cookie&family=Dancing+Script&family=Great+Vibes&family=Indie+Flower&family=Kaushan+Script&family=Libre+Baskerville&family=Open+Sans:wght@300&display=swap");

.head {
  #avatar {
    margin-left: 10px;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
  }
  #signout {
    cursor: pointer;
    font-size: 15px;
  }
  #signout:hover {
    color: rgb(127, 159, 255);
  }
  #profile {
    cursor: pointer;
    font-size: 15px;
  }
  .navbar {
    width: 100%;
    background-color: rgb(55, 165, 110);
    display: flex;
    justify-content: space-around;
    align-items: center;
    .nav-item {
      list-style: none;
    }
    a {
      text-decoration: none;
      color: black;
      font-weight: 400;
    }
    a:hover {
      color: rgb(59, 19, 191);
    }
  }
  .header {
    background-color: rgb(44, 166, 97);
    display: flex;
    #web__name {
      padding: 20px;
      padding-top: 30px;
      width: 70%;
      text-align: center;
      #phone {
        a {
          text-decoration: none;
          color: #000;
          margin-right: 5px;
          display: flex;
          
        }
        .signup__signin {
          text-align: end;
          margin-top: 10px;
          display: flex;
          align-items: flex-start;
          justify-content: end;
          padding-top: 20px;
          padding-right: 20px;
          button {
            border-radius: 25px;
          }
        }
      }
    }
  }
  img {
    object-fit: contain;
    width: 30%;
  }
  h4 {
    margin-top: 25px;
    margin-bottom: 20px;
    text-transform: uppercase;
    color: rgb(235, 222, 222);
  }
  @media screen and (min-width: 763px) and (max-width: 960px) {
    // .head {
    //   .nav__bar {
    //     display: flex;
    //     flex-direction: column;
    //     flex-wrap: nowrap;
    //   }
    // }

    h5 {
      font-size: 14px;
    }
    h4 {
      font-size: 16px;
    }
    a, #signout {
      font-size: 14px;
    }
    strong {
      font-size: 14px;
    }
  }
  @media screen and (max-width: 763px) {
    h5 {
      font-size: 10px;
    }
    h4 {
      font-size: 11px;
    }
    a, #signout, strong {
      font-size: 10px;
    }
  }
}
</style>

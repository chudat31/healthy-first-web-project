<template>
  <page-header />
  <div class="signup">
    <h5>CẤP TÀI KHOẢN</h5>
    <form>
      <!-- Nhập username -->
      <input class="" type="text" v-model="username" placeholder="username" />

      <!-- Nhập mật khẩu -->
      <input
        class=""
        type="password"
        v-model="password"
        placeholder="password"
      />

      <div id="type">Địa Bàn Làm Việc</div>
        <select v-model="district" class="form-select mb-4 mt-3">
          <option>Bắc Từ Liêm</option>
          <option>Nam Từ Liêm</option>
          <option>Cầu Giấy</option>
          <option>Hoàn Kiếm</option>
          <option>Hoàng Mai</option>
          <option>Hai Bà Trưng</option>
          <option>Đống Đa</option>
          <option>Tây Hồ</option>
          <option>Thanh Xuân</option>
          <option>Hà Đông</option>
          <option>Long Biên</option>
          <option>Ba Đình</option>
        </select>

      <!-- Chọn vai trò -->
      <div id="type">Vai Trò</div>
      <select v-model="type" class="form-select mb-4 mt-3">
        <option>Quản Lý</option>
        <option>Chuyên Viên</option>
      </select>
    </form>
    <button type="submit" @click.prevent="signup">Hoàn Tất</button>
    <p v-if="checked" :class="{ success: checked }">
      Cấp Tài Khoản Thành công<i
        class="fa fa-check-circle"
        style="font-size: 24px; color: green"
      ></i>
    </p>
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import { ref } from "vue";
import axios from "axios";
export default {
  name: "SignUp",
  components: { PageHeader, PageFooter },
  setup() {
    //Biến lưu trữ
    const username = ref("");
    const password = ref("");
    const district = ref("");
    const type = ref("");
    const checked = ref(false);

    //Hàm đăng ký bằng API
    const signup = async () => {
      await axios.post(
        "http://localhost:8090/users",
        {
          username: username.value,
          password: password.value,
          location: district.value,
          position: type.value,
        },
        {
          headers: {
            Authorization: "Bearer " + localStorage.getItem("token"),
          },
        }
      );
      await axios.post(
        "http://localhost:8090/users/role/addtouser", {
            username:username.value,
            roleName:"ROLE_MANAGER"
        },
        {
          headers: {
            Authorization: "Bearer " + localStorage.getItem("token"),
          },
        }
      );
      checked.value = true;
      username.value = "";
      password.value = "";
      district.value = "";
      type.value = "";
    };

    //Trả kết quả
    return {
      username,
      type,
      checked,
      password,
      district,
      signup,
    };
  },
};
</script>
<style lang="scss" scoped>
.signup {
  .success {
    color: green;
    text-align: center;
    font-size: 1rem;
  }
  a {
    text-decoration: none;
  }
  p {
    margin-top: 40px;
    text-align: center;
  }
  width: 30%;
  margin-left: auto;
  margin-right: auto;
  margin-top: 30px;
  margin-bottom: 30px;
  padding: 50px;
  background-color: rgb(235, 235, 235);
  box-shadow: 2px 3px 10px gray;
  border-radius: 5px;
  h5 {
    text-align: center;
    padding: 20px;
    border-bottom: 2px solid rgb(135, 127, 127);
  }
  form {
    input {
      margin-bottom: 20px;
      margin-top: 20px;
      padding: 10px;
      border-radius: 5px;
      border: none;
      width: 100%;
    }
  }
  button {
    border: none;
    width: 100%;
    border-radius: 5px;
    padding: 10px;
    background-color: rgb(192, 198, 196);
  }
  button:hover {
    color: rgb(22, 172, 102);
  }
  @media screen and (max-width: 660px) {
    width: 90%;
    h5 {
      font-size: 15px;
    }
    button {
      font-size: 13px;
    }
    p {
      font-size: 10px;
    }
    form {
      input {
        font-size: 10px;
      }
      select {
        option {
          font-size: 10px;
        }
      }
      #type {
        font-size: 10px;
      }
    }
  }
  @media screen and (min-width: 660px) and (max-width: 1028px) {
    width: 70%;
  }
  @media screen and (min-width: 1028px) and (max-width: 1400px) {
    width: 40%;
  }
}
</style>

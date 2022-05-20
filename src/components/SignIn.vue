<template>
  <page-header />
  <div class="body">
    <div class="signin">
      <h5>ĐĂNG NHẬP</h5>
      <form>
        <!-- Nhập username -->
        <input class="" type="text" v-model="username" placeholder="username" />

        <!-- Nhập password -->
        <input
          class=""
          type="password"
          v-model="password"
          placeholder="password"
        />
        <p v-if="checked===3" :class="{error:checked===3}">Tên đăng nhập hoặc mật khẩu không chính xác</p>
      </form>
      <button @click="signin()">Đăng Nhập</button>
    </div>
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import { ref } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
export default {
  name: "SignIn",
  components: { PageHeader, PageFooter },

  setup() {
    //Biến lưu trữ thông tin
    const username = ref("");
    const password = ref("");
    const checked = ref(1)
    const router = useRouter();

    //Hàm kiểm tra thông tin đăng nhập
    const signin = async () => {
      // Thiết lập định dạng URLEncode
      var urlencoded = new URLSearchParams();
      urlencoded.append("username", username.value);
      urlencoded.append("password", password.value);

      //Kiểm tra thông tin đăng nhập bằng API
      await axios.post(
        "http://localhost:8090/users/login",
        urlencoded
      )
      .then((data)=>{
        localStorage.setItem("token", data.data.access_token); // Lưu token để kiểm tra
        router.push("/");
        checked.value = 2
      })
      .catch(()=>{
        checked.value = 3
      })
      
    };

    //Trả kết quả
    return {
      username,
      password,
      checked,
      signin,
    };
  },
};
</script>

<style lang="scss" scoped>
.body {
  .error {
    text-align: center;
    text-transform: uppercase;
    color: red;
    font-size: 1rem;
  }
  background-image: url('https://wallpaperaccess.com/full/815769.jpg');
  background-position-x: right;
  padding: 50px;
  margin-top: 30px;
  margin-bottom: 30px;
  object-fit: cover;
}
.signin {
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
  background-color: #fff;
  // box-shadow: 2px 3px 10px rgb(255, 255, 255);
  border-radius: 5px;

  object-fit: contain;
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
      border-bottom: #000 1px;
      width: 100%;
    }
  }
  button {
    border: none;
    width: 100%;
    border-radius: 5px;
    padding: 10px;
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
    input {
      font-size: 10px;
    }
  }
  @media screen and (min-width: 660px) and (max-width: 1028px) {
    width: 50%;
    input {
      font-size: 14px;
    }
  }
  @media screen and (min-width: 1028px) and (max-width: 1400px) {
    width: 40%;
    input {
      font-size: 15.5px;
    }
  }
}
</style>

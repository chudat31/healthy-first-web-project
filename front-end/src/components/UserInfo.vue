<template>
  <h1 style="margin-top:50px">THÔNG TIN NGƯỜI DÙNG</h1>
  <div>
    <article id="one">
      <img src="http://hinhnenhd.com/avt-trang-fb/tai-ngay-avt-trang-fb-moi-nhat-dep-nhat-doc-dao-12/" alt="" />
      <br />
      <br />
      <br />
      <br>
    </article>
    <article id="two">
      <p><strong>Tên đăng nhập: </strong> {{ userInfo.userName }}</p>
      <p><strong>Vai Trò: </strong> {{ userInfo.position }}</p>
      <p><strong>Địa Bàn: </strong>{{ userInfo.location }}</p>
      <p><strong>ID nhận dạng: </strong> {{ userInfo.userID }}</p>
    </article>
  </div>
</template>

<script>
import { onMounted, reactive } from "vue";
import axios from 'axios'
export default {
  setup() {

    //Biến lưu trữ thông tin người dùng
    const userInfo = reactive({
      location: "",
      position: "",
      userName: "",
      userID: "",
      
    });


    // sử dụng API để lấy thông tin user
    onMounted(async () => {
      const res = await axios.get("http://localhost:8090/users/detail", {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("token"),
        },
      });
      userInfo.userName = res.data.data.username;
      userInfo.location = res.data.data.location;
      userInfo.userID = res.data.data.id;
      userInfo.position = res.data.data.position;
    });

    //Trả kết quả
    return {
      userInfo,
    };
  },
};
</script>

<style scoped>
h1 {
  text-align: center;
}
div {
  display: flex;
  justify-content: center;
  margin-top: 30px;
}
article {
  margin-left: 10px;
}
span {
  font-size: 12px;
  color: black;
}
#one {
  width: 300px;
}
strong {
  text-decoration: underline;
}
img {
    width: 80%;
    height:60%
}

</style>



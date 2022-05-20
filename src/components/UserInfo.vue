<template>
  <h1>THÔNG TIN NGƯỜI DÙNG</h1>
  <div>
    <article id="one">
      <img src="http://hinhnenhd.com/avt-trang-fb/tai-ngay-avt-trang-fb-moi-nhat-dep-nhat-doc-dao-12/" alt="" />
      <br />
      <br />
      <br />
      <!-- <h3>
        <i style="color: blue"
          >Thay đổi ảnh đại diện</i
        >
      </h3>
      <div class="component-item">
        <input
          type="file"
          name=""
          id="imgSrc"
          accept="image/*"
          placeholder="Ảnh đại diện"
          @change="onchangeFile"
        />
      </div> -->
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
    const userInfo = reactive({
      location: "",
      position: "",
      userName: "",
      userID: "",
      
    });

    onMounted(async () => {
      const data = await axios.get("http://localhost:8090/users/detail", {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("token"),
        },
      });
      console.log(data);
      userInfo.userName = data.data.data.username;
      userInfo.location = data.data.data.location;
      userInfo.userID = data.data.data.id;
      userInfo.position = data.data.data.position;
    });

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
  margin-left: 30px;
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

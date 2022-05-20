<template>
  <page-header />
  <div class="body">
    <div class="edit">
      <h5>CHỈNH SỬA THÔNG TIN CƠ SỞ</h5>
      <p :class="{ success: checked === 2 }" v-if="checked === 2">
        Chỉnh Sửa Thành Công
        <i class="fa fa-check-circle" style="font-size: 24px; color: green"></i>
      </p>
      <p :class="{ wrong: checked === 3 }" v-if="checked === 3">
        Có Lỗi Xảy Ra
        <i class="fa fa-close" style="font-size: 24px; color: red"></i>
      </p>
      <form @submit.prevent="editInfo">
        <!-- Nhập tên cơ sở -->
        <div class="mb-3">
          <label class="form-label">Tên Cơ Sở</label>
          <input v-model="name" type="text" class="form-control" />
        </div>
        <!-- Nhập thành phố -->
        <!-- <div class="mb-3">
          <label class="form-label">Địa Chỉ</label>
          <input disabled v-model="address" type="text" class="form-control" />
        </div> -->
        <!-- Nhập quận, huyện -->
        <div class="mb-3">
          <label class="form-label">Quận, Huyện</label>
          <input v-if="checkAdmin" v-model="district" type="text" class="form-control" />
          <input v-if="!checkAdmin" disabled v-model="district" type="text" class="form-control" />
        </div>

        <!-- Nhập số điện thoại -->
        <div class="mb-3">
          <label class="form-label">Số Điện Thoại</label>
          <input v-model="phone" type="text" class="form-control" />
        </div>

        <!-- Chọn Loại Hình Kinh Doanh -->
        <div id="type">Loại Hình Kinh Doanh</div>
        <select disabled v-model="type" class="form-select mb-4 mt-3">
          <option>Restaurant</option>
          <option>Production</option>
        </select>

        <!-- Nhập Mã Chứng Nhận -->
        <div class="mb-3">
          <label class="form-label">Mã Giấy Chứng Nhận</label>
          <input
            v-if="cert !== 0 && cert !== null"
            v-model="cert"
            type="text"
            class="form-control"
          />
          <input
            v-if="cert === 0"
            placeholder="Chưa Được Cấp"
            type="text"
            class="form-control"
          />
          <input
            v-if="cert === null"
            placeholder="Đã Thu Hồi"
            type="text"
            class="form-control"
          />
        </div>
        <button
          @click.prevent="editInfo()"
          type="submit"
          class="btn btn-primary"
        >
          Đồng Ý
        </button>
      </form>
    </div>
  </div>
  <page-footer />
</template>

<script>
import { onMounted, ref } from "vue";
import PageHeader from "./PageHeader.vue";
import PageFooter from "./PageFooter.vue";
import axios from "axios";
import { useRoute } from "vue-router";
export default {
  components: { PageHeader, PageFooter },
  setup() {
    const route = useRoute();

    //Biến lưu giá trị
    const name = ref("");
    const address = ref("");
    const district = ref("");
    const phone = ref("");
    const type = ref("");
    const cert = ref("");
    const checked = ref(1);
    const username = ref("");
    const checkAdmin = ref(false);

    //Lấy thông tin về cơ sở cần chỉnh sửa
    const getData = onMounted(async () => {
      const res = await axios.get(
        `http://localhost:8090/res/${route.params.id}`,
        {
          headers: {
            Authorization: "Bearer " + localStorage.getItem("token"),
          },
        }
      );
      name.value = res.data.data.name;
      address.value = res.data.data.address;
      district.value = res.data.data.district;
      phone.value = res.data.data.phone;
      type.value = res.data.data.type;
      cert.value = res.data.data.cert_id;
    });

    //Kiểm tra có phải quản lý không
    onMounted(async () => {
      const res = await axios.get("http://localhost:8090/users/detail", {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("token"),
        },
      });
      username.value = res.data.data.username;
      if(username.value === 'chudat') {
        checkAdmin.value = true;
      }
    });

    //Chức năng chỉnh sửa thông tin bằng API
    const editInfo = () => {
      axios
        .patch(
          `http://localhost:8090/res/${route.params.id}`,
          {
            name: name.value,
            district: district.value,
            phone: phone.value,
            certId:cert.value
          },
          {
            headers: {
              Authorization: "Bearer " + localStorage.getItem("token"),
            },
          }
        )

        //Nếu thành công
        .then(() => {
          checked.value = 2;
          getData();
        })

        //Nếu có lỗi
        .catch(() => {
          checked.value = 3;
        });
    };

    //Trả kết quả
    return {
      name,
      address,
      district,
      phone,
      type,
      cert,
      checked,
      checkAdmin,
      editInfo,
    };
  },
};
</script>

<style lang="scss" scoped>
.body {
  background-image: url("https://www.teahub.io/photos/full/35-352161_nh-background-anime.jpg");

  background-size: 1300px 720px;
  background-repeat: no-repeat;
  height: 100vh;
  padding-top: 100px;
  padding-bottom: 100px;
  margin-left: 110px;
  margin-right: 110px;
  margin-top: 50px;
  margin-bottom: 50px;
  .edit {
    padding-top: 20px;
    width: 30%;
    background-color: #fff;
    margin-right: auto;
    margin-left: auto;
    border-radius: 5px;
  }
  .success {
    color: green;
    text-align: center;
  }
  .wrong {
    color: red;
    text-align: center;
  }

  h5 {
    text-align: center;
  }
  form {
    // box-shadow: 2px 3px 8px gray;
    border: none;
    padding: 20px;
    width: 100%;

    label {
      color: black;
    }
    button {
      width: 100%;
    }
  }
  @media screen and (max-width: 620px) {
    margin: 20px;
    .edit {
      width: 85%;
    }
    h5 {
      margin-bottom: 15px;
      font-size: 12px;
    }
    form {
      width: 100%;
      label {
        font-size: 10px;
      }
      input,
      option,
      select,
      button,
      #type {
        font-size: 10px;
      }
    }
  }
  @media screen and (min-width: 620px) and (max-width: 860px) {
    margin: 35px;
    .edit {
      width: 60%;
    }
    h5 {
      margin-bottom: 25px;
      font-size: 16px;
    }
    form {
      width: 100%;
      label {
        font-size: 14px;
      }
      input,
      option,
      select,
      button,
      #type {
        font-size: 14px;
      }
    }
  }
  @media screen and (min-width: 860px) and (max-width: 1240px) {
    margin: 35px;
    .edit {
      width: 45px;
    }
    h5 {
      margin-bottom: 25px;
      font-size: 16px;
    }
    form {
      width: 100%;
      label {
        font-size: 14px;
      }
      input,
      option,
      select,
      button,
      #type {
        font-size: 14px;
      }
    }
  }
}
</style>

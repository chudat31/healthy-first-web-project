<template>
  <page-header />
  <div class="body">
    <div class="add">
      <h5>THÊM CƠ SỞ MỚI</h5>
      <p :class="{ success: checked === 2 }" v-if="checked === 2">
        Thêm Cơ Sở Thành Công
        <i class="fa fa-check-circle" style="font-size: 24px; color: green"></i>
      </p>
      <form v-if="checkAdmin" @submit.prevent="addAdmin">
        <!-- Nhập tên cơ sở -->
        <div class="mb-3">
          <label class="form-label">Tên Cơ Sở</label>
          <input v-model="form.name" type="text" class="form-control" />
          <span v-if="v$.name.$error && checked === 3">{{v$.name.$errors[0].$message}}</span>
        </div>
        <!-- Nhập địa chỉ -->
        <div class="mb-3">
          <label class="form-label">Thành Phố</label>
          <input v-model="form.address" type="text" class="form-control" />
        </div>
        <!-- Nhập khu vực, quận -->
        <div id="type">Quận, Huyện</div>
        <select v-model="form.district" class="form-select mb-4 mt-3" >
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
       
        <span v-if="v$.district.$error && checked === 3">{{v$.district.$errors[0].$message}}</span>


        <!-- Nhập số điện thoại -->
        <div class="mb-3">
          <label class="form-label">Số Điện Thoại</label>
          <input v-model="form.tele" type="text" class="form-control" />
          <span v-if="v$.tele.$error && checked === 3">{{v$.tele.$errors[0].$message}}</span>
        </div>


        <!-- Chọn loại hình kinh doanh -->
        <div id="type">Loại Hình Kinh Doanh</div>
        <select v-model="form.type" class="form-select mb-4 mt-3">
          <option>Restaurant</option>
          <option>Production</option>
        </select>
        <span v-if="v$.type.$error && checked === 3">{{v$.type.$errors[0].$message}}</span>


        <!-- Nhập mã giấy chứng nhận -->
        <div class="mb-3">
          <label class="form-label">Mã Giấy Chứng Nhận</label>
          <input v-model="form.certId" type="text" class="form-control" />
        </div>
        <button @click="submitForm" class="btn btn-primary">Thêm</button>
      </form>

      <form v-if="!checkAdmin" @submit.prevent="addUser">
        <!-- Nhập tên cơ sở -->
        <div class="mb-3">
          <label class="form-label">Tên Cơ Sở</label>
          <input v-model="form.name" type="text" class="form-control" />
          <span v-if="v$.name.$error && checked === 3">{{v$.name.$errors[0].$message}}</span>
        </div>
        <!-- Nhập địa chỉ -->
        <div class="mb-3">
          <label class="form-label">Thành Phố</label>
          <input v-model="form.address" type="text" class="form-control" />
        </div>
        <!-- Nhập khu vực, quận -->
        <div id="type">Quận, Huyện</div>
        <div class="mb-3">
           <input type="text" v-model="userInfo.location" class="form-control"/>
        </div>
       
        <span v-if="v$.district.$error && checked === 3">{{v$.district.$errors[0].$message}}</span>


        <!-- Nhập số điện thoại -->
        <div class="mb-3">
          <label class="form-label">Số Điện Thoại</label>
          <input v-model="form.tele" type="text" class="form-control" />
          <span v-if="v$.tele.$error && checked === 3">{{v$.tele.$errors[0].$message}}</span>
        </div>


        <!-- Chọn loại hình kinh doanh -->
        <div id="type">Loại Hình Kinh Doanh</div>
        <select v-model="form.type" class="form-select mb-4 mt-3">
          <option>Restaurant</option>
          <option>Production</option>
        </select>
        <span v-if="v$.type.$error && checked === 3">{{v$.type.$errors[0].$message}}</span>


        <!-- Nhập mã giấy chứng nhận -->
        <div class="mb-3">
          <label class="form-label">Mã Giấy Chứng Nhận</label>
          <input v-model="form.certId" type="text" class="form-control" />
        </div>
        <button @click="submitForm" class="btn btn-primary">Thêm</button>
      </form>
    </div>
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import { ref, reactive, computed, onMounted } from "vue";
import axios from "axios";
import useValidate from '@vuelidate/core';
import {required} from '@vuelidate/validators'
export default {
  name: "AddFacilities",
  components: { PageHeader, PageFooter },
  setup() {

    //Biến lưu giá trị khởi tạo
    const form = reactive({
      name:"",
      address:"",
      tele:"",
      type:"",
      certId:"",
      district:""
    })

    const userInfo = reactive({
      username:"",
      location:""
    })
    const checked = ref(1);
    const checkAdmin = ref(false)

    //Xác thực người dùng
    onMounted(async () => {
      const data = await axios.get("http://localhost:8090/users/detail", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      });
      userInfo.username = data.data.data.username;
      userInfo.location = data.data.data.location
      if(userInfo.username==='chudat') {
        checkAdmin.value = true;
      }
    });

    //Điều kiện validation
    const rules = computed(()=>{
      return {
        name: {required},
        tele: {required },
        type: {required},
        district: {required}
      }
    })

    //Kiểm tra hợp thức
    const v$ = useValidate(rules, form)
    

    //Thực hiện thêm cơ sở vào CSDL thông qua API
    const addAdmin = () => {
      axios
        .post("http://localhost:8090/res", {
          address: form.address,
          name: form.name,
          phone: form.tele,
          type: form.type,
          district: form.district,
          certId: form.certId,
        }, {
          headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
          'Content-Type':'application/json'
        },
        })
        //Nếu xử lí thành công
        .then(() => {
          checked.value = 2;
          form.address = "";
          form.name = "";
          form.tele = "";
          form.type = "";
          form.district = "";
          form.certId = "";
        })
        .catch(() => {
          checked.value = 3;
        });
    };

    const addUser = () => {
      axios
        .post("http://localhost:8090/res", {
          address: form.address,
          name: form.name,
          phone: form.tele,
          type: form.type,
          district: userInfo.location,
          certId: form.certId,
        }, {
          headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
          'Content-Type':'application/json'
        },
        })
        //Nếu xử lí thành công
        .then(() => {
          checked.value = 2;
          form.address = "";
          form.name = "";
          form.tele = "";
          form.type = "";
          form.district = "";
          form.certId = "";
        })
        .catch(() => {
          checked.value = 3;
        });
    };

    

    //Trả kết quả
    return {
      form, v$,
      checked, addUser,
      addAdmin, userInfo, checkAdmin
    };
  },

  //Phương thức để gọi đến validation
  methods: {
    submitForm() {
      this.v$.$validate();
    }
  }
};
</script>

<style lang="scss" scoped>
.body {
  background-image: url("https://coolhdwall.com/storage/202101/mountain-night-scenery-stars-landscape-anime-hd-wallpaper-1920x1080.jpg");
  background-position-y: bottom;
  background-position-x: right;
  object-fit: cover;
  padding-top: 100px;
  padding-bottom: 50px;
  margin-top: 30px;
  margin-bottom: 30px;
  span {
    color: red;
  }
  .add {
    width: 30%;
    background-color: #fff;
    margin-left: auto;
    margin-right: auto;
    border-radius: 5px;
    margin-bottom: 100px;
    h5 {
      padding-top: 20px;
    }
  }
  .success {
    color: green;
    text-align: center;
  }
  .error {
    color: red;
    text-align: center;
  }
  h5 {
    text-align: center;
  }
  form {
    border: none;
    width: 100%;
    margin-bottom: 50px;
    // box-shadow: 2px 3px 7px grey;
    padding: 20px;
    border-radius: 5px;
    button {
      width: 100%;
    }
  }
  @media screen and (max-width: 660px) {
    .add {
      width: 85%;
    }
    form {
      width: 100%;
      label {
        font-size: 12px;
      }
      #type {
        font-size: 12px;
      }
      select {
        font-size: 12px;
        option {
          font-size: 12px;
        }
      }
      button {
        font-size: 12px;
      }
    }
    h5 {
      font-size: 14px;
    }
  }
  @media screen and (min-width: 660px) and (max-width: 870px) {
    .add {
      width: 60%;
    }
    form {
      width: 100%;
      label {
        font-size: 13.5px;
      }
      #type {
        font-size: 13.5px;
      }
      select {
        font-size: 13.5px;
        option {
          font-size: 13.5px;
        }
      }
      button {
        font-size: 13.5px;
      }
    }
    h5 {
      font-size: 15px;
    }
  }
  @media screen and (min-width: 870px) and (max-width: 1100px) {
    .add {
      width: 45% ;
    }
    form {
      width: 100%;
      label {
        font-size: 14.5px;
      }
      #type {
        font-size: 14.5px;
      }
      select {
        font-size: 14.5px;
        option {
          font-size: 14.5px;
        }
      }
      button {
        font-size: 14.5px;
      }
    }
    h5 {
      font-size: 16px;
    }
  }
}
</style>

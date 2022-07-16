<template>
  <page-header />
  <div class="body">
    <div class="add">
      <h5>THÊM KẾ HOẠCH KIỂM TRA</h5>
      <p :class="{ success: checked === 2 }" v-if="checked === 2">
        Thêm Kế Hoạch Thành Công
        <i class="fa fa-check-circle" style="font-size: 24px; color: green"></i>
      </p>
      
      <form @submit.prevent="add">
        <!-- Nhập tên cơ sở -->
        <div class="mb-3">
          <label class="form-label">Ngày Bắt Đầu Kiểm Tra</label>
          <input v-model="form.startDate" type="date" class="form-control" />
          <span v-if="v$.startDate.$error && checked === 3">{{v$.startDate.$errors[0].$message}}</span>
        </div>
        <!-- Nhập địa chỉ -->
        <div class="mb-3">
          <label class="form-label">Ngày Kết Thúc Kiểm Tra</label>
          <input v-model="form.endDate" type="date" class="form-control" />
          <span v-if="v$.endDate.$error && checked === 3">{{v$.endDate.$errors[0].$message}}</span>
        </div>
        <!-- Nhập khu vực, quận -->
        <div class="mb-3">
          <label class="form-label">Giai Đoạn</label>
          <input v-model="form.stageId" type="text" class="form-control" />
          <span v-if="v$.stageId.$error && checked === 3">{{v$.stageId.$errors[0].$message}}</span>
        </div>
        <!-- Nhập số điện thoại -->
        <div class="mb-3">
          <label class="form-label">Trạng Thái</label>
          <input v-model="form.status" type="text" class="form-control" />
          <span v-if="v$.status.$error && checked === 3">{{v$.status.$errors[0].$message}}</span>
        </div>
        <!-- Chọn loại hình kinh doanh -->
        <!-- Nhập mã giấy chứng nhận -->
        <div class="mb-3">
          <label class="form-label">Mã Cơ Sở</label>
          <input v-model="form.restaurantId" type="text" class="form-control" />
          <span v-if="v$.restaurantId.$error && checked === 3">{{v$.restaurantId.$errors[0].$message}}</span>
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
import { ref, reactive, computed } from "vue";
import useValidate from '@vuelidate/core';
import {required} from '@vuelidate/validators'
import axios from "axios";
import { useRouter } from 'vue-router';
export default {
  name: "AddFacilities",
  components: { PageHeader, PageFooter },
  setup() {
    //Biến lưu giá trị khởi tạo
    const form = reactive({
      startDate: "",
      endDate: "",
      stageId: "",
      status: "",
      restaurantId: "",
    });
    const checked = ref(1);

    const rules = computed(()=>{
      return {
        startDate: {required},
        endDate: {required},
        stageId: {required },
        status: {required},
        restaurantId: {required}
      }
    })

    //Kiểm tra hợp thức
    const v$ = useValidate(rules, form)

    const router = useRouter();

    //Thực hiện thêm cơ sở vào CSDL thông qua API
    const add = () => {
      axios
        .post(
          "http://localhost:8090/plan",
          {
            start_date: form.startDate,
            end_date: form.endDate,
            stageId: form.stageId,
            status: form.status,
            restaurantId: form.restaurantId,
          },
          {
            headers: {
              Authorization: "Bearer " + localStorage.getItem("token"),
            },
          }
        )
        //Nếu xử lí thành công
        .then(() => {
          checked.value = 2;
          form.startDate = "";
          form.endDate = "";
          form.stageId = "";
          form.status = "";
          form.restaurantId = "";
          router.push('/addsample');
        })
        .catch(() => {
          checked.value = 3;
        });
    };

    //Trả kết quả
    return {
      form, v$,
      checked,
      add,
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
      width: 45%;
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

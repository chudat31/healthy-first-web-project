<template>
  <page-header />
  <div class="body">
    <h5>CẤP MỚI GIẤY CHỨNG NHẬN</h5>
    <p :class="{ success: checked===2 }" v-if="checked===2">
      Cấp Mới Giấy Chứng Nhận Thành Công
      <i class="fa fa-check-circle" style="font-size:24px; color:green"></i>
    </p>
    <form @submit.prevent="add">
      <!-- Nhập ngày cấp giấy -->
      <div class="mb-3">
        <label class="form-label">Ngày Cấp Giấy</label>
        <input v-model="form.start_date" type="date" class="form-control" />
        <span v-if="v$.start_date.$error && checked === 3">{{v$.start_date.$errors[0].$message}}</span>
      </div>

      <!--  Nhập ngày hết hạn -->
      <div class="mb-3">
        <label class="form-label">Ngày Hết Hạn</label>
        <input v-model="form.end_date" type="date" class="form-control" />
        <span v-if="v$.end_date.$error && checked === 3">{{v$.end_date.$errors[0].$message}}</span>
      </div>
      <button @click="submitForm" class="btn btn-primary">Thêm</button>
    </form>
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import { ref, reactive, computed} from "vue";
import useValidate from '@vuelidate/core';
import {required} from '@vuelidate/validators'
import axios from "axios";
export default {
  name: "AddFacilities",
  components: { PageHeader, PageFooter },
  setup() {
    //Biến lưu trữ giá trị
    const form = reactive({
      start_date: "",
      end_date: ""
    })
    const checked = ref(1);

    const rules = computed(()=>{
      return {
        end_date: {required},
        start_date: {required},
      }
    })

    //Kiểm tra hợp thức
    const v$ = useValidate(rules, form)

    //Hàm thêm giấy chứng nhận
    const add = () => {

      //Thêm giấy chứng nhận bằng API
      axios
        .post("http://localhost:8090/cert", {
          startDate: form.start_date,
          endDate: form.end_date,
        }, {
          headers: {
            'Authorization':'Bearer ' + localStorage.getItem('token')
          }
        })

        //Xử lí khi gọi API thành công
        .then(() => {
          checked.value = 2;
          form.start_date = "";
          form.end_date = "";
        })
        .catch(()=>{
          checked.value = 3;
        })
        
    };
    return { 
      // id,
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
    margin: 30px;
  }
  form {
    width: 30%;
    margin: auto;
    margin-bottom: 50px;
    box-shadow: 2px 3px 7px grey;
    padding: 20px;
    border-radius: 5px;
    button {
      width: 100%;
    }
    span {
      color: red;
    }
  }
  @media screen and (max-width: 660px) {
    form {
      width: 85%;
      label {
        font-size: 12px;
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
    form {
      width: 60%;
      label {
        font-size: 13.5px;
      }
      #type {
        font-size: 13.5px;
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
    form {
      width: 45%;
      label {
        font-size: 14.5px;
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

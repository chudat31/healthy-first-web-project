<template>
  <page-header />
  <div class="body">
    <h5>CÁC CƠ SỞ CÓ GIẤY CHỨNG NHẬN SẮP HẾT THỜI HẠN</h5>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th>Tên Cơ Sở</th>
          <th>Mã Chứng Nhận</th>
          <th>Số Ngày Giấy Chứng Nhận Còn Hạn</th>
        </tr>
      </thead>
      <tbody>
        <!-- Lấy tất cả thông tin các cơ sở  -->
        <tr v-for="facility in facilities" :key="facility.id">
          <td>{{ facility.tenNhaHang }}</td>
          <td>{{ facility.maChungNhan }}</td>
          <td>{{ facility.ngayHetHan }} ngày</td>
        </tr>
      </tbody>
    </table>
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import { ref, onMounted } from "vue";
import axios from "axios";

export default {
  name: "BadFacilities",
  components: { PageHeader, PageFooter },
  setup() {

    //Biến lưu trữ 
    const facilities = ref([]);
    
    //Lấy thông tin các cơ sở bằng API
    onMounted(async () => {
      const data = await axios.get(
        "http://localhost:8090/res/recommend"
      );
      facilities.value = data.data.data;
    });

    //Trả kết quả
    return {
      facilities,
    };
  },
};
</script>

<style lang="scss" scoped>
.body {
  margin-top: 50px;
  margin-bottom:50px;
  h5 {
    text-align: center;
  }
  table {
    width:70%;
    margin: 50px;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
  }
  @media screen and (max-width:768px) {
    h5 {
      font-size: 12px;
    }
    table {
      tr,td {
        font-size: 10px;
      }
    }
  }
  @media screen and (min-width:768px) and (max-width:1024px) {
    h5 {
      font-size: 16px;
    }
    table {
      tr,td {
        font-size: 14px;
      }
    }
  }
}
</style>

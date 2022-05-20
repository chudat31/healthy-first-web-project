<template>
  <page-header />
  <div class="body">
    <h4>CÁC CƠ SỞ ĐẠT CHUẨN CHẤT LƯỢNG</h4>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th width="30%">Tên Cơ Sở</th>
          <th width="35%">Loại Hình Kinh Doanh</th>
          <th width="35%">Số Ngày Giấy Chứng Nhận Còn Hạn</th>
        </tr>
      </thead>
      <!-- Hiển thị thông tin các cơ sở -->
      <tbody>
        <tr v-for="facility in facilities" :key="facility.id">
          <td>{{ facility.tenNhaHang }}</td>
          <td>{{ facility.type }}</td>
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
  name: "StandardFacilities",
  components: { PageHeader, PageFooter },
  setup() {
    
    //Biến lưu trữ thông tin khởi tạo
    const facilities = ref([]); 

    //Lấy thông tin các cơ sở từ API
    onMounted(async () => {
      const res = await axios.get("http://localhost:8090/res/safe", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      });
      facilities.value = res.data.data;
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
  background-image:linear-gradient(
          rgba(215, 205, 205, 0.7), 
          rgba(215, 205, 205, 0.7)), url('https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=600');
  margin-top: 70px;
  margin-bottom: 70px;
  padding: 50px;
  h4 {
    margin-bottom: 40px;
    text-align: center;
  }
  table {
    margin-left: auto;
    margin-right: auto;
    width: 70%;
    cursor: pointer;
    tr,
    td {
      text-align: center;
    }
  }
  @media screen and (max-width: 768px) {
    h4 {
      font-size: 12px;
      margin-bottom: 10px;
    }
    table {
      width: 90%;
      th,
      td {
        font-size: 10px;
      }
    }
  }
  @media screen and (min-width: 768px) and (max-width: 1024px) {
    h4 {
      font-size: 16px;
      margin-bottom: 20px;
    }
    th,
    td {
      font-size: 14px;
    }
  }
}
</style>

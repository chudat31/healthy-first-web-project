<template>
  <page-header />
  <div class="body">
    <h4>CÁC CƠ SỞ HẾT HẠN GIẤY CHỨNG NHẬN</h4>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th width="30%">Tên Cơ Sở</th>
          <th width="35%">Mã Chứng Nhận</th>
          <th width="35%">Ngày Hết Hạn</th>
        </tr>
      </thead>
      <tbody>
        <!-- Lấy tất cả thông tin các cơ sở  -->
        <tr v-for="facility in facilities" :key="facility.id">
          <td>{{ facility.tenNhaHang }}</td>
          <td>{{ facility.maChungNhan }}</td>
          <td>{{ facility.ngayHetHan }}</td>
        </tr>
      </tbody>
    </table>
    <h4>CÁC CƠ SỞ CHƯA ĐƯỢC CẤP GIẤY CHỨNG NHẬN</h4>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th>Tên Cơ Sở</th>
          <th>Số Điện Thoại</th>
          <th>Loại Hình Kinh Doanh</th>
          <th>Thành Phố</th>
          <th>Quận, Huyện</th>
        </tr>
      </thead>
      <tbody>
        <!-- Lấy tất cả thông tin các cơ sở  -->
        <tr v-for="facility in facilities1" :key="facility.id">
          <td>{{ facility.name }}</td>
          <td>{{ facility.phone }}</td>
          <td>{{ facility.type }}</td>
          <td>Hà Nội</td>
          <td>{{facility.district}}</td>
        </tr>
      </tbody>
    </table>
    <h4>CÁC CƠ SỞ BỊ THU HỒI GIẤY CHỨNG NHẬN</h4>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th>Tên Cơ Sở</th>
          <th>Số Điện Thoại</th>
          <th>Loại Hình Kinh Doanh</th>
          <th>Thành Phố</th>
          <th>Quận, Huyện</th>
        </tr>
      </thead>
      <tbody>
        <!-- Lấy tất cả thông tin các cơ sở  -->
        <tr v-for="facility in facilities2" :key="facility.id">
          <td>{{ facility.name }}</td>
          <td>{{ facility.phone }}</td>
          <td>{{ facility.type }}</td>
          <td>Hà Nội</td>
          <td>{{ facility.district }}</td>
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
  name: "SubstandardFacilities",
  components: { PageHeader, PageFooter },
  setup() {
    //Biến lưu trữ dữ liệu các cơ sở
    const facilities = ref([]); 
    const facilities1 = ref([]);
    const facilities2 = ref([]);

    //Lấy dữ liệu các cơ sở từ API
    onMounted(async () => {
      const res = await axios.get("http://localhost:8090/res/unsafe", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      });
      facilities.value = res.data.data;
    });

    onMounted(async() =>{
      const res = await axios.get("http://localhost:8090/res/nocert", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      })
      facilities1.value = res.data.data
    });

    onMounted(async() =>{
      const res = await axios.get("http://localhost:8090/res/deletecert", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      })
      facilities2.value = res.data.data
    });

    //Trả kết quả
    return {
      facilities, facilities1, facilities2
    };
  },
};
</script>

<style lang="scss" scoped>
.body {
  margin-top: 70px;
  margin-bottom: 70px;
  padding: 50px;
  background-image:linear-gradient(
          rgba(215, 205, 205, 0.7), 
          rgba(215, 205, 205, 0.7)), url('https://img.freepik.com/free-vector/watercolor-background_87374-69.jpg?t=st=1653706810~exp=1653707410~hmac=4acefecf75adc66efadc2049d15330adc4aaf89503b92cc2d546f053f8490ab9&w=1060');
  h4 {
    margin-bottom: 40px;
    text-align: center;
    font-weight: 600;
    color:rgb(6, 90, 81)
  }
  table {
    margin-left: auto;
    margin-right: auto;
    width: 70%;
    margin-bottom: 50px;
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
      th,
      td {
        font-size: 10px;
      }
      width: 90%;
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

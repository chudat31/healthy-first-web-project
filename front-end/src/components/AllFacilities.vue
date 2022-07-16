<template>
  <page-header />
  <div class="body">
    <h5>CÁC CƠ SỞ ĐANG HOẠT ĐỘNG</h5>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th>Tên Cơ Sở</th>
          <th>Mã Cơ Sở</th>
          <th>Thành Phố</th>
          <th>Quận, Huyện</th>
          <th>Số Điện Thoại</th>
          <th>Loại Cơ Sở</th>
          <th>Mã Chứng Nhận</th>
          <th>Thực Hiện Kiểm Tra Cơ Sở</th>
          <th>Chức Năng</th>
        </tr>
      </thead>

      <!-- Lấy dữ liệu tất cả các cơ sở có trong danh sách -->
      <tbody>
        <tr v-for="facility in facilities" :key="facility.id">
          <td id="name"><router-link :to="'/facility/' + facility.id">{{facility.name}}</router-link></td>
          <td id="id">{{facility.id}}</td>
          <td id="address">Hà Nội</td>
          <td id="district">{{facility.district}}</td>
          <td id="phone">{{facility.phone}}</td>
          <td id="type">{{facility.type}}</td>
          <td v-if="facility.cert_id===0">Chưa Được Cấp</td>
          <td v-if="facility.cert_id===null" id="certId">Đã Thu Hồi</td>
          <td v-if="facility.cert_id" id="certId">{{facility.cert_id}}</td>
          <td><router-link to="/addplan">Kiểm Tra Cơ Sở</router-link></td>
          <td>
            <div class="d-flex">
              <button @click="delFac(facility.id)" class="btn btn-danger">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  class="bi bi-trash"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"
                  />
                  <path
                    fill-rule="evenodd"
                    d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"
                  />
                </svg>
              </button>
              <button class="btn btn-warning">
                <!-- Điều hướng -->
              <router-link :to="'/facility/' + facility.id + '/edit'"><svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  class="bi bi-pen"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"
                  />
                </svg></router-link>
                
              </button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Thống kê bằng biểu đồ -->
    <div class="chart">
      <div class="chart__item" id="chart__item1">
        <h5>THỐNG KÊ SỐ LƯỢNG CÁC CƠ SỞ DỊCH VỤ ĂN UỐNG</h5>
        <pie-chart :data="[['Đạt Chuẩn', dataRes[0]],['Không Đạt Chuẩn', dataRes[1]]]" width="85%" height="85%" />
      </div>
      <div class="chart__item" id="chart__item2">
        <h5>THỐNG KÊ SỐ LƯỢNG CÁC CƠ SỞ SẢN XUẤT</h5>
        <pie-chart :data="[['Đạt Chuẩn', dataPro[0]],['Không Đạt Chuẩn', dataPro[1]]]" width="85%" height="85%" />
      </div>
    </div>
    
    
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import { onMounted,  ref} from "vue";
import axios from 'axios';
export default {
  name: "AllFacilities",
  components: { PageHeader, PageFooter,},
  setup() {

    // biến lưu trữ số lượng cơ sở sản xuất
    const dataPro = ref([null,null])

    
    // biến lưu trữ số lượng cơ sở ăn uống
    const dataRes = ref([null,null]);


   //Lấy dữ liệu về số cơ sở ăn uống an toàn và không an toàn
    const getRes = onMounted(async() => {
    const res = await axios.get('http://localhost:8090/res/restaurant/count', {
      headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
    })
    console.log(res);
      dataRes.value[0] = res.data.data.safe;
      dataRes.value[1] = res.data.data.unsafe;
    })


    //Lấy dữ liệu về số cơ sở sản xuất an toàn và không an toàn
    const getPro = onMounted(async() => {
    const res = await axios.get('http://localhost:8090/res/production/count', {
      headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
    })
    dataPro.value[0] = res.data.data.safe;
    dataPro.value[1] = res.data.data.unsafe;
    })

    //Biến lưu trữ tất cả các cơ sở
    const facilities = ref([]);


    //Lấy dữ liệu tất cả các cơ sở từ API
    const getData = onMounted(async() => {
      const res = await axios.get("http://localhost:8090/res/user", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      })
      facilities.value = res.data.data;
    })


    //Chức năng xóa cơ sở
    const delFac = (async(id) => {
      await axios.delete(`http://localhost:8090/res/${id}`, {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      })
      getData();
      getPro();
      getRes();
    });

    // Kiểm tra quyền cho phép truy cập dữ liệu User
  
    //Trả kết quả
    return {
      facilities, delFac, dataRes, dataPro
    }
  },
};
</script>

<style lang="scss" scoped>
.body {
  a {
    text-decoration: none;
  }
  margin-top: 70px;
  margin-bottom: 70px;
  padding-left: 50px;
  padding-right: 50px;
  h5 {
    margin-bottom: 40px;
    text-align: center;
  }
  table {
    margin-bottom: 50px;
    cursor: pointer;
    tr,td {
      text-align: center;
    }
    button {
      margin-right: 3px;
      margin-left: 10px;
    }
  }
  .chart {
    display: flex;
    justify-content: space-evenly;
    #chart__item1 {
      h5 {
        width: 100%;
      }
      width: 45%;
      height: 60%;
    }
    #chart__item2 {
      h5 {
        width: 100%;
      }
      width: 45%;
      height: 60%;
    }

  }
  @media screen and (max-width:768px) {
    tr,td {
      font-size: 10px;
    }
    h5 {
      font-size: 12px;
    }
  }
  @media screen and(min-width:768px) and(max-width:1024px) {
    tr,td {
      font-size: 14px;
    }
    h5 {
      font-size: 16px;
    }
  }
}
</style>

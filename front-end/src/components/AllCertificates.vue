<template>
  <page-header />
  <div class="body">
    <h4>DANH SÁCH GIẤY CHỨNG NHẬN ĐÃ ĐƯỢC CẤP</h4>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th>Mã Giấy Chứng Nhận</th>
          <th>Ngày Cấp</th>
          <th>Ngày Hết Hạn</th>
          <th>Chức Năng</th>
        </tr>
      </thead>
      <!-- Duyệt qua tất cả giấy chứng nhận và lấy thông tin -->
      <tbody>
        <tr v-for="certificate in certificates" :key="certificate.id">
          <td>{{ certificate.id }}</td>
          <td>{{ certificate.startDate }}</td>
          <td>{{ certificate.endDate }}</td>
          <td>
            <button
              @click.prevent="delCert(certificate.id)"
              class="btn btn-danger"
            >
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
            <button
              type="button"
              class="btn btn-warning"
              data-toggle="modal"
              data-target="#exampleModal"
              data-whatever="@getbootstrap"
              
            >
              <i class="fas fa-edit"></i>
            </button>

            <div
              class="modal fade"
              id="exampleModal"
              tabindex="-1"
              role="dialog"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                      Ra Hạn Thời Gian Sử Dụng Giấy Chứng Nhận
                    </h5>
                    <button
                      type="button"
                      class="close"
                      data-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body">
                    <form>
                      <div class="form-group">
                        <label for="message-text" class="col-form-label"
                          >Ngày Hết Hạn Cũ:</label
                        >
                        <input
                          type="date"
                          class="form-control"
                          id="message-text"
                          disabled
                          v-model="certificate.endDate"
                        />
                      </div>

                      <!-- Nhập ngày hết hạn mới -->
                      <div class="form-group">
                        <label for="message-text" class="col-form-label"
                          >Ngày Hết Hạn Mới:</label
                        >
                        <input
                          type="date"
                          class="form-control"
                          id="message-text"
                          v-model="endDate"
                        />
                      </div>
                      <span
                        v-if="checked === 2"
                        :class="{ success: checked === 2 }"
                        >Ra Hạn Thành Công
                        <i
                          class="fa fa-check-circle"
                          style="font-size: 24px; color: green"
                        ></i
                      ></span>
                      <p :class="{ error: checked === 3 }" v-if="checked === 3">
                        Có Lỗi Xảy Ra
                        <i
                          class="fa fa-warning"
                          style="font-size: 24px; color: red"
                        ></i>
                      </p>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button"
                      class="btn btn-secondary"
                      data-dismiss="modal"
                    >
                      Đóng
                    </button>
                    <button
                      @click.prevent="editCert(certificate.id)"
                      type="button"
                      class="btn btn-primary"
                    >
                      Cập Nhật
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    
    <div class="chart">
      <div class="chart__item" id="chart__item1">
        <h5 style="text-align:center">THỐNG KÊ SỐ LƯỢNG CÁC LOẠI GIẤY CHỨNG NHẬN</h5>
        <pie-chart :data="[['CƠ SỞ ĂN UỐNG', dataCert[0]],['CƠ SỞ SẢN XUẤT', dataCert[1]]]" width="85%" height="85%" />
      </div>
    </div>

  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import { onMounted, ref } from "vue";
import axios from "axios";
export default {
  name: "AllCertificates",
  components: { PageHeader, PageFooter },

  setup() {
    //Biến lưu trữ thông tin
    const certificates = ref([]);
    const endDate = ref("");
    const checked = ref(1);
    // biến lưu trữ số lượng cơ sở sản xuất
    const dataCert = ref([null,null])
    

    //Lấy thông tin giấy chứng nhận từ API
    const getData = onMounted(async () => {
      const res = await axios.get("http://localhost:8090/cert/location", {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      });
      console.log(res);
      certificates.value = res.data.data.certificates;
      dataCert.value[0] = res.data.data.certRestaurant;
      dataCert.value[1] = res.data.data.certProduction
    });

    //Thu hồi giấy chứng nhận
    const delCert = async (id) => {
      await axios.delete(`http://localhost:8090/cert/${id}`, {
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
      });
      getData();
    };

    //Ra hạn giấy chứng nhận bằng API
    const editCert = (id) => {
      axios
        .patch(
          `http://localhost:8090/cert/${id}`,
          {
            endDate: endDate.value,
          },
          {
            headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
        },
          }
        )

        //Nếu thành công
        .then(() => {
          checked.value = 2;
          endDate.value = "";
          getData();
        })

        //Nếu có lỗi
        .catch(() => {
          checked.value = 3;
        });
    };
    //Trả kết quả
    return {
      certificates,
      endDate,
      delCert,
      editCert,
      dataCert,
      checked,
    };
  },
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
  padding-left: 50px;
  padding-right: 50px;
  margin-top: 50px;
  margin-bottom: 50px;
  h4 {
    text-align: center;
    margin-top: 30px;
    margin-bottom: 30px;
  }
  table {
    cursor: pointer;
    tr,
    td {
      text-align: center;
    }
  }
  .chart__item {
    margin-left: auto;
    margin-right: auto;
  }
  @media screen and (max-width: 768px) {
    h4 {
      font-size: 12px;
    }
    table {
      tr,
      td {
        font-size: 10px;
      }
    }
    button {
      margin-left: 10px;
    }
  }
  @media screen and (min-width: 768px) and (max-width: 1024px) {
    h4 {
      font-size: 16px;
    }
    table {
      tr,
      td {
        font-size: 14px;
      }
    }
  }
}
</style>

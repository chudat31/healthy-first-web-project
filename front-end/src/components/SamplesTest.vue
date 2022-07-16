<template>
  <page-header />
  <div class="body">
    <h5>DANH SÁCH CÁC MẪU THỰC PHẨM ĐƯỢC KIỂM TRA</h5>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th>Mã Kế Hoạch</th>
          <th>Tên Mẫu</th>
          <th>Đơn Vị Giám Định</th>
          <th>Ngày Kết Thúc Kiểm Tra</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="sample in samples" :key="sample.id">
           <td>{{sample.plan_id}}</td>
           <td>{{sample.name}}</td>
           <td>{{sample.laboratory}}</td>
           <td>{{sample.endDate}}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <page-footer />
</template>

<script>
import axios from "axios";
import { ref, onMounted } from "vue";
import PageHeader from "./PageHeader.vue";
import PageFooter from "./PageFooter.vue";
export default {
  components: { PageHeader, PageFooter },
  setup() {
    //Biến lưu giá trị khởi tạo
    const samples = ref([]);

    onMounted(async () => {
      const res = await axios.get("http://localhost:8090/sample", {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("token"),
        },
      });
      console.log(res);
      samples.value = res.data.data
    });
    return {
      samples,
    };
  },
};
</script>

<style lang="scss" scoped>
.body {
  margin: 50px;
  h5 {
    text-align: center;
    margin-bottom: 50px;
  }
  table {
    tr {
      th,td {
        text-align: center;
      }
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

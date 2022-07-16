<template>
  <page-header />
  <div class="body">
    <h5>DANH SÁCH KẾ HOẠCH KIỂM TRA</h5>
    <table class="table table-bordered table-light table-hover">
      <thead>
        <tr>
          <th>Mã Cơ Sở Được Kiểm Tra</th>
          <th>Mã Kế Hoạch Đang Kiểm Tra</th>
          <th>Ngày Bắt Đầu Kiểm Tra</th>
          <th>Ngày Kết Thúc Kiểm Tra</th>
          <th>Trạng Thái</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="plan in plans" :key="plan.id">
           <td>{{plan.restaurantId}}</td>
           <td>{{plan.id}}</td>
           <td>{{plan.start_date}}</td>
           <td>{{plan.end_date}}</td>
           <td>{{plan.status}}</td>
        </tr>
      </tbody>
    </table>
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader";
import PageFooter from "./PageFooter";
import axios from 'axios';
import {ref, onMounted} from 'vue';
export default {
  name: "PlanInspect",
  components: { PageHeader, PageFooter, },
  setup() {

    //biến lưu trữ danh sách kế hoạch
    const plans = ref([]);

    onMounted(()=>{
      axios.get('http://localhost:8090/plan', {
        headers: {
          Authorization: "Bearer " + localStorage.getItem("token"),
        },
      })
      .then ((res)=>{
        plans.value = res.data.data
        console.log(res);
      })
    })
    
    //Trả kết quả
    return {
      plans
    }
  }
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

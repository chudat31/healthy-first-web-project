<template>
  <page-header />
  <div class="body">
      <h5><i>THÔNG TIN CƠ SỞ</i></h5>

      <!-- Render thông tin cơ sở -->
      <div class="info">
        <p><strong>ID: </strong>{{facility.id}}</p>
        <p><strong>Tên Cơ Sở: </strong>{{facility.name}}</p>
        <p><strong>Loại Hình Kinh Doanh: </strong>{{facility.type}}</p>
        <p><strong>Số Điện Thoại Liên Hệ: </strong>{{facility.phone}}</p>
        <p><strong>Địa Chỉ: </strong>{{facility.address}}</p>
        <p v-if="facility.cert_id"><strong>Mã Giấy Chứng Nhận: </strong>{{facility.cert_id}}</p>
        <p v-if="!facility.cert_id"><strong>Mã Giấy Chứng Nhận: </strong> Không Tồn Tại 
        </p>
      </div>
  </div>
  <page-footer/>
</template>

<script>
import {ref, onMounted} from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router';
import PageHeader from './PageHeader.vue'
import PageFooter from './PageFooter.vue'
export default {
  components: {PageHeader, PageFooter},
  setup(){

    //Biến lưu trữ thông tin cơ sở
    const facility = ref({});

    //Biến truy cập đường dẫn
    const route = useRoute();


    //Lấy thông tin về cơ sở thông qua API 
    onMounted(async()=>{
      const data = await axios.get(`http://localhost:8090/res/${route.params.id}`, {
          headers: {
          'Authorization': "Bearer " + localStorage.getItem("token"),
          'Content-Type':'application/json'
        },
        })
      facility.value = data.data.data
    })


    //Trả kết quả
    return {
      facility
    }
  }
}
</script>

<style lang="scss" scoped>
.body {
  background-image: url(https://qph.cf2.quoracdn.net/main-qimg-648ad1622cbd6ab8dacf4182837539a3-lq);
  background-repeat: no-repeat;
  background-size: 35% 70%;
  margin:50px;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  flex-direction: column;
  h5 {
    text-decoration: underline;
    font-weight: 500;
    font-size: 25px;
    margin-bottom: 30px;
  }
  li {
    margin-top: 10px;
    margin-bottom: 10px;
  }
}
</style>
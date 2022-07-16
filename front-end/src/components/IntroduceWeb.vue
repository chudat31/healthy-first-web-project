<template>
  <page-header />
  <div class="body">
    <div class="intro">
      <p><i>GIỚI THIỆU </i></p>
      <div>
        <h3 data-text="HealthyFirst">
          HealthyFirst là ứng dụng web được phát triển nhằm hỗ trợ các chi cục
          an toàn vệ sinh thực phẩm trong công tác quản lý các cơ sở sản xuất
          thực phẩm hoặc kinh doanh dịch vụ ăn uống. Hệ thống cung cấp các chức
          năng chính như sau:
        </h3>

        <ol>
          <li>
            <strong
              data-text1="Quản lý các cơ sở sản xuất thực phẩm và/hoặc kinh doanh dịch vụ ăn
              uống (gọi tắt là cơ sở)."
            >
              Quản lý các cơ sở sản xuất thực phẩm và/hoặc kinh doanh dịch vụ ăn
              uống (gọi tắt là cơ sở).</strong
            >
            Mỗi cơ sở có các thông tin cơ bản bao gồm tên cơ sở, địa chỉ,
            xã/phường/thị trấn, quận/huyện, số điện thoại, các loại hình kinh
            doanh (sản xuất thực phẩm và/hoặc dịch vụ ăn uống), số cấp Giấy
            chứng nhận cơ sở đử điều kiện an toàn thực phẩm.
          </li>
          <li>
            <article
              data-text2="Quản lý Giấy chứng nhận cơ sở đủ điều kiện an toàn thực
              phẩm"
            >
              <strong>
                Quản lý Giấy chứng nhận cơ sở đủ điều kiện an toàn thực
                phẩm.</strong
              >
            </article>
            <ul>
              <li>
                Cấp mới, thu hồi, ra hạn (cấp lại) giấy chứng nhận cho các cơ
                sở. In và quản lý giấy chứng nhận khi cấp mới/lại. In và quản lý
                quyết định thu hồi giấy chứng nhận. Thống kê số lượng giấy chứng
                nhận cấp theo thời gian là loại hình cơ sở (sản xuất thực phẩm
                hay dịch vụ ăn uống).
              </li>
              <li>
                Lọc danh sách các cơ sở đủ điều kiện an toàn thực phẩm (có giấy
                chứng nhận đang còn hiệu lực. Thời gian hiệu lực của giấy chứng
                nhận là từ ngày cấp và trước ngày hết hạn hoặc bị thu hồi).
              </li>
              <li>
                Lọc danh sách các cơ sở không đủ điểu kiện an toàn thực phẩm
                (không có giấy chứng nhận đang còn hiệu lực), lọc chi tiết hơn
                danh sách cơ sở chưa được cấp, đã hết hạn, bị thu hồi giấy chứng
                nhận
              </li>
            </ul>
          </li>
          <li>
            <section
              data-text3="Quản lý hoạt thông thanh, kiểm tra điều kiện an toàn thực phẩm của
              các cơ sở"
            >
              <strong>
                Quản lý hoạt thông thanh, kiểm tra điều kiện an toàn thực phẩm
                của các cơ sở.</strong
              >
            </section>
            <ul>
              <li>
                Lập kế hoạch thanh, kiểm tra các cơ sở về điều kiện an toàn thực
                phẩm.
              </li>
              <li>Theo dõi thực hiện kế hoạch thanh, kiểm tra.</li>
              <li>Thống kê kết quả thực hiện thanh, kiểm tra.</li>
              <li>Tự động gợi ý những cơ sở cần thanh, kiểm tra tiếp theo.</li>
              <li>Quản lý các mẫu thực phẩm cần/được giám định</li>
            </ul>
          </li>
        </ol>
        <span
          ><strong><i>Note:</i></strong> Kế hoạch thanh, kiểm tra là danh sách
          các hoạt động thanh, kiểm tra được sắp xếp theo trình tự thời gian.
          Một hoạt động thanh, kiểm tra sẽ thực hiện thanh, kiểm tra một cơ sở ở
          một thời gian cụ thể (từ ngày đến ngày). Hoạt động thanh kiểm tra bao
          gồm các bước (1) kiểm tra tại cơ sở, (2) lấy mẫu thực phẩm và gửi/thực
          hiện kiểm định (nếu cần), (3) kết luận về kết quả thanh kiểm tra, (4)
          quyết định xử lý vi phạm (nếu có). Kết quả thanh, kiểm tra cho biết cơ
          sở đủ hay không đủ điều kiện an toàn vệ sinh thực phẩm. Nếu quá trình
          thanh, kiểm tra có/cần lấy mẫu thực phẩm để giám định thì cần quản lý
          cả trạng thái thực hiện giám định (đánh mã các mẫu, đơn vị giám định,
          đã gửi giám định hay chưa, ngày nhận kết quả giám định, kết quả giám
          định từng mẫu).</span
        >
      </div>
    </div>
  </div>
  <page-footer />
</template>

<script>
import PageHeader from "./PageHeader.vue";
import PageFooter from "./PageFooter.vue";
export default {
  name: "IntroduceWeb",
  components: {
    PageHeader,
    PageFooter,
  },
};
</script>

<style lang="scss" scoped>
.body {
  color: rgb(180, 166, 166);
  margin-top: 80px;
  margin-bottom: 80px;
  padding: 50px;
  margin: 50px;
  img {
    margin-left: auto;
    margin-right: auto;
  }
}

.intro {
  background-color: rgb(44, 44, 44);
  margin: 10px;
  padding-bottom: 20px;
  padding: 50px;
  p {
    font-size: 2rem;
    padding-top: 20px;
    i {
      text-align: center;
      color: rgb(59, 220, 142);
    }
  }
  @media screen and (min-width: 768px) and (max-width: 1028) {
    p {
      font-size: 18px;
    }
    li {
      font-size: 13px;
    }
  }
  @media screen and (max-width: 768px) {
    p {
      font-size: 1rem;
    }
    div {
      h3 {
        font-size: 20px;
      }
    }
  }
}
#video {
  display: flex;
  justify-content: space-around;
}
video {
  width: 100%;
  height: 100%;
}
.healthy-food {
  width: 40%;
  i {
    color: wheat;
    font-weight: 700;
    width: 40%;
  }
}
</style>

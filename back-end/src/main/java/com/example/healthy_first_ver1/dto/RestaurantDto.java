package com.example.healthy_first_ver1.dto;

import com.example.healthy_first_ver1.entity.Certificate;
import lombok.Builder;
import lombok.Data;

@Builder
@Data

//Những thông tin của nhà hàng hiển thị cho người dùng
public class RestaurantDto {
    private Long id;

    private String name;

    private String address;

    private String phone;

    private String type;

    private String district;

    private Long cert_id;

//    private String image;
//
//    private String time;
}

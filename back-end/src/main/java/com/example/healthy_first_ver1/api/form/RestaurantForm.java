package com.example.healthy_first_ver1.api.form;

import com.sun.istack.NotNull;
import com.sun.istack.Nullable;
import lombok.Data;

@Data

//Thông tin của một nhà hàng
public class RestaurantForm {
    private String name;

    private String address;

    private String phone;

    private String type;

    private String district;

    private Long certId;
}

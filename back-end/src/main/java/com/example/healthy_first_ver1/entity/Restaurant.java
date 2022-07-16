package com.example.healthy_first_ver1.entity;

import com.example.healthy_first_ver1.dto.RestaurantDto;
import lombok.*;


import javax.persistence.*;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "restaurants")

public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    @Column
    private String name;

    @NonNull
    @Column
    private String address;

    @NonNull
    @Column
    private String phone;

    @NonNull
    @Column
    private String type;


    @NonNull
    @Column
    private String district;

    @Column
    private Long cert_id;

//    @Column
//    private String image;
//
//    @Column
//    private String time;

    public RestaurantDto toDto() {
        return RestaurantDto.builder()
                .id(id)
                .name(name)
                .address(address)
                .phone(phone)
                .type(type)
                .district(district)
                .cert_id(cert_id)
//                .image(image)
//                .time(time)
                .build();
    }
}

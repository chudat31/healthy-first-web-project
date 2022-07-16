package com.example.healthy_first_ver1.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data

//Thông tin của một user hiển thị cho người dùng
public class UserDto {
    private Long id;
    private String username;
    private String password;
    private String position;
    private String location;
}

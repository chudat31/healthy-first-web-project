package com.example.healthy_first_ver1.api.form;

import lombok.Data;

@Data

//Thông tin của 1 user
public class UserForm {
    private String username;
    private String password;
    private String position;
    private String location;
}

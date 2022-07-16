package com.example.healthy_first_ver1.api.form;

import lombok.Data;

@Data

//Thông tin khi thêm quyền cho 1 user
public class RoleToUserForm {
    private String username;
    private String roleName;
}

package com.example.healthy_first_ver1.api.form;

import lombok.Data;

import java.time.LocalDate;

@Data
//Thông tin của 1 giấy chứng nhận
public class CertificateForm {

    private LocalDate startDate;

    private LocalDate endDate;

}

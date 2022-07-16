package com.example.healthy_first_ver1.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Builder
@Data

//Những thông tin của giấy chứng nhận hiển thị cho người dùng
public class CertificateDto {
    private Long id;

    private LocalDate startDate;

    private LocalDate endDate;
}

package com.example.healthy_first_ver1.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Builder
@Data

//Những thông tin của kế hoạch hiển thị cho người dùng
public class CheckPlanDto {
    private Long id;

    private LocalDate start_date;

    private LocalDate end_date;

    private Long stageId;

    private String status;

    private Long restaurantId;
}

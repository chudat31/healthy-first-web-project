package com.example.healthy_first_ver1.api.form;

import lombok.Data;

import java.time.LocalDate;

@Data

//Thông tin của 1 kế hoạch kiểm tra
public class CheckPlanForm {
    private LocalDate start_date;

    private LocalDate end_date;

    private Long stageId;

    private String status;

    private Long restaurantId;
}

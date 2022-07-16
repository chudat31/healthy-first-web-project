package com.example.healthy_first_ver1.entity;

import com.example.healthy_first_ver1.dto.RestaurantDto;
import com.example.healthy_first_ver1.dto.SampleDto;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "samples")
public class Sample {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    @Column
    private String name;

    @NonNull
    @Column
    private String laboratory;

    @NonNull
    @Column
    private Long plan_id;

    @NonNull
    @Column
    private LocalDate endDate;

    @Column
    private String status;

    public SampleDto toDto() {
        return SampleDto.builder()
                .id(id)
                .name(name)
                .laboratory(laboratory)
                .plan_id(plan_id)
                .status(status)
                .endDate(endDate)
                .build();
    }
}

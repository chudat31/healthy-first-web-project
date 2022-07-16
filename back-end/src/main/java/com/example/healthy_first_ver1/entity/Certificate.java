package com.example.healthy_first_ver1.entity;

import com.example.healthy_first_ver1.dto.CertificateDto;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "certificates")
public class Certificate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    @Column
    private LocalDate startDate;

    @NonNull
    @Column
    private LocalDate endDate;


    public CertificateDto toDto() {
        return CertificateDto.builder()
                .id(id)
                .startDate(startDate)
                .endDate(endDate)
                .build();
    }
}

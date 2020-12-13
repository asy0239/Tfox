package com.egg.tfox.vo.approval;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ApprovalSendDocVo {
    private String send_app_id;
    private String temp_title;
    private String send_emp_id;
    private String send_app_title;
    private Date send_app_date;
    private String send_app_content;
    private String send_app_status;
    private Date send_app_checkTime;
    private String st_id;
    private String st_emp_id;
    private String st_emp_name;
    private String st_emp_dept_name;
    private String st_order_code;
    private Date st_order_checkTime;
    private String st_apply;
}

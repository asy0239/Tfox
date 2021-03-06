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
public class ApprovalGetMyDoc {
    private String send_app_id;
    private String send_emp_id;
    private String send_emp_name;
    private String send_dept_name;
    private String send_app_title;
    private String send_excu_id;
    private Date send_app_date;
    private String send_app_content;
    private String send_app_status;
    private Date send_app_checktime;
    private String send_temp_id;
    private String send_temp_title;
    private String appstatment_id;
    private String apporder_code;
    private String apporder_check;
    private String apporder_apply;

}

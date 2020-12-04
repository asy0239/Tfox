package com.egg.tfox.vo.approval;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
// 로그인한 사용자에게 온 결재 내역
public class ApprovalMainNoCheckVo {
    private String send_emp_id;
    private String send_emp_name;
    private String send_dept_name;
    private String send_app_id;
    private String approver_id;
    private String approver_name;
    private String send_app_title;
    private String send_app_excu_id;
    private Date app_date;
    private String send_app_status;
    private String send_app_checktime;
    private String get_apporder_code;
    private String get_apporder_check;
    private String get_apporder_apply;
    private String send_temp_id;
    private String send_temp_title;
    private String send_temp_content;
    
}

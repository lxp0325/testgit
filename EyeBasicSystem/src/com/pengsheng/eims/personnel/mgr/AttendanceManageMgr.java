package com.pengsheng.eims.personnel.mgr;

import java.util.List;

import com.pengsheng.eims.logistics.persistence.LogisticsLogPo;
import com.pengsheng.eims.personnel.persistence.AttendanceManagePo;
import com.pengsheng.eims.personnel.persistence.SalaryPo;
import com.pengsheng.eims.system.persistence.PersonInfoPo;

public interface AttendanceManageMgr {
	/**
	 * 查询所有员工薪酬(查询条件)
	 * 
	 * @param 
	 * @param start
	 * @param size
	 * @return
	 */
	public List<AttendanceManagePo> getAttendanceManages(AttendanceManagePo po,int start, int size);
	/**
	 * 查询所有员工薪酬总数
	 * 
	 * @param 
	 * @return
	 */
	public int getAttendanceManageCount(AttendanceManagePo po);
	/**
	 * 新增员工考勤
	 */
	public void insertAttendanceManagePo(AttendanceManagePo po,LogisticsLogPo logPo);
	/**
	 * 更新员工考勤
	 * 
	 * @param personInfoPo
	 */
	public void updateAttendanceManagePo(AttendanceManagePo po,LogisticsLogPo logPo);
	/**
	 * 删除员工考勤
	 * 
	 * @param 
	 */
	
	public void deleteAttendanceManagePo(AttendanceManagePo po,LogisticsLogPo logPo);

	/**
	 * 得到员工考勤
	 * @return
	 */	
	public AttendanceManagePo selectAttendanceManagePo(String id);
	/**
	 * 判断员工考勤是否重复
	 * 
	 * @param 
	 * @return
	 */
	public int getAttendanceManageRepeat(AttendanceManagePo po);
	/**
	 * 查询出人员
	 * 
	 * @param 
	 * @return
	 */
	public AttendanceManagePo getPersonByid(String id ) ;	
}

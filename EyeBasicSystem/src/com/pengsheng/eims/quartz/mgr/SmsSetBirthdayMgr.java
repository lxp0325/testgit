package com.pengsheng.eims.quartz.mgr;

import java.util.List;

import com.pengsheng.eims.member.persistence.CustomerInfoPo;
import com.pengsheng.eims.member.persistence.SmsSetPo;
import com.pengsheng.eims.system.persistence.CompanyNamePo;
import com.pengsheng.eims.system.persistence.QuartzLogPo;
import com.pengsheng.eims.system.persistence.SendNotePo;

public interface SmsSetBirthdayMgr {

	/**
	 * 新增短信记录表 
	 * @param smsRecordPo
	 * @throws Exception 
	 */
	public void insertSmsRecord(List<CustomerInfoPo> customerInfoPoList,SendNotePo snpo,QuartzLogPo logPo) throws Exception;
	
	
	/**
	 * 查询顾客信息
	 * @param salesBasicPo
	 * @return
	 */
	public List<CustomerInfoPo> getCustomerInfo();
	
	/**
	 * 获取短信平台维护表信息
	 * @param smsSetPo
	 * @return
	 */
	public SmsSetPo getSmsSet();
	
	
	/**
	 * 查询公司名称
	 * @param companyNamePo
	 * @return
	 */
	public CompanyNamePo getCompanyName();

}

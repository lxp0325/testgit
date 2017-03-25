/**
 * 
 */
package com.pengsheng.eims.sales.mgr;

import java.util.List;

import com.pengsheng.eims.logistics.persistence.LogisticsLogPo;
import com.pengsheng.eims.member.persistence.CustomerInfoPo;
import com.pengsheng.eims.basic.persistence.GiftsPo;
import com.pengsheng.eims.sales.persistence.InTransitPo;
import com.pengsheng.eims.sales.persistence.InspectionPo;
import com.pengsheng.eims.sales.persistence.SalesBasicPo;
import com.pengsheng.eims.sales.persistence.SalesDetailPo;

/**
 * @author Liuqian
 * 
 */
public interface ConSalesMgr {

	/**
	 * 取顾客会员信息
	 * 
	 * @param po
	 *            会员号或顾客号
	 * @return
	 */
	public CustomerInfoPo getCustomerInfo(CustomerInfoPo po);

	/**
	 * 得到最新一条验光病历表，检查结论
	 * 
	 * @param customerID
	 * @return
	 */
	public List<InspectionPo> getInspectionPos(String customerID);
	/**
	 * 插入配镜主表
	 * 
	 * @param salesBasicPo
	 */
	public void insertSalesBasic(SalesBasicPo salesBasicPo,SalesDetailPo salesDetailPo,GiftsPo giftsPo,InTransitPo inTransitPo,LogisticsLogPo logPo);

	/**
	 * 插入明细表
	 * 
	 * @param salesDetailPo
	 */
	public void insertSalesDetail(SalesDetailPo salesDetailPo,GiftsPo giftsPo);
	public void insertIntrnsitInfo(InTransitPo inTransitPo) ;

}

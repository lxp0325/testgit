package com.pengsheng.eims.hydsycasehistory.dao;

import com.pengsheng.eims.hydsycasehistory.persistence.DoubleEyeFunPo;
import com.pengsheng.eims.hydsycasehistory.persistence.OptometryBasicPo;
import com.pengsheng.eims.hydsycasehistory.persistence.OptometryPo;


public interface DoubleEyeFunHydsyDao {
	/**
	 * 显示双眼视功能检查
	 * 
	 * @param po
	 * @return
	 */
	public DoubleEyeFunPo getDoubleEyeFun(DoubleEyeFunPo po);

	/**
	 * 修改双眼视功能检查
	 * 
	 * @param po
	 */
	public void updateDoubleEyeFun(DoubleEyeFunPo po);

	/**
	 * 新增双眼视功能检查
	 * 
	 * @param po
	 */
	public void insertDoubleEyeFun(DoubleEyeFunPo po);
	
	/**
	 * 更新验光表
	 * @param optometryPo
	 */
	public void updateOptometry(OptometryPo po);
	
	/**
	 * 更新验光基表
	 * @param optometryBasicPo
	 */
	public void updateOptometryBasic(OptometryBasicPo po);
	
	public int getDoubleEyeFunCount(OptometryPo optometryPo) ;
}

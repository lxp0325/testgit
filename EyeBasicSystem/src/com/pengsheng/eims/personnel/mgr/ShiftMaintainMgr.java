package com.pengsheng.eims.personnel.mgr;

import java.util.List;

import com.pengsheng.eims.logistics.persistence.LogisticsLogPo;
import com.pengsheng.eims.personnel.persistence.ShiftMaintainPo;


public interface ShiftMaintainMgr 
{
	/**
	 * 插入班次Po
	 * @param po
	 */
	public void insertShiftMaintainPo(ShiftMaintainPo po,LogisticsLogPo logPo);
	
	/**
	 * 
	 * 判断班次编号是否存在
	 * @return
	 */
	public int getShiftMaintainPoId(ShiftMaintainPo po);
	
	/**
	 * 
	 * 判断班次名称是否存在
	 * @return
	 */
	public int getShiftMaintainPoName(ShiftMaintainPo po);
	
	/**
	 * 
	 * 更新时判断班次编号是否存在
	 * @return
	 */
	public int getShiftMaintainPoIdUpdate(ShiftMaintainPo po);
	
	/**
	 * 
	 * 更新时判断班次名称是否存在
	 * @return
	 */
	public int getShiftMaintainPoNameUpdate(ShiftMaintainPo po);
	
	/**
	 * 删除班次Po
	 * @param po
	 */
	public void deleteShiftMaintainPo(ShiftMaintainPo po,LogisticsLogPo logPo);
	
	/**
	 * 更新班次Po
	 * @param po
	 */
	public void updateShiftMaintainPo(ShiftMaintainPo po,LogisticsLogPo logPo);
	
	/**
	 * 查询班次Po
	 * @param po
	 */
	public ShiftMaintainPo selectShiftMaintainPo(ShiftMaintainPo po);
	
	/**
	 * 查询班次Count
	 * @param po
	 */
	public int selectShiftMaintainCount(ShiftMaintainPo po);
	
	/**
	 * 查询班次List
	 * @param po
	 */
	public List<ShiftMaintainPo> selectShiftMaintainList(ShiftMaintainPo po, int start, int size);
}

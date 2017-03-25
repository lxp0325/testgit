package com.pengsheng.eims.storage.mgr;

import java.util.List;

import com.pengsheng.eims.logistics.persistence.LogisticsLogPo;
import com.pengsheng.eims.storage.persistence.InventoryEntryPo;
import com.pengsheng.eims.storage.persistence.InventoryPo;

public interface OtherDatabaseSettlementMgr {

	/**
	 * 查询其它出库结算数量
	 * @param po
	 * @return
	 */
	public int getOtherDatabaseSettlementCount(InventoryPo po);
	/**
	 * 查询其它出库结算
	 * @param po
	 * @param start
	 * @param size
	 * @return
	 */
	public List<InventoryPo> getOtherDatabaseSettlementList(InventoryPo po,int start, int size);
	/**
	 *其它出库结算详细
	 * @param po
	 * @return
	 */
	public InventoryPo getOtherDatabaseSettlement(InventoryPo po);
	/**
	 * 遍历其它出库结算信息
	 * @param po
	 * @return
	 */
	public List<InventoryEntryPo> getOtherDatabaseSettlementEntryList(InventoryPo po);	
	/**
	 * 修改其它出库结算
	 * @param po
	 */
	public void updateOtherDatabaseSettlement(InventoryPo po,List<InventoryEntryPo> list,LogisticsLogPo logPo);
}

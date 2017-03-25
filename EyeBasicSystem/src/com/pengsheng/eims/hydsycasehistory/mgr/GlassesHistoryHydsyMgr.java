package com.pengsheng.eims.hydsycasehistory.mgr;

import com.pengsheng.eims.hydsycasehistory.persistence.HisInfoPo;
import com.pengsheng.eims.logistics.persistence.LogisticsLogPo;

public interface GlassesHistoryHydsyMgr {

	/**
	 * 查询戴镜史信息
	 * @param hisInfoPo
	 * @return
	 */
	public HisInfoPo selectGlassesHistory(HisInfoPo hisInfoPo);
	
	/**
	 * 新增戴镜史信息
	 * @param hisInfoPo
	 */
	public void insertGlassesHistory(HisInfoPo hisInfoPo,LogisticsLogPo logPo);
	
	/**
	 * 更新戴镜史信息
	 * @param hisInfoPo
	 */
	public void updateGlassesHistory(HisInfoPo hisInfoPo,LogisticsLogPo logPo);
	
}

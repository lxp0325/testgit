package com.pengsheng.eims.casehistory.dao;

import com.pengsheng.eims.casehistory.persistence.HisInfoPo;

public interface GlassesHistoryNDao {

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
	public void insertGlassesHistory(HisInfoPo hisInfoPo);
	
	/**
	 * 删除戴镜史信息
	 * @param hisInfoPo
	 */
	public void deleteGlassesHistory(HisInfoPo hisInfoPo);
	
	/**
	 * 更新戴镜史信息
	 * @param hisInfoPo
	 */
	public void updateGlassesHistory(HisInfoPo hisInfoPo);
}

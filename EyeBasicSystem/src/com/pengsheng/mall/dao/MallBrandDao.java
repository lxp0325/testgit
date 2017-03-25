package com.pengsheng.mall.dao;

import java.util.List;
import com.pengsheng.mall.po.MallBrandPo;

public interface MallBrandDao {

	/**
	 * 获取商城品种总记录数
	 * @param po
	 * @return
	 */
	public int getMallBrandPoCount(MallBrandPo po);
	
	/**
	 * 获取商城品种列表
	 * @param po
	 */
	public List<MallBrandPo> getMallBrandPoList(MallBrandPo po, int start, int size);
	
	/**
	 * 新增商城品种
	 * @param po
	 * @return
	 */
	public void insertMallBrandPo(MallBrandPo po);

	/**
	 * 删除商城品种
	 * @param po
	 * @return
	 */
	public void deleteMallBrandPo(MallBrandPo po);

	/**
	 * 更新商城品种
	 * @param po
	 * @return
	 */
	public void updateMallBrandPo(MallBrandPo po);

	/**
	 * 获取商城品种对象
	 * @param po
	 * @return
	 */
	public MallBrandPo getMallBrandPo(MallBrandPo po);

	/**
	 * 获取所有商城品种列表
	 * @param po
	 * @return
	 */
	public List<MallBrandPo> getMallBrandPoList(MallBrandPo po);
}

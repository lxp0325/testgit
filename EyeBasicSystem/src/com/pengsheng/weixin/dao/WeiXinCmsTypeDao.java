package com.pengsheng.weixin.dao;

import java.util.List;
import com.pengsheng.weixin.persistence.WeiXinCmsTypePo;

public interface WeiXinCmsTypeDao {
	/**
	 * 获取文章类型列表
	 * @param po
	 * @return
	 */
	public int selectWeiXinCmsTypeCount(WeiXinCmsTypePo po);
	
	/**
	 * 获取文章类型总记录数
	 * @param po
	 */
	public List<WeiXinCmsTypePo> selectWeiXinCmsTypes(WeiXinCmsTypePo po, int start, int size);
	
	/**
	 * 新增文章类型
	 * @param po
	 * @return
	 */
	public void insertWeiXinCmsType(WeiXinCmsTypePo po);

	/**
	 * 删除文章类型
	 * @param po
	 * @return
	 */
	public void deleteWeiXinCmsType(WeiXinCmsTypePo po);

	/**
	 * 更新文章类型
	 * @param po
	 * @return
	 */
	public void updateWeiXinCmsType(WeiXinCmsTypePo po);

	/**
	 * 获取文章类型对象
	 * @param po
	 * @return
	 */
	public WeiXinCmsTypePo getWeiXinCmsTypePo(WeiXinCmsTypePo po);

	/**
	 * 获取所有文章类型列表
	 * @param po
	 * @return
	 */
	public List<WeiXinCmsTypePo> getWeiXinCmsTypeList(WeiXinCmsTypePo po);
}

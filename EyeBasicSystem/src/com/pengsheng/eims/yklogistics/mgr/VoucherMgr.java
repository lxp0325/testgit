/**
* 项目名称 : EIMS财务物流子系统
* 文件名称 : VoucherMgr.java
* 版本号      : V1
* 作者           : SZK
* 生成日期 : 2011-02-11
**/
package com.pengsheng.eims.yklogistics.mgr;

import java.util.List;

import com.pengsheng.eims.logistics.persistence.InvoiceEntryPo;
import com.pengsheng.eims.logistics.persistence.InvoicePo;
import com.pengsheng.eims.logistics.persistence.LogisticsLogPo;
import com.pengsheng.eims.logistics.persistence.SalesShopPo;
import com.pengsheng.eims.logistics.persistence.VoucherEntryPo;
import com.pengsheng.eims.logistics.persistence.VoucherPo;
import com.pengsheng.eims.logistics.persistence.VoucherTypePo;
import com.pengsheng.eims.storage.persistence.InventoryEntryPo;
import com.pengsheng.eims.storage.persistence.InventoryPo;

public interface VoucherMgr {
	/**
	 * Description：根据参数查询父类凭证类型是当前参数的详细信息
	 * @param     ：父类凭证类型ID
	 * @return    ：返回符合条件的凭证类型列表
	 */
	public List<VoucherTypePo> getVoucherTypeByID(String parentID);
	
	/**
	 * Description：根据参数查询凭证总数
	 * @param     ：凭证实体
	 * @return    ：返回符合条件的凭证总数
	 */
	public int getVoucherCount(VoucherPo po);
	
	/**
	 * Description：根据参数查询凭证信息
	 * @param     ：VoucherPo 凭证实体
	 * @param     ：start 开始行数
	 * @param     ：size  每页显示行数
	 * @return    ：返回符合条件的凭证信息列表
	 */
	public List<VoucherPo> getVoucherList(VoucherPo po,int start, int size);
	
	
	/**
	 * Description：根据参数查询凭证信息
	 * @param     ：VoucherPo 凭证实体
	 * @return    ：返回符合条件的凭证信息列表
	 */
	public List<VoucherPo> getVoucherList(VoucherPo po);
	
	/**
	 * Description：根据参数查询其父类凭证类型ID
	 * @param     ：凭证ID
	 * @return    ：返回符合条件的凭证类型列表
	 */
	public List<VoucherTypePo> getVoucherParentTypeByID(String parentID);
	
	/**
	 * Description：根据参数删除凭证及明细信息
	 * @param     ：凭证ID
	 */
	public void deleteVoucherByID(String voucherID,String voucherType,LogisticsLogPo logPo);
	
	/**
	 * Description：根据参数修改凭证及明细信息
	 * @param     ：凭证ID
	 */
	public void updateVoucherByID(VoucherPo voucherPo,List<VoucherEntryPo> voucherEntryPoList,String id,String voucherType,LogisticsLogPo logPo);
	
	/**
	 * Description：根据参数修改凭证模板信息
	 * @param     ：凭证ID
	 */
	public void updateVoucherByID(VoucherPo voucherPo,LogisticsLogPo logPo);
	
	/**
	 * Description：根据参数查询其父类凭证类型名称
	 * @param     ：凭证ID
	 * @return    ：返回符合条件的凭证类型类型名称
	 */
	public String getVoucherTypeName(String id);
	
	/**
	 * Description：根据参数查询凭证明细(单据)信息总数
	 * @param     ：凭证明细实体
	 * @return    ：返回符合条件的凭证明细(单据)信息总数
	 */	
	public int getVoucherEntryByBillsCount(VoucherEntryPo po);
	
	/**
	 * Description：根据参数查询凭证明细(单据)信息
	 * @param     ：VoucherEntryPo 凭证明细实体
	 * @param     ：start 开始行数
	 * @param     ：size  每页显示行数
	 * @return    ：返回符合条件的凭证明细(单据)信息列表
	 */
	public List<VoucherEntryPo> getVoucherEntryByBillsList(VoucherEntryPo po,int start, int size);
	
	/**
	 * Description：根据参数查询凭证明细(单据)信息
	 * @param     ：VoucherEntryPo 凭证明细实体
	 * @return    ：返回符合条件的凭证明细(单据)信息列表
	 */
	public List<VoucherEntryPo> getVoucherEntryByBillsList(VoucherEntryPo po);
	
	/**
	 * Description：新增凭证
	 * @param     ：凭证实体
	 */
	public void insertVoucher(VoucherPo po,LogisticsLogPo logPo);
	
	/**
	 * Description：新增凭证
	 * @param     ：凭证实体
	 */
	public void insertVoucher(VoucherPo po,List<VoucherEntryPo> voucherEntryList,String id,String voucherType,LogisticsLogPo logPo);
	
	/**
	 * Description：新增凭证明细
	 * @param     ：凭证明细实体
	 */
	public void insertVoucherEntry(List<VoucherEntryPo> list,LogisticsLogPo logPo);
	public void updateVoucherAmount(VoucherPo po,LogisticsLogPo logPo);
	public void updateVoucherAmountByInvoice(VoucherPo po,LogisticsLogPo logPo);
	
	/**
	 * Description：查询发票基本信息
	 * @param     ：凭证号
	 * @param     ：start 开始行数
	 * @param     ：size  每页显示行数
     * @return    ：返回符合条件的发票列表
	 */
	public List<VoucherEntryPo> getInvoiceList(String voucherID,int start, int size);
	
	/**
	 * Description：查询发票基本信息
	 * @param     ：凭证号
     * @return    ：返回符合条件的发票列表
	 */
	public List<VoucherEntryPo> getInvoiceList(String voucherID);
	
	/**
	 * Description：查询符合条件的发票总数
	 * @param     ：凭证号
     * @return    ：返回符合条件的发票总数
	 */
	public int getInvoiceCount(String voucherID);
	
	/**
	 * Description：查询符合条件的冲回记录总数
	 * @param     ：凭证号
     * @return    ：返回符合条件的冲回记录总数
	 */
	public int getReversalCount(String voucherID);
	
	/**
	 * Description：查询冲回基本信息
	 * @param     ：凭证号
	 * @param     ：start 开始行数
	 * @param     ：size  每页显示行数
     * @return    ：返回符合条件的冲回列表
	 */
	public List<VoucherEntryPo> getReversalList(String voucherID,int start, int size);
	
	/**
	 * Description：查询冲回基本信息
	 * @param     ：凭证号
     * @return    ：返回符合条件的冲回列表
	 */
	public List<VoucherEntryPo> getReversalList(String voucherID);
	
	/**
	 * Description：查询符合条件的冲回明细信息
	 * @param     ：冲回实体
	 * @param     ：start 开始行数
	 * @param     ：size  每页显示行数
     * @return    ：返回符合条件的冲回明细信息
	 */
	public List<InvoiceEntryPo> getReversalEntryPoList(InvoiceEntryPo po,int start, int size);
	public List<InvoiceEntryPo> getReversalEntryPoList(InvoiceEntryPo po);
	
	/**
	 * Description：查询符合条件的冲回明细总数
	 * @param     ：冲回实体
     * @return    ：返回符合条件的冲回明细总数
	 */
	public int getReversalEntryCount(InvoiceEntryPo po);
	
	/**
	 * Description：查询冲回基本信息
	 * @param     ：冲回号
     * @return    ：返回符合条件的冲回基本信息
	 */
	public InvoicePo getReversalPo(InvoicePo po);
	
	/**
	 * Description：根据单据号得到商品明细信息
	 * @param     ：单据号数组
	 * @return    ：返回符合条件的商品明细列表
	 */
	public List<VoucherEntryPo> getBillGoods(List<VoucherEntryPo> voucherEntryList,String[] bills);
	
	/**
	 * Description：根据单据号锁定单据
	 * @param     ：凭证明细实体
	 */
	public void updateLockBills(List<VoucherEntryPo> voucherEntryList,String type,LogisticsLogPo logPo);
	
	/**
	 * Description：根据发票号锁定发票
	 * @param     ：凭证明细实体
	 */
	public void updateLockInvoices(List<VoucherEntryPo> voucherEntryList,LogisticsLogPo logPo);
	
	/**
	 * Description：根据冲回号锁定冲回记录
	 * @param     ：凭证明细实体
	 */
	public void updateLockReversals(List<VoucherEntryPo> voucherEntryList,LogisticsLogPo logPo);	
	
	/**
	 * Description：根据发票号锁定单据
	 * @param     ：凭证明细实体
	 */
	public void updateLockBillsByInvoiceID(List<VoucherEntryPo> voucherEntryList,LogisticsLogPo logPo);
	
	/**
	 * Description：根据冲回号锁定单据
	 * @param     ：凭证明细实体
	 */
	public void updateLockBillsByReversalID(List<VoucherEntryPo> voucherEntryList,LogisticsLogPo logPo);
	
	/**
	 * Description：根据审核人ID查询审核人名称
	 * @param     ：审核人ID
	 * @return    : 返回审核人名称
	 */
	public String getAuditPersonNameByID(String auditPersonID);
	
	/**
	 * Description：根据发票号查询核销的商品代码
	 * @param     ：发票号
	 * @return    : 返回商品代码
	 */
	public List<VoucherEntryPo> getGoodsIdByInvoiceID(String invoiceID);
	
	
	/**
	 * Description：根据冲回号查询核销的商品代码
	 * @param     ：冲回号
	 * @return    : 返回商品代码
	 */
	public List<VoucherEntryPo> getGoodsIdByReversalID(String reversalID);	
	
	/**
	 * Description：根据发票号查询发票信息
	 * @param     ：旧发票列表
     * @param     ：发票号数组
	 * @return    : 返回发票信息
	 */
	public List<VoucherEntryPo> getInvoiceListByID(List<VoucherEntryPo> voucherEntryList,String[] billID);
	
	/**
	 * Description：根据冲回号查询冲回信息
	 * @param     ：voucherEntryList 旧冲回列表
     * @param     ：bills 冲回号数组
	 * @return    : 返回冲回信息
	 */
	public List<VoucherEntryPo> getReversalListByID(List<VoucherEntryPo> voucherEntryList,String[] bills);
	
	/**
	 * Description：根据发票号查询成本合计、价税合计、税额合计
	 * @param     ：发票号
	 * @return    : 返回发票的成本合计、价税合计、税额合计
	 */
	public VoucherPo getAmountByInvoiceID(String invoiceID);
	
	/**
	 * Description：根据冲回号查询成本合计、价税合计、税额合计
	 * @param     ：冲回号
	 * @return    : 返回冲回的成本合计、价税合计、税额合计
	 */
	public VoucherPo getAmountByReversalID(String reversalID);	
	
	/**
	 * Description：根据单据号解锁单据
	 * @param     ：凭证明细实体
	 */
	public void updateNotLockBills(String voucherID,String voucherType,LogisticsLogPo logPo);
	
	/**
	 * Description：根据发票号解锁发票
	 * @param     ：凭证明细实体
	 */
	public void updateNotLockInvoices(String voucherID,LogisticsLogPo logPo);
	
	/**
	 * Description：根据冲回号解锁冲回记录
	 * @param     ：凭证明细实体
	 */
	public void updateNotLockReversals(String voucherID,LogisticsLogPo logPo);	
	
	/**
	 * Description：根据发票号解锁单据
	 * @param     ：凭证号
	 */
	public void updateNotLockBillByInvoiceID(String voucherID,LogisticsLogPo logPo);
	
	/**
	 * Description：根据冲回号解锁单据
	 * @param     ：凭证号
	 */
	public void updateNotLockBillByReversalID(String voucherID,LogisticsLogPo logPo);
	
	/**
	 * Description：根据凭证号查询凭证类型
	 * @param     ：凭证号
	 * @return    : 返回凭证类型
	 */
	public String getVoucherTypeByVoucherID(String voucherID);	
	
	/**
	 * Description：查询所有门店
	 * @return    : 返回所有门店
	 */
	public List<SalesShopPo> getSalesShopList();
	
	/**
	 * Description：凭证过账(新中大)
	 * @param     ：凭证号
	 */
	public void updateXZD_VoucherPosting(String vouchersID,String companyID,String flag,LogisticsLogPo logPo);
	
	/**
	 * Description：凭证过账(用友)
	 * @param     ：凭证号
	 */
	public void updateYY_VoucherPosting(String vouchersID,LogisticsLogPo logPo);
	
	/**
	 * Description：修改凭证过账标识
	 * @param     ：凭证号
	 */
	public void updateVoucherPosting(String vouchersID,LogisticsLogPo logPo);
	
	/**
	 * 得到业务表信息数量
	 * @param invoicePo
	 * @return
	 */
	public int getSelectBillCount(InventoryPo inventoryPo);
	
	/**
	 * 查询业务表信息List
	 * @param invoicePo
	 * @param start
	 * @param size
	 * @return
	 */
	public List<InventoryPo> selectSelectBill(InventoryPo inventoryPo , int start , int size);
	
	
	/**
	 * 得到发票和冲回信息数量
	 * @param invoicePo
	 * @return
	 */
	public int getSelInvoiceAndReversalCount(InventoryPo po);
	
	/**
	 * 查询发票和冲回信息List
	 * @param invoicePo
	 * @param start
	 * @param size
	 * @return
	 */
	public List<InventoryPo> selInvoiceAndReversal(InventoryPo po , int start , int size);
	
	/**
	 * 新增出库凭证
	 * @param po
	 * @return
	 */
	public void insertOutStrogeVoucher(VoucherPo po,List<VoucherEntryPo> voucherEntryList,LogisticsLogPo logPo);
	
	/**
	 * 查询出库凭证
	 * @param invoicePo
	 * @return
	 */
	public List<VoucherPo> selOutStrogeVoucher(VoucherPo po,int start,int size);
	
	/**
	 * 查询出库凭证总数
	 * @param invoicePo
	 * @return
	 */
	public int selOutStrogeVoucherCount(VoucherPo po);
	
	/**
	 * 查询出库成本和销售收入
	 * @param invoicePo
	 * @return
	 */
	public VoucherEntryPo getOutStrogeAmount(String voucherPo);
	
	/**
	 * 查询当前账期
	 */
	public VoucherPo selCurrentAccountPeriod();
	
	/**
	 * 开关账
	 */
	public void updateSwitchAmount(String flag,LogisticsLogPo logPo);
	
	/**
	 * 查询未作账的单据总数
	 */
	public int selBillWhetherSettleAccountsCount(String date,String billType);
	
	/**
	 * 查询未作账的单据列表
	 */
	public List<InventoryEntryPo> selBillWhetherSettleAccounts(String date,String billType,int start,int size);
	
	/**
	 * 查询销售出库凭证总数
	 */
	public int getSalesOutStorageVoucherCount(VoucherPo po);
	
	/**
	 * 查询销售出库凭证列表
	 */
	public List<VoucherEntryPo> getSalesOutStorageVoucherList(VoucherPo po,int start,int size);
	public List<VoucherEntryPo> getSalesOutStorageVoucherList(VoucherPo po);
	
	/**
	 * 修改销售出库凭证
	 */
	public void updateSalesOutStorageVoucher(VoucherPo po,LogisticsLogPo logPo);
	
	/**
	 * 获取当前需要传输的财物软件的路径
	 */
	public String getCurrentFinanceSoftwarePath();
}

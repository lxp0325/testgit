package com.pengsheng.eims.report.action;

import java.util.List;
import java.util.ArrayList;

import com.pengsheng.eims.basic.mgr.WarehouseMgr;
import com.pengsheng.eims.basic.persistence.DepartmentsPo;
import com.pengsheng.eims.basic.persistence.WarehousePo;
import com.pengsheng.eims.system.mgr.DepartmentsMgr;
import com.pengsheng.eims.system.mgr.SystemParameterMgr;
import com.pengsheng.eims.system.persistence.PersonInfoPo;
import com.pengsheng.eims.system.persistence.SystemParameterPo;
import com.pengsheng.eims.util.basicaction.BaseAction;



public class OtherGoodsStorageDetailsAction extends BaseAction {


	private List<DepartmentsPo> departmentsList;
	
	private WarehouseMgr warehouseMgr;

	private DepartmentsMgr departmentsMgr;

	private List<WarehousePo> warehouselist;
	
	private SystemParameterMgr systemParameterMgr;
	private SystemParameterPo systemParameterPo;
	
	
	
	
	public SystemParameterMgr getSystemParameterMgr() {
		return systemParameterMgr;
	}

	public void setSystemParameterMgr(SystemParameterMgr systemParameterMgr) {
		this.systemParameterMgr = systemParameterMgr;
	}

	public SystemParameterPo getSystemParameterPo() {
		return systemParameterPo;
	}

	public void setSystemParameterPo(SystemParameterPo systemParameterPo) {
		this.systemParameterPo = systemParameterPo;
	}

	public List<DepartmentsPo> getDepartmentsList() {
		return departmentsList;
	}

	public void setDepartmentsList(List<DepartmentsPo> departmentsList) {
		this.departmentsList = departmentsList;
	}
	
	public WarehouseMgr getWarehouseMgr() {
		return warehouseMgr;
	}


	public void setWarehouseMgr(WarehouseMgr warehouseMgr) {
		this.warehouseMgr = warehouseMgr;
	}


	public DepartmentsMgr getDepartmentsMgr() {
		return departmentsMgr;
	}


	public void setDepartmentsMgr(DepartmentsMgr departmentsMgr) {
		this.departmentsMgr = departmentsMgr;
	}


	public List<WarehousePo> getWarehouselist() {
		return warehouselist;
	}

	public void setWarehouselist(List<WarehousePo> warehouselist) {
		this.warehouselist = warehouselist;
	}


	public String otherGoodsStorageDetails(){
		PersonInfoPo personInfoPo=(PersonInfoPo)session.get("person");		
		DepartmentsPo deppo=new DepartmentsPo();
		deppo.setBdpdepartmentid(personInfoPo.getDepartmentID());
		deppo.setBdptype(personInfoPo.getDepartmenttype());
		deppo.setBdpdepartmentname(personInfoPo.getBdpdepartmentname());
		List<DepartmentsPo> departmentsList1 = departmentsMgr
		.getDepartments(deppo);
		departmentsList = new ArrayList<DepartmentsPo>();
		for (int i = 0; i < departmentsList1.size(); i++) {
			if ("1".equals(departmentsList1.get(i).getBdptype())
					|| "2".equals(departmentsList1.get(i).getBdptype())
					|| "3".equals(departmentsList1.get(i).getBdptype())) {
				departmentsList.add(departmentsList1.get(i));
			}
			
        }
		WarehousePo warehousePo = new WarehousePo();
		
		if ("1".equals(personInfoPo.getDepartmenttype())) {
			warehousePo.setBwhdeptid(personInfoPo.getDepartmentID());
			warehouselist = warehouseMgr.getWarehouseList(warehousePo);
		} else if ("2".equals(personInfoPo.getDepartmenttype())) {
			warehousePo.setBwhdeptid(personInfoPo.getDepartmentID());
			warehouselist = warehouseMgr.getWarehouseList(warehousePo);
		} else {
			warehouselist = warehouseMgr.getWarehouseList(warehousePo);
		}
		systemParameterPo = (SystemParameterPo) session.get("systemParameterPo");		
		String[] strArray = super.getReportDefultDate(systemParameterPo);

		request.setAttribute("tBgnDate",strArray[0]);
		request.setAttribute("tEndDate",strArray[1]);
		
		return SUCCESS;
		
	}
}

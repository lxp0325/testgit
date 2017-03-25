package com.pengsheng.eims.basic.mgr;

import java.util.List;

import com.pengsheng.eims.basic.persistence.MailingListPo;

public interface MailingListMgr {

	public int getMailingListCount(MailingListPo mailingListPo);
	
	public List<MailingListPo> getMailingList(MailingListPo mailingListPo, int start, int size);
	
	public MailingListPo getMailingListPo(MailingListPo mailingListPo);
	
	public void insertMailingListPo(MailingListPo mailingListPo);
	
	public void updateMailingListPo(MailingListPo mailingListPo);
	
	public void deleteMailingListPo(MailingListPo mailingListPo);
	
	public List<MailingListPo> getMailingList(); 
	
	public MailingListPo getMailingListPo();
}

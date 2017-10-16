package com.ppi.search.service.impl;


import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

import com.ppi.search.service.cxfService;

@WebService
@SOAPBinding(style = Style.RPC)
public class cxfServiceImpl implements cxfService {

	public String hello(String str) {
		return "{'companyId':"+str+",'targetId':'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','targetEntity':'client','actionType':'update'}";
	}

}

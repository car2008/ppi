package com.ppi.base.quartz;

import java.util.Date;


public class EmailSend{

	public void execute(){
		System.out.println("Timed task execution...Current time is: "+new Date(System.currentTimeMillis()));
	}

}

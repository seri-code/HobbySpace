package com.comp.hobbyspace.mapper;

import com.comp.hobbyspace.beans.CalendarBean;

public interface CalendarMapper {

	public int upfinalD(CalendarBean cb);
	public int insSaveD(CalendarBean cb);
	public int insSpace(CalendarBean cb);
	public int insTag(CalendarBean cb);
	public int insSns(CalendarBean cb);
	public int insCaution(CalendarBean cb);
	public void insHost(CalendarBean cb);
	public int ifHost(CalendarBean cb);
	public int insImg(CalendarBean cb);
	public int insRoom(CalendarBean cb);
	
}

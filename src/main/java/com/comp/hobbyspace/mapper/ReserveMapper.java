package com.comp.hobbyspace.mapper;

import java.util.ArrayList;

import com.comp.hobbyspace.beans.ReserveBean;

public interface ReserveMapper {
	ArrayList<ReserveBean> showD(ReserveBean rb);
	ArrayList<ReserveBean> ReserveD(ReserveBean rb);
	int insTemp(ReserveBean rb);
	ArrayList<ReserveBean> loadTemp(ReserveBean rb);
	int newReserve(ReserveBean rb);
	int updateCalendar(ReserveBean rb);
	int delTemp1(ReserveBean rb);
	int delTemp2(ReserveBean rb);
	ArrayList<ReserveBean> loadReserveDetail(ReserveBean rb);
	ArrayList<ReserveBean> cancelReserve(ReserveBean rb);
	ArrayList<ReserveBean> viewStatus(ReserveBean rb);
	ArrayList<ReserveBean> hostSign(ReserveBean rb);
	ArrayList<ReserveBean> room(ReserveBean rb);
	ArrayList<ReserveBean> finald(ReserveBean rb);
	ArrayList<ReserveBean> falsed(ReserveBean rb);
	int updateTemp(ReserveBean rb);
	int newDetail(ReserveBean rb);
	int delTemp(ReserveBean rb);
	ArrayList<ReserveBean> loadReserve(ReserveBean rb);
	ArrayList<ReserveBean> ReserveDetail(ReserveBean rb);
	ReserveBean selectDetail(ReserveBean rb);
	ArrayList<ReserveBean> ToHostReserveList(ReserveBean rb);
	int OKStatus(ReserveBean rb);
	int NOStatus(ReserveBean rb);
}

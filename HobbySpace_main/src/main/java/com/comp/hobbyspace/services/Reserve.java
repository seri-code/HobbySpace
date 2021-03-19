package com.comp.hobbyspace.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import com.comp.hobbyspace.beans.HamburgerBean;
import com.comp.hobbyspace.beans.ReserveBean;
import com.comp.hobbyspace.mapper.ReserveMapper;
import com.google.gson.Gson;

@Service
public class Reserve {
	@Autowired
	private ReserveMapper rsMapper;
	@Autowired
	private Gson gson;
	@Autowired
	private PlatformTransactionManager tran;

	public ModelAndView entrance(HttpServletRequest req, ReserveBean rb) {
		ModelAndView mav = null;
		switch (rb.getSCode()) {
		case "1":
			mav = roomCtl(rb);
			break;
		case "2":
			mav = finaldCtl(rb);
			break;
		case "3":
			mav = falsedCtl(rb);
			break;
		case "4":
			mav = tempCtl(req, rb);
			break;
		case "5":
			mav = reserveCtl(req, rb);
			break;
		case "6":
			mav = reservDetailCtl(rb);
			break;
		case "7":
			mav = ToHostReserveListCtl(req, rb);
			break;
		case "8":
			mav = OKStatusCtl(req, rb);
			break;
		case "9":
			mav = NOStatusCtl(req, rb);
			break;
		case "10":
			mav = cancelReserveCtl(req, rb);
			break;
		case "11":
			mav = tempTestCtl(req, rb);
			break;
		default:
		}
		
		return mav;

	}

	private boolean convertToBoolean(int value) {
		return value == 1 ? true : false;
	}

	// 룸 선택 Ctl
	private ModelAndView roomCtl(ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ReserveBean> list = this.room(rb);
		String jsonData1 = gson.toJson(list);
		mav.addObject("roomList", jsonData1);
		System.out.println(jsonData1);
		System.out.println(rb.getSpCode());
		return mav;
	}

	// 룸선택
	private ArrayList<ReserveBean> room(ReserveBean rb) {
		return rsMapper.room(rb);
	}

	// 영업날짜 ctl
	private ModelAndView finaldCtl(ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ReserveBean> list1 = this.finald(rb);
		String jsonData2 = gson.toJson(list1);
		if (jsonData2.equals("[null]")) {
			System.out.println("진입");
			rb.setFinald("2999-03-17");
			jsonData2 = gson.toJson(rb.getFinald());
		}
		mav.addObject("finald", jsonData2);
		System.out.println("요놈인가요: " + jsonData2);
		return mav;
	}

	// 영업날짜
	private ArrayList<ReserveBean> finald(ReserveBean rb) {
		return rsMapper.finald(rb);
	}

	// 영업불가날짜 ctl
	private ModelAndView falsedCtl(ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println("falseD Ctl메소드 도착");
		System.out.println(rb.getRonum() + "씨티엘");
		ArrayList<ReserveBean> list2 = this.falsed(rb);
		String jsonData3 = gson.toJson(list2);
		mav.addObject("falsed", jsonData3);
		System.out.println(jsonData3);
		
		
		return mav;
	}

	// 영업불가날짜
	private ArrayList<ReserveBean> falsed(ReserveBean rb) {
		return rsMapper.falsed(rb);
	}

	// 임시예약Ctl
	private ModelAndView tempCtl(HttpServletRequest req, ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rb.getSpCode());
		HttpSession session = req.getSession();
		rb.setUserId(session.getAttribute("accessInfo").toString());
		
		this.insTemp(rb);

		mav.setViewName("redirect:reservTempTest?sCode="+11);
//		System.out.println("temp 입력 성공");
//		ArrayList<ReserveBean> list3 = this.loadTemp(rb);
//		String jsonData3 = gson.toJson(list3);
//		mav.addObject("loadTemp", jsonData3);
//		
//		System.out.println(jsonData3);
//		mav.setViewName("reservTemp");
		
		return mav;

	}
	// 임시예약새로고침방지
	private ModelAndView tempTestCtl(HttpServletRequest req, ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rb.getSpCode());
		HttpSession session = req.getSession();
		rb.setUserId(session.getAttribute("accessInfo").toString());

		System.out.println("temp 입력 성공");
		ArrayList<ReserveBean> list3 = this.loadTemp(rb);
		String jsonData3 = gson.toJson(list3);
		mav.addObject("loadTemp", jsonData3);
		
		System.out.println(jsonData3);
		mav.setViewName("reservTemp");
		
		return mav;
//		// temp insert
//		if (this.insTemp(rb)) {
//		
//		}
	}

	// 임시예약 DB에 입력
	private boolean insTemp(ReserveBean rb) {
		return convertToBoolean(rsMapper.insTemp(rb));
	}

	// 임시예약 페이지 표시
	private ArrayList<ReserveBean> loadTemp(ReserveBean rb) {
		return rsMapper.loadTemp(rb);
	}

	// 예약 신청 Ctl
	private ModelAndView reserveCtl(HttpServletRequest req, ReserveBean rb) {
		TransactionStatus status = tran.getTransaction(new DefaultTransactionDefinition());
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		rb.setUserId(session.getAttribute("accessInfo").toString());
		System.out.println(rb.getUserId());
		try {
			// 예약 insert
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			Date date = new Date();
			String time = format.format(date);
			rb.setRsdate(time);
			this.newReserve(rb);

			System.out.println("랭스길이: " + rb.getRsterospCodes().length);
			for (int i = 0; i < rb.getRsterospCodes().length; i++) {
				// jsp에 스플릿 안먹어서 이걸로 대체하여 날짜 넣음
				String s[] = rb.getRstedates()[i].split(" ");
				String ss[] = s[0].split("-");
				String sss[] = s[1].split(":");
				String ssss = ss[0] + ss[1] + ss[2] + sss[0] + sss[1] + sss[2];
				rb.setRstedate(ssss);
				// rb.setRstedate(rb.getRstedates()[i]); //임시예약신청일
				rb.setRsphone(rb.getRsphones()[i]);
				rb.setRsemail(rb.getRsemails()[i]);
				rb.setRsterospCode(rb.getRsterospCodes()[i]);
				rb.setRsteronum(rb.getRsteronums()[i]);
				rb.setRsusedate(rb.getRsusedates()[i]);
				rb.setRstepeople(rb.getRstepeoples()[i]);
				// 이메일 전화번호 업데이트
				if (this.updateTemp(rb)) {
					System.out.println("temp update 성공");
					System.out.println(rb.getRsterospCodes()[i]);
					// 예약 상세 insert
					if (this.newDetail(rb)) {
						System.out.println("예약상세 insert 성공");
						if (this.noDate(rb)) {
							System.out.println("불가날짜 인설트 성공");
						}
					}
				} else {
				}
			} // for
			tran.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback(status);
		}
		//임시예약삭제
		for (int i = 0; i < rb.getRsterospCodes().length; i++) {
			rb.setRsterospCode(rb.getRsterospCodes()[i]);
			rb.setRsteronum(rb.getRsteronums()[i]);
			String s[] = rb.getRstedates()[i].split(" ");
			String ss[] = s[0].split("-");
			String sss[] = s[1].split(":");
			String ssss = ss[0] + ss[1] + ss[2] + sss[0] + sss[1] + sss[2];
			rb.setRstedate(ssss);
			this.DelTemp(rb);
		}
		mav.setViewName("redirect:/ToReserveList?sCode=2");
		// 예약리스트 로드
		ArrayList<ReserveBean> list4 = this.loadReserve(rb);
		String jsonData4 = gson.toJson(list4);
		System.out.println(jsonData4);
		mav.addObject("loadReserve", jsonData4);
		mav.setViewName("reserveList");
		return mav;
	}
	// 불가날짜 인설트 성공
	private boolean noDate(ReserveBean rb) {
		return convertToBoolean(rsMapper.noDate(rb));
	}
	private ArrayList<ReserveBean> loadReserve(ReserveBean rb) {
		return rsMapper.loadReserve(rb);
	}
	// 임시예약 DB에 업데이트 --완료
	private boolean updateTemp(ReserveBean rb) {
		return convertToBoolean(rsMapper.updateTemp(rb));
	}
	// 예약 생성 --완료
	private boolean newReserve(ReserveBean rb) {
		return convertToBoolean(rsMapper.newReserve(rb));
	}
	// 예약 상세 생성 --완료
	private boolean newDetail(ReserveBean rb) {
		return convertToBoolean(rsMapper.newDetail(rb));
	}
	// 예약상세로 가기 Ctl
	private ModelAndView reservDetailCtl(ReserveBean rb) {

		ModelAndView mav = new ModelAndView();
		System.out.println(rb.getRdcode());
		ArrayList<ReserveBean> list5 = this.ReserveDetail(rb);
		mav.addObject("reservDetailInFo", ReserveDetail(rb));
		
		String jsonData1 = gson.toJson(list5);
		mav.addObject("reservDetail", jsonData1);
		System.out.println(rb.getSptopimg13());
		
		mav.addObject("getSptopimg13", rb.getSptopimg13());
		mav.setViewName("reserveDetail");
		return mav;
	}
	// 예약 상세 로드
	private ArrayList<ReserveBean> ReserveDetail(ReserveBean rb) {
		return rsMapper.ReserveDetail(rb);
	}
	// 승인완료ctl
	private ModelAndView OKStatusCtl(HttpServletRequest req, ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rb.getRdcode());
		HttpSession session = req.getSession();
		rb.setUserId(session.getAttribute("accessInfo").toString());
		if (this.OKStatus(rb)) {
			System.out.println(rb.getRdcode());
			System.out.println(this.OKStatus(rb));
			ArrayList<ReserveBean> list1 = this.ToHostReserveList(rb);
			String jsonData1 = gson.toJson(list1);
			mav.addObject("ToHostReserveList1", jsonData1);
			System.out.println(jsonData1);
		} else {

		}
		;

		return mav;
	}

	// 승인완료
	private boolean OKStatus(ReserveBean rb) {
		return convertToBoolean(rsMapper.OKStatus(rb));
	}

	// 승인거절ctl
	private ModelAndView NOStatusCtl(HttpServletRequest req, ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rb.getRdcode());
		HttpSession session = req.getSession();
		rb.setUserId(session.getAttribute("accessInfo").toString());
		if (this.NOStatus(rb)) {
			System.out.println(this.NOStatus(rb));
			ArrayList<ReserveBean> list2 = this.ToHostReserveList(rb);
			String jsonData1 = gson.toJson(list2);
			mav.addObject("ToHostReserveList2", jsonData1);
			System.out.println(jsonData1);
		} else {

		};

		return mav;
	}

	// 승인거절
	private boolean NOStatus(ReserveBean rb) {
		return convertToBoolean(rsMapper.NOStatus(rb));
	}

	// 호스트 빌려준공간
	private ModelAndView ToHostReserveListCtl(HttpServletRequest req, ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		System.out.println("호스트 빌려준공간 진입");
		HttpSession session = req.getSession();
		rb.setUserId(session.getAttribute("accessInfo").toString());
		ArrayList<ReserveBean> list = this.ToHostReserveList(rb);
		String jsonData1 = gson.toJson(list);
		mav.addObject("ToHostReserveList", jsonData1);
		System.out.println(jsonData1);

		mav.setViewName("reqreserveList");
		return mav;
	}

	// 룸선택
	private ArrayList<ReserveBean> ToHostReserveList(ReserveBean rb) {
		return rsMapper.ToHostReserveList(rb);
	}

	// 예약불가일 업데이트
	private boolean updateCalendar(ReserveBean rb) {
		return convertToBoolean(rsMapper.updateCalendar(rb));
	}

	// 예약 생성 완료시 임시예약 삭제 -- 완료
	private boolean DelTemp(ReserveBean rb) {
		return convertToBoolean(rsMapper.delTemp(rb));
	}

	// 예약 취소 Ctl
	private ModelAndView cancelReserveCtl(HttpServletRequest req, ReserveBean rb) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		rb.setUserId(session.getAttribute("accessInfo").toString());

		System.out.println("ctl진입");
		
		System.out.println(rb.getRdcode());
		System.out.println(rb.getRospcode());
		System.out.println(rb.getFrdusedate());
		System.out.println(rb.getRonum());
		if(this.cancelReserve(rb)) {
			System.out.println("불가날짜 딜리트");
			if(this.CancelStatus(rb)) {
				System.out.println("승인거절");
				ArrayList<ReserveBean> list3 = this.ToHostReserveList(rb);
				String jsonData2 = gson.toJson(list3);
				mav.addObject("ToHostReserveList3", jsonData2);
				System.out.println(jsonData2);
				
			}
		}	
		return mav;
	}
	// 불가날짜 딜리트
		private boolean cancelReserve(ReserveBean rb) {
			return convertToBoolean(rsMapper.cancelReserve(rb));
		}
	// 승인거절
	private boolean CancelStatus(ReserveBean rb) {
		return convertToBoolean(rsMapper.CancelStatus(rb));
	}
		

}

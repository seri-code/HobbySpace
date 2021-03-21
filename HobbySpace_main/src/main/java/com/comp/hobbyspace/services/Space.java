package com.comp.hobbyspace.services;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.comp.hobbyspace.beans.AttachFileDTO;
import com.comp.hobbyspace.beans.SpaceBean;
import com.comp.hobbyspace.mapper.SpaceMapper;
import com.google.gson.Gson;
import net.coobird.thumbnailator.Thumbnailator;

@Service
public class Space {
	@Autowired
	private SpaceMapper spMapper;
	@Autowired
	private Gson gson;

	public ModelAndView entrance(SpaceBean sb) {
		ModelAndView mav = null;
		switch (sb.getSCode()) {
		case "ToInputSpace":
			mav = ToInputSpaceCtl();
			break;
		case "SpaceDetail":
			mav = toSpaceDetailCtl(sb);
			break;
		default:
			break;
		}
		return mav;
	}
	
	//이미지 처리 엔트랑스
	public ResponseEntity<List<AttachFileDTO>> entrance(MultipartFile[] uploadFile,String name) {
		return imgCtl(uploadFile, name);
	}
	
	//이미지 Ctl 및 공간코드생성
	private ResponseEntity<List<AttachFileDTO>> imgCtl(MultipartFile[] uploadFile,String name) {
		ResponseEntity<List<AttachFileDTO>> addimg = null;
		if(name.equals("TOP")) {
			String uuid = UUID.randomUUID().toString().replace("-", "").substring(0, 10);
			addimg = addTopimg(uploadFile,uuid);
		}else {
			addimg = addTopimg(uploadFile,name);
		}
		return addimg;
	}
	
	private ResponseEntity<List<AttachFileDTO>> addTopimg(MultipartFile[] uploadFile, String uuid) {
		List<AttachFileDTO> list = new ArrayList<>();
		//서버pc 이미지저장 장소
		String uploadFolder = "C:\\Users\\User\\git\\HobbySpace\\HobbySpace_main\\src\\main\\webapp\\resources\\images";
		File uploadPath = new File(uploadFolder);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();
			System.out.println("only file name : " + uploadFileName);
			String[] name = uploadFileName.split("\\.");
			String spImgName = uuid + "_01." + name[name.length-1];

			System.out.println(spImgName);
			try {
				//File saveFile = new File(uploadPath, spImgName);
				//multipartFile.transferTo(saveFile);
				attachDTO.setFileName(uploadFileName); //공간원본이름
				attachDTO.setSpCode(uuid.toString()); //공간코드
				attachDTO.setSpImgName(spImgName); // 공간이미지이름
				System.out.println(uploadPath); //로컬 공간이미지 경로
				// check image type file

				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, spImgName));

				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 600, 450);

				thumbnail.close();

				// add to list
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
	
	// 공간상세페이지 이동 및 로드
	private ModelAndView toSpaceDetailCtl(SpaceBean sb) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("spaceInfo", gson.toJson(this.loadSpaceDetail(sb)));
		mav.addObject("spCode", gson.toJson(sb.getSpCode()));
		mav.setViewName("spaceDetail");
		return mav;
	}

	private SpaceBean loadSpaceDetail(SpaceBean sb) {
		return spMapper.spaceInfo(sb);
	}
	
	// 공간등록페이지 이동 및 로드
	private ModelAndView ToInputSpaceCtl() { 
		ModelAndView mav = new ModelAndView();
		mav.addObject("spCategory" , gson.toJson(selSpCategory()));
		mav.setViewName("inputSpace");
		return mav;
	}
	private ArrayList<SpaceBean> selSpCategory() {
		return spMapper.selSpCategory();
		
	}
}

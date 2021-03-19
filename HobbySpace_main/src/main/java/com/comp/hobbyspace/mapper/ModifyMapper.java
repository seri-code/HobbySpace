package com.comp.hobbyspace.mapper;

import com.comp.hobbyspace.beans.ModifyBean;

public interface ModifyMapper {

	ModifyBean selUsid(ModifyBean mb);

	int editNickname(ModifyBean mb);

	int editEmail(ModifyBean mb);

	int editMobile(ModifyBean mb);

}

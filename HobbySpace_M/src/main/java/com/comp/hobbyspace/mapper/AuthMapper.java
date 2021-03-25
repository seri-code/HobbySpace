package com.comp.hobbyspace.mapper;

import com.comp.hobbyspace.beans.AuthBean;

public interface AuthMapper {
	
	int isMember(AuthBean ab);
	Integer isAccess(AuthBean ab);
	int insAccess(AuthBean ab);
	AuthBean getUserNickname(AuthBean ab);
	int insUser(AuthBean ab);
	AuthBean selectDigit(AuthBean ab);
	int isUserId(AuthBean ab);
	AuthBean isUserpw(AuthBean ab);
	int delTemp(AuthBean ab);
}

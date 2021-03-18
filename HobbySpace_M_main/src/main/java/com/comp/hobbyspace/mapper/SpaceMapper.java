package com.comp.hobbyspace.mapper;

import java.util.ArrayList;

import com.comp.hobbyspace.beans.SpaceBean;

public interface SpaceMapper {
	SpaceBean spaceInfo(SpaceBean sb);
	ArrayList<SpaceBean> selSpCategory();
}

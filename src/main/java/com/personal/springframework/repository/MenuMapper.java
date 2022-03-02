package com.personal.springframework.repository;

import com.personal.springframework.model.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @program: springframework
 * @description:
 * @author: 安少军
 * @create: 2022-01-10 14:54
 **/
@Mapper
public interface MenuMapper extends BaseMapper<Menu>{
    List<Menu> loadMenuTree();

    int deleteByParent(@Param("parentId") String parentId);
}
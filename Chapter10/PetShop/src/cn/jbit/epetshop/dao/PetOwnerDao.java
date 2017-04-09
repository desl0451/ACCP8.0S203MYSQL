package cn.jbit.epetshop.dao;

import java.util.List;

import cn.jbit.epetshop.entity.PetOwner;

public interface PetOwnerDao {
	/**
	 * 查询所有宠物信息
	 */
	public abstract List<PetOwner> getAllPetOwner();
	
	/**
	 * 登陆
	 */
	
}

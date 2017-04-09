package cn.jbit.epetshop.dao;

import java.util.List;

import cn.jbit.epetshop.entity.PetStore;

public interface PetStoreDao {
	/**
	 * 查询所有商店信息
	 */
	public abstract List<PetStore> getAllPetStore();

}

package cn.jbit.epetshop.dao;

import java.util.List;

import cn.jbit.epetshop.entity.PetStore;

public interface PetStoreDao {
	/**
	 * 查询出所有宠物商店
	 */
	public abstract List<PetStore> getAllStore();

	/**
	 * 根据查询条件查询出宠物商店
	 */
	public abstract PetStore getPetStore(String sql, String[] param);

	/**
	 * 更新宠物商店信息
	 */
	public abstract int updateStore(String sql, Object[] param);

}
package cn.jbit.epetshop.service.impl;

import java.util.List;

import cn.jbit.epetshop.entity.Account;
import cn.jbit.epetshop.entity.Pet;
import cn.jbit.epetshop.entity.PetOwner;
import cn.jbit.epetshop.entity.PetStore;
import cn.jbit.epetshop.service.PetStoreService;
/**
 * 宠物商店实现类
 */
public class PetStoreServiceImpl implements PetStoreService {
	/**
	 * 购买宠物
	 */
	@Override
	public void buy(Pet pet) {
		// TODO Auto-generated method stub

	}
	/**
	 * 卖宠物
	 */
	@Override
	public void sell(Pet pet) {
		// TODO Auto-generated method stub

	}
	/**
	 * 培育宠物
	 */
	@Override
	public Pet breed(String pet) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 查询宠物商店账目
	 */
	@Override
	public List<Account> account(long storeId) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 查询出所有库存宠物
	 */
	@Override
	public List<Pet> getPetsInstock(long storeId) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 查询出所有新培育的宠物
	 */
	@Override
	public List<Pet> getPetsBread() {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 为宠物定价
	 */
	@Override
	public double charge(Pet pet) {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * 根据宠物主人信息修改宠物信息 根据PetOwnerEntity和PetStoreEntity的值判断是宠物主人买宠物或者宠物商店买宠物
	 * PetOwnerEntity=null是宠物商店买宠物，PetStoreEntity=null是宠物主人买宠物
	 */
	@Override
	public int modifyPet(Pet pet, PetOwner petOwner, PetStore store) {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * 修改宠物主人信息 type=0是宠物主人买宠物，type=1是宠物商店买宠物
	 */
	@Override
	public int modifyOwner(PetOwner owner, Pet pet, int type) {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * 根据宠物商店标识符查询宠物商店
	 */
	@Override
	public PetStore getPetStore(long id) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 修改宠物商店信息 type=0是宠物主人买宠物，type=1是宠物商店买宠物
	 */
	@Override
	public int modifyStore(Pet pet, int type) {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * 宠物商店登录
	 */
	@Override
	public PetStore login() {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 查询出所有宠物主人正在出售的宠物
	 */
	@Override
	public List<Pet> getPetSelling() {
		// TODO Auto-generated method stub
		return null;
	}

}

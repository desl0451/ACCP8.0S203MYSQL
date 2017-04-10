package cn.jbit.epetshop.service.impl;

import java.util.List;
import java.util.Scanner;

import cn.jbit.epetshop.dao.PetStoreDao;
import cn.jbit.epetshop.dao.impl.PetStoreDaoImpl;
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
		// TODO 购买宠物

	}

	/**
	 * 卖宠物
	 */
	@Override
	public void sell(Pet pet) {
		// TODO 卖宠物

	}

	/**
	 * 培育宠物
	 */
	@Override
	public Pet breed(String pet) {
		// TODO 培育宠物
		return null;
	}

	/**
	 * 查询宠物商店账目
	 */
	@Override
	public List<Account> account(long storeId) {
		// TODO 查询宠物商店账目
		return null;
	}

	/**
	 * 查询出所有库存宠物
	 */
	@Override
	public List<Pet> getPetsInstock(long storeId) {
		// TODO 查询出所有库存宠物
		return null;
	}

	/**
	 * 查询出所有新培育的宠物
	 */
	@Override
	public List<Pet> getPetsBread() {
		// TODO 查询出所有新培育的宠物
		return null;
	}

	/**
	 * 为宠物定价
	 */
	@Override
	public double charge(Pet pet) {
		// TODO 为宠物定价
		return 0;
	}

	/**
	 * 根据宠物主人信息修改宠物信息 根据PetOwnerEntity和PetStoreEntity的值判断是宠物主人买宠物或者宠物商店买宠物
	 * PetOwnerEntity=null是宠物商店买宠物，PetStoreEntity=null是宠物主人买宠物
	 */
	@Override
	public int modifyPet(Pet pet, PetOwner petOwner, PetStore store) {
		// TODO 根据宠物主人信息修改宠物信息 根据PetOwnerEntity和PetStoreEntity的值判断是宠物主人买宠物或者宠物商店买宠物PetOwnerEntity=null是宠物商店买宠物，PetStoreEntity=null是宠物主人买宠物
		return 0;
	}

	/**
	 * 修改宠物主人信息 type=0是宠物主人买宠物，type=1是宠物商店买宠物
	 */
	@Override
	public int modifyOwner(PetOwner owner, Pet pet, int type) {
		// TODO 修改宠物主人信息 type=0是宠物主人买宠物，type=1是宠物商店买宠物
		return 0;
	}

	/**
	 * 根据宠物商店标识符查询宠物商店
	 */
	@Override
	public PetStore getPetStore(long id) {
		// TODO 根据宠物商店标识符查询宠物商店
		return null;
	}

	/**
	 * 修改宠物商店信息 type=0是宠物主人买宠物，type=1是宠物商店买宠物
	 */
	@Override
	public int modifyStore(Pet pet, int type) {
		// TODO 修改宠物商店信息 type=0是宠物主人买宠物，type=1是宠物商店买宠物
		return 0;
	}

	/**
	 * 宠物商店登录
	 */
	@Override
	public PetStore login() {
		// TODO 宠物商店登录
		Scanner input = new Scanner(System.in);
		PetStore petStore = null;
		// 1、输入宠物商店名字
		boolean type = true;
		while (type) {
			System.out.println("请先登录，请输入宠物商店名字：");
			String storeName = input.nextLine().trim();
			System.out.println("请输入宠物商店的密码：");
			String storePassword = input.nextLine().trim();
			PetStoreDao storeDao = new PetStoreDaoImpl();
			String sql = "select * from petstore where name=? and password=?";
			String[] param = { storeName, storePassword };
			petStore = storeDao.getPetStore(sql, param);
			if (null != petStore) {
				System.out.println("-------恭喜成功登录-------");
				System.out.println("-------宠物商店的基本信息：-------");
				System.out.println("名字：" + petStore.getName());
				System.out.println("元宝数：" + petStore.getBalance());
				type = false;
			} else {
				System.out.println("登录失败，请确认您的用户名和密码是否正确,重新登录");
				type = true;
			}
		}
		return petStore;
	}

	/**
	 * 查询出所有宠物主人正在出售的宠物
	 */
	@Override
	public List<Pet> getPetSelling() {
		// TODO 查询出所有宠物主人正在出售的宠物
		return null;
	}

}

package cn.jbit.epetshop.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import cn.jbit.epetshop.dao.PetDao;
import cn.jbit.epetshop.dao.PetStoreDao;
import cn.jbit.epetshop.dao.impl.AccountDaoImpl;
import cn.jbit.epetshop.dao.impl.PetDaoImpl;
import cn.jbit.epetshop.dao.impl.PetStoreDaoImpl;
import cn.jbit.epetshop.entity.Account;
import cn.jbit.epetshop.entity.Pet;
import cn.jbit.epetshop.entity.PetOwner;
import cn.jbit.epetshop.entity.PetStore;
import cn.jbit.epetshop.service.PetFactory;
import cn.jbit.epetshop.service.PetStoreService;

/**
 * 宠物商店实现类
 */
public class PetStoreServiceImpl implements PetStoreService {
	/**
	 * 1.购买宠物
	 */
	@Override
	public void buy(Pet pet) {
		// TODO 购买宠物

	}

	/**
	 * 2.卖宠物
	 */
	@Override
	public void sell(Pet pet) {
		// TODO 卖宠物

	}

	/**
	 * 3.培育宠物
	 */
	@Override
	public Pet breed(String petType) {
		// TODO 培育宠物
		Scanner input = new Scanner(System.in);
		System.out.println("请在下面输入宠物属性：");
		System.out.println("请输入宠物名字：");
		String petName = input.nextLine();
		System.out.println("请输入宠物健康指数（整数）：");
		String petHealth = input.nextLine();
		System.out.println("请输入宠物爱心指数（整数）：");
		String petLove = input.nextLine();
		System.out.println("请输入宠物所属宠物商店的标识符（整数）：");
		String StoreId = input.nextLine();
		String[] petParam = { petName, petType, petHealth, petLove, StoreId };
		PetFactory petFactory = new PetFactoryImpl();
		Pet pet = petFactory.breedNewPet(petParam);
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
		String petBirthday = simpleDate.format(new Date());
		String sql = "insert into pet(`name`,typeName,health,love,birthday,store_id) values(?,?,?,?,?,?)";
		Object[] param = { pet.getName(), pet.getTypeName(), pet.getHealth(), pet.getLove(), petBirthday,
				pet.getStoreId() };
		PetDao petDao = new PetDaoImpl();
		int count = petDao.updatePet(sql, param);
		if (count > 0) {
			System.out.println("成功创建了一只" + pet.getTypeName() + "宠物");
		}
		return pet;
	}

	/**
	 * 4.查询待售的宠物 查询出所有宠物主人正在出售的宠物
	 */
	@Override
	public List<Pet> getPetSelling() {
		// TODO 查询出所有宠物主人正在出售的宠物
		// 查询owner_id是空的数据
		String sql = "select * from pet where owner_id is not null";
		PetDaoImpl dao = new PetDaoImpl();
		String[] param = null;
		List<Pet> pList = dao.selectPet(sql, param);
		return pList;
	}

	/**
	 * 6.查询宠物商店账目
	 */
	@Override
	public List<Account> account(long storeId) {
		// TODO 查询宠物商店账目
		String sql = "SELECT * FROM `account` WHERE `deal_type`=? AND `seller_id`=? UNION SELECT * FROM `account` WHERE `deal_type`=? AND `buyer_id`=?";
		String[] param = { "1", String.valueOf(storeId), "2", String.valueOf(storeId) };
		AccountDaoImpl dao = new AccountDaoImpl();
		List<Account> alist = dao.getPetStoreAccount(sql, param);
		return alist;
	}

	/**
	 * 查询出所有库存宠物
	 */
	@Override
	public List<Pet> getPetsInstock(long storeId) {
		// TODO 查询出所有库存宠物
		PetDao petDao = new PetDaoImpl();
		String[] param = { String.valueOf(storeId) };
		String sql = "";
		if (storeId != 0) {
			sql = "SELECT * FROM pet WHERE owner_id IS NULL AND store_id =?";
		}
		if (storeId == 0) {
			sql = "SELECT * FROM pet WHERE owner_id IS NULL";
			param = null;
		}
		PetDaoImpl dao = new PetDaoImpl();
		List<Pet> pList = dao.selectPet(sql, param);
		return pList;
	}
	
	public static void main(String[] args) {
		PetStoreServiceImpl dao = new PetStoreServiceImpl();
		List<Pet> petStore = dao.getPetsInstock(2);
		for (Pet pet : petStore) {
			System.out.println(pet.getName());
		}
	}
	/**
	 * 查询出所有新培育的宠物
	 */
	@Override
	public List<Pet> getPetsBreed() {
		// TODO 查询出所有新培育的宠物
		// 先查询数据库中的宠物物种
		String sql = "SELECT * FROM pet WHERE `typeName` NOT IN (?,?)";
		String[] param = { "dog", "penguin" };
		PetDaoImpl dao = new PetDaoImpl();
		List<Pet> pList = dao.selectPet(sql, param);
		return pList;
	}

	/**
	 * 为宠物定价
	 */
	@Override
	public double charge(Pet pet) {
		// TODO 为宠物定价
		Date date = new Date();
		double price = 0;
		int age = date.getYear() - pet.getBirthday().getYear();
		if (age > 5) {
			price = 3;
		} else {
			price = 5;
		}
		return price;
	}

	/**
	 * 根据宠物主人信息修改宠物信息 根据PetOwnerEntity和PetStoreEntity的值判断是宠物主人买宠物或者宠物商店买宠物
	 * PetOwnerEntity=null是宠物商店买宠物，PetStoreEntity=null是宠物主人买宠物
	 */
	@Override
	public int modifyPet(Pet pet, PetOwner petOwner, PetStore store) {
		// TODO 根据宠物主人信息修改宠物信息
		// 根据PetOwnerEntity和PetStoreEntity的值判断是宠物主人买宠物或者宠物商店买宠物PetOwnerEntity=null是宠物商店买宠物，PetStoreEntity=null是宠物主人买宠物
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
		String sql = "SELECT * FROM petStore WHERE id =?";
		String[] param = { String.valueOf(id) };
		PetStoreDaoImpl dao = new PetStoreDaoImpl();
		PetStore petStore = dao.getPetStore(sql, param);
		return petStore;
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

}

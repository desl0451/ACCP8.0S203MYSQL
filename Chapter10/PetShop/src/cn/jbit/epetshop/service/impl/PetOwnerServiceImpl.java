package cn.jbit.epetshop.service.impl;

import java.util.Scanner;

import cn.jbit.epetshop.dao.PetOwnerDao;
import cn.jbit.epetshop.dao.impl.PetOwnerDaoImpl;
import cn.jbit.epetshop.entity.Pet;
import cn.jbit.epetshop.entity.PetOwner;
import cn.jbit.epetshop.service.PetOwnerService;

/**
 * @author 北大青鸟 宠物主人实现类
 */
public class PetOwnerServiceImpl implements PetOwnerService {
	/**
	 * 宠物主人购买库存宠物，根据页面获得到的序号， 来实际调用购买库存宠物或者购买新培育的宠物
	 */
	@Override
	public void buy(Pet pet) {
		//TODO 宠物主人购买库存宠物，根据页面获得到的序号， 来实际调用购买库存宠物或者购买新培育的宠物
	}

	/**
	 * 宠物主人向宠物商店卖出自己宠物
	 */
	@Override
	public void sell(Pet pet) {
		// TODO 宠物主人向宠物商店卖出自己宠物

	}

	/**
	 * 宠物主人登录
	 */
	@Override
	public PetOwner login() {
		// TODO 宠物主人登录
		Scanner input = new Scanner(System.in);
		// 1.输入主人姓名
		System.out.println("请先登录，请您输入主人的名字：");
		String ownerName = input.nextLine().trim();// 去空格
		// 2.输入主人密码
		System.out.println("请您输入主人的密码：");
		String ownerPassword = input.nextLine().trim();
		PetOwnerDao ownerDao = new PetOwnerDaoImpl();
		String sql = "select * from petowner where name=? and password=?";
		String[] param = { ownerName, ownerPassword };
		PetOwner owner = ownerDao.selectOwner(sql, param);
		if (owner != null) {
			System.out.println("-------恭喜您成功登录-------");
			System.out.println("-------您的基本信息：-------");
			System.out.println("名字：" + owner.getName());
			System.out.println("元宝数：" + owner.getMoney());
		}
		return owner;
	}

}

package cn.jbit.epetshop.service.impl;

import cn.jbit.epetshop.entity.Pet;
import cn.jbit.epetshop.service.PetFactory;

/**
 * 宠物工厂实现类
 */
public class PetFactoryImpl implements PetFactory {
	/**
	 * 宠物工程培育新品种宠物
	 */
	@Override
	public Pet breedNewPet(String[] petParam) {
		// TODO 宠物工程培育新品种宠物
		Pet pet = new Pet();// 创建宠物对象
		pet.setName(petParam[0]);
		pet.setTypeName(petParam[1]);
		pet.setHealth(Integer.parseInt(petParam[2]));
		pet.setLove(Integer.parseInt(petParam[3]));
		pet.setStoreId(Integer.parseInt(petParam[4]));
		return pet;
	}

}

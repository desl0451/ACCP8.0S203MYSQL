package cn.jbit.epetshop.test;

import java.util.List;

import cn.jbit.epetshop.dao.impl.PetDaoImpl;
import cn.jbit.epetshop.dao.impl.PetOwnerDaoImpl;
import cn.jbit.epetshop.dao.impl.PetStoreDaoImpl;
import cn.jbit.epetshop.entity.Pet;
import cn.jbit.epetshop.entity.PetOwner;
import cn.jbit.epetshop.entity.PetStore;
/**
 * @author DESL
 */
public class Test {

	public static void main(String[] args) {
		System.out.println("宠物商店启动");
		System.out.println("Wonderland醒来,所有SQLServer中醒来");
		System.out.println("*************************************");
		// TODO 显示宠物名称
		PetDaoImpl dao = new PetDaoImpl();
		List<Pet> pList = dao.getAllPet();
		System.out.println("序号\t宠物名称");
		for (Pet pet : pList) {
			System.out.println(pet.getId() + "\t" + pet.getName());
		}
		System.out.println("所有宠物主人从SQLServer中醒来");
		PetOwnerDaoImpl petowerdao = new PetOwnerDaoImpl();
		List<PetOwner> petOwnerList = petowerdao.getAllOwner();
		System.out.println("*************************************************");
		System.out.println("序号\t主人姓名");
		for (PetOwner petOwner : petOwnerList) {
			System.out.println(petOwner.getId() + "\t" + petOwner.getName());
		}
		System.out.println("所有宠物商店从SQLServer中醒来");
		PetStoreDaoImpl petstoredao = new PetStoreDaoImpl();
		List<PetStore> petStoreList = petstoredao.getAllStore();
		for (PetStore petStore : petStoreList) {
			System.out.println(petStore.getId() + "\t" + petStore.getName());
		}
		System.out.println("---------------------------------------------------");

	}

}
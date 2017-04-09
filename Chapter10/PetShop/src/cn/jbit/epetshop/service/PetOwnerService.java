package cn.jbit.epetshop.service;

import cn.jbit.epetshop.entity.PetOwner;

public interface PetOwnerService extends Buyable, Sellable {
	/**
	 * 宠物主人登录
	 */
	public PetOwner login();
}

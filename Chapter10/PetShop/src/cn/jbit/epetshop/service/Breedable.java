package cn.jbit.epetshop.service;

import cn.jbit.epetshop.entity.Pet;

/**
 * @author 北大青鸟 宠物培育接口
 */
public interface Breedable {
	/**
	 * 宠物繁殖
	 */
	public Pet breed(String pet);
}

package cn.jbit.epetshop.service;

import java.util.List;

import cn.jbit.epetshop.entity.Account;
/**
 * @author 北大青鸟 宠物商店台账接口
 */
public interface Accountable {
	/**
	 * 查询宠物商店台帐信息
	 */
	public List<Account> account(long storeId);
}

package cn.jbit.epetshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.chainsaw.Main;

import cn.jbit.epetshop.dao.AccountDao;
import cn.jbit.epetshop.entity.Account;

public class AccountDaoImpl extends BaseDao implements AccountDao {
	private Connection conn = null; // 保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集

	@Override
	public int updateAccount(String sql, Object[] param) {
		return this.executeUpdate(sql, param);
	}

	@Override
	public List<Account> getPetStoreAccount(String sql, String[] param) {
		List<Account> alist = new ArrayList<Account>();
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setObject(i + 1, param[i]);
				}
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Account account = new Account();
				account.setId(rs.getInt("id"));
				account.setPet_id(rs.getInt("pet_id"));
				account.setPrice(rs.getInt("price"));
				account.setSeller_id(rs.getInt("seller_id"));
				account.setDeal_time(rs.getDate("deal_time"));
				account.setDeal_type(rs.getInt("deal_type"));
				alist.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return alist;
	}

	public static void main(String[] args) {
		AccountDaoImpl dao = new AccountDaoImpl();
		String[] param={"2016-08-20"};
		List<Account> d=dao.getPetStoreAccount("SELECT * FROM account WHERE deal_time=?", param);
		for (Account account : d) {
			System.out.println(account.getDeal_time());
		}
	}
}

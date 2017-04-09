package cn.jbit.epetshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.jbit.epetshop.dao.PetOwnerDao;
import cn.jbit.epetshop.entity.Pet;
import cn.jbit.epetshop.entity.PetOwner;

public class PetOwnerDaoImpl extends BaseDao implements PetOwnerDao {
	private Connection conn = null; // 保存数据库连接

	private PreparedStatement pstmt = null; // 用于执行SQL语句

	private ResultSet rs = null; // 用户保存查询结果集

	/**
	 * 查询所有宠物主人信息
	 */
	@Override
	public List<PetOwner> getAllOwner() {
		List<PetOwner> petOwnerList = new ArrayList<PetOwner>();
		try {
			conn = getConn();
			String sql = "select * from petowner";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PetOwner petOwner = new PetOwner();
				petOwner.setId(rs.getInt("id"));
				petOwner.setMoney(rs.getInt("money"));
				petOwner.setName(rs.getString("name"));
				petOwner.setPassword(rs.getString("password"));
				petOwnerList.add(petOwner);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return petOwnerList;
	}

	/**
	 * 更新宠物主人信息
	 */
	@Override
	public int updateOwner(String sql, String[] param) {
		return this.executeUpdate(sql, param);
	}

	/**
	 * 根据查询条件查询宠物主人信息
	 */
	@Override
	public PetOwner selectOwner(String sql, String[] param) {
		PetOwner petOwner = new PetOwner();
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setObject(i + 1, param[i]);
				}
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				petOwner.setId(rs.getInt("id"));
				petOwner.setMoney(rs.getInt("money"));
				petOwner.setName(rs.getString("name"));
				petOwner.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return petOwner;
	}

	public static void main(String[] args) {
		PetOwnerDaoImpl dao = new PetOwnerDaoImpl();
		String[] param = { "小强", "123456", "498" };
		PetOwner d = dao.selectOwner("SELECT * FROM petowner WHERE `name`=? AND `password`=? AND `money`=?", param);
		System.out.println(d.getName() + "\t" + d.getPassword());
	}
}
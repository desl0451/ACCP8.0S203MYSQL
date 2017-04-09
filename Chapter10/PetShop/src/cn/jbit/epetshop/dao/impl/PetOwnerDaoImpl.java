<<<<<<< HEAD
package cn.jbit.epetshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.jbit.epetshop.dao.PetOwnerDao;
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
		// TODO Auto-generated method stub
		return null;
	}

}
=======
package cn.jbit.epetshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.jbit.epetshop.dao.PetOwnerDao;
import cn.jbit.epetshop.entity.PetOwner;

public class PetOwnerDaoImpl extends BaseDao implements PetOwnerDao {

	@Override
	public List<PetOwner> getAllPetOwner() {
		List<PetOwner> petOwnerList = new ArrayList<PetOwner>();
		Connection conn = getConnection();
		String sql = "select * from petowner";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
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
			this.closeALL(conn, pstmt, rs);
		}
		return petOwnerList;
	}

}
>>>>>>> origin/master

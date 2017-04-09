package cn.jbit.epetshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.jbit.epetshop.dao.PetDao;
import cn.jbit.epetshop.entity.Pet;

public class PetDaoImpl extends BaseDao implements PetDao {
	private Connection conn = null; // 保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集

	/**
	 * 查询所有宠物信息
	 */
	@Override
	public List<Pet> getAllPet() {
		List<Pet> pList = new ArrayList<Pet>();

		try {
			conn = getConn();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from pet";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Pet pet = new Pet();
				pet.setId(rs.getInt("id"));
				pet.setLove(rs.getInt("love"));
				pet.setName(rs.getString("name"));
				pet.setOwner_id(rs.getInt("owner_id"));
				pet.setStore_id(rs.getInt("store_id"));
				pet.setTypename(rs.getString("typename"));
				pet.setBirthday(rs.getDate("birthday"));
				pet.setHealth(rs.getInt("health"));
				pList.add(pet);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return pList;
	}

	/**
	 * 根据已知宠物的信息查询宠物信息
	 */
	@Override
	public List<Pet> selectPet(String sql, String[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 更新宠物信息
	 */
	@Override
	public int updatePet(String sql, Object[] param) {
		// TODO Auto-generated method stub
		return 0;
	}

}

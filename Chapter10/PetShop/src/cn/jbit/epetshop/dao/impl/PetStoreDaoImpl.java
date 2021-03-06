package cn.jbit.epetshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.jbit.epetshop.dao.PetStoreDao;
import cn.jbit.epetshop.entity.PetOwner;
import cn.jbit.epetshop.entity.PetStore;

public class PetStoreDaoImpl extends BaseDao implements PetStoreDao {
	private Connection conn = null; // 保存数据库连接

	private PreparedStatement pstmt = null; // 用于执行SQL语句

	private ResultSet rs = null; // 用户保存查询结果集
	/**
	 * 查询出所有宠物商店
	 */
	@Override
	public List<PetStore> getAllStore() {
		// TODO 查询出所有宠物商店
		List<PetStore> petPetStoreList = new ArrayList<PetStore>();

		try {
			conn = getConn();
			String sql = "select * from PetStore";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PetStore petStore = new PetStore();
				petStore.setId(rs.getInt("id"));
				petStore.setName(rs.getString("name"));
				petStore.setPassword(rs.getString("password"));
				petStore.setBalance(rs.getInt("balance"));
				petPetStoreList.add(petStore);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return petPetStoreList;
	}
	/**
	 * 根据查询条件查询出宠物商店
	 */
	@Override
	public PetStore getPetStore(String sql, String[] param) {
		// TODO 根据查询条件查询出宠物商店
		PetStore petStore = null;
		try {
			conn = this.getConn(); // 得到数据库连接
			pstmt = conn.prepareStatement(sql); // 得到PreparedStatement对象
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setString(i + 1, param[i]); // 为预编译sql设置参数
				}
			}
			rs = pstmt.executeQuery(); // 执行SQL语句
			while (rs.next()) {
				petStore = new PetStore();
				petStore.setId(rs.getInt(1));
				petStore.setName(rs.getString(2));
				petStore.setPassword(rs.getString(3));
				petStore.setBalance(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return petStore;
	}
	/**
	 * 更新宠物商店信息
	 */
	@Override
	public int updateStore(String sql, Object[] param) {
		// TODO 更新宠物商店信息
		return this.executeUpdate(sql, param);
	}
	public static void main(String[] args) {
		PetStoreDaoImpl dao = new PetStoreDaoImpl();
		String[] param = { "北京信息中心", "123456", "624" };
		PetStore d = dao.getPetStore("SELECT * FROM petstore WHERE `name`=? AND `password`=? AND `balance`=?", param);
		System.out.println(d.getName() + "\t" + d.getPassword());
	}
}
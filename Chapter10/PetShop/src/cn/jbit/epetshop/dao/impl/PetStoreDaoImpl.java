package cn.jbit.epetshop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.jbit.epetshop.dao.PetStoreDao;
import cn.jbit.epetshop.entity.PetOwner;
import cn.jbit.epetshop.entity.PetStore;

public class PetStoreDaoImpl extends BaseDao implements PetStoreDao {

	@Override
	public List<PetStore> getAllPetStore() {
		List<PetStore> petPetStoreList = new ArrayList<PetStore>();
		Connection conn = getConnection();
		String sql = "select * from PetStore";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
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
			this.closeALL(conn, pstmt, rs);
		}
		return petPetStoreList;
	}

}

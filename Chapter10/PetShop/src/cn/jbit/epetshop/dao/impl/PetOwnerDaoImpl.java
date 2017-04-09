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

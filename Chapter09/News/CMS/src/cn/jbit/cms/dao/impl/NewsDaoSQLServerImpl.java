package cn.jbit.cms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.jbit.cms.dao.NewsDao;
import cn.jbit.cms.entity.News;

public class NewsDaoSQLServerImpl extends BaseDao implements NewsDao {

	@Override
	public List<News> GetNewsALL() {
		// 创建泛型集合
		List<News> nList = new ArrayList<News>();
		// 获得连接
		Connection conn = getConnection();
		// 创建记录集
		ResultSet rs = null;
		// 创建命令对象
		PreparedStatement pstmt = null;
		// 编写SQL语句
		String sql = "select * from News";
		try {
			// 传入SQL语句
			pstmt = conn.prepareStatement(sql);
			// 执行SQL查询
			rs = pstmt.executeQuery();
			while (rs.next()) {
				News news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setAuthor(rs.getString("author"));
				news.setContent(rs.getString("content"));
				news.setCreateTime(rs.getDate("createtime"));
				nList.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeALL(conn, pstmt, rs);
		}
		return nList;
	}

}

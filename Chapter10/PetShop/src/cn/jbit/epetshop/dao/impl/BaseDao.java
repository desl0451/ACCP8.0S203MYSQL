package cn.jbit.epetshop.dao.impl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class BaseDao {
	public static String DRIVER; // 数据库驱动
	public static String URL; // url
	public static String DBNAME; // 数据库用户名
	public static String DBPASS; // 数据库密码

	Connection conn = null;// 数据连接对象

	/**
	 * 初始化连接参数,从配置文件里获得
	 */
	public static void init() {
		Properties params = new Properties();
		String configFile = "database.properties";// 配置文件路径
		// 加载配置文件到输入流中
		InputStream is = BaseDao.class.getClassLoader().getResourceAsStream(configFile);

		try {
			// 从输入流中读取属性列表
			params.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 根据指定的获取对应的值
		DRIVER = params.getProperty("driver");
		URL = params.getProperty("url");
		DBNAME = params.getProperty("user");
		DBPASS = params.getProperty("password");
	}

	/**
	 * 获得连接
	 * 
	 * @return
	 */
	public Connection getConn() throws ClassNotFoundException, SQLException {
		Connection conn = null;
		try {
			Class.forName(DRIVER); // 注册驱动
			conn = DriverManager.getConnection(URL, DBNAME, DBPASS); // 获得数据库连接
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn; // 返回连接
	}

	/**
	 * 关闭资源
	 * 
	 * @param conn
	 * @param stmt
	 * @param rs
	 */
	public void closeAll(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加,修改,删除
	 * 
	 * @param sql
	 * @param param
	 * @return
	 */
	public int executeUpdate(String sql, Object[] param) {
		int num = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConn(); // 得到数据库连接
			pstmt = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setObject(i + 1, param[i]);
				}
			}
			num = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally {
			this.closeAll(conn, pstmt, null);
		}
		return num;
	}
}
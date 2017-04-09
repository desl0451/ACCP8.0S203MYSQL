package cn.jbit.cms.dao;

import java.util.List;

import cn.jbit.cms.entity.News;

public interface NewsDao {
	// 获得全部新闻
	public List<News> GetNewsALL();
}

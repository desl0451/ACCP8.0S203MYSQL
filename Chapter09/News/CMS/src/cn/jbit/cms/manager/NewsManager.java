package cn.jbit.cms.manager;

import java.util.List;

import cn.jbit.cms.dao.NewsDao;
import cn.jbit.cms.dao.impl.NewsDaoSQLServerImpl;
import cn.jbit.cms.entity.News;
import cn.jbit.cms.util.FileIO;

public class NewsManager {
	public void toHtml() {
		// 1、读取模板文件内容，返回文件内容字符串
		FileIO fileio = new FileIO();
		String templatestr = fileio.readFile("d:\\news.template");
		System.out.println(templatestr);
		// 2、读取数据库表，获取新闻列表
		NewsDao newsDao = new NewsDaoSQLServerImpl();
		List<News> newsList = newsDao.GetNewsALL();

		// 3、替换模板文件，为每一条新闻创建一个HTML文件来显示其信息
		for (int i = 0; i < newsList.size(); i++) {
			// 3.1、获取一条新闻
			News news = newsList.get(i);
			// 3.2、使用该条新闻信息替换对应占位符
			String replacestr = new String();
			replacestr = templatestr;
			replacestr = replacestr.replace("{title}", news.getTitle());
			replacestr = replacestr.replace("{author}", news.getAuthor());

			replacestr = replacestr.replace("{createTime}", news.getCreateTime().toString());
			replacestr = replacestr.replace("{content}", news.getContent());
			// 3.3、为该条新闻生成HTML文件
			String filePath = "c:\\news" + i + ".html";
			fileio.writeFile(filePath, replacestr);
		}
	}
}

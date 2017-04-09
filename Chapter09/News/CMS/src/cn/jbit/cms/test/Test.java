package cn.jbit.cms.test;

import java.util.List;

import cn.jbit.cms.dao.impl.NewsDaoSQLServerImpl;
import cn.jbit.cms.entity.News;
import cn.jbit.cms.manager.NewsManager;

public class Test {

	public static void main(String[] args) {
		NewsManager manager = new NewsManager();
		manager.toHtml();
	}

}

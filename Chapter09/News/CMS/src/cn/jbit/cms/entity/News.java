package cn.jbit.cms.entity;

import java.util.Date;

public class News {
	private int id;
	private String title;
	private String author;
	private Date createTime;
	private String content;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public News(int id, String title, String author, Date createTime, String content) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.createTime = createTime;
		this.content = content;
	}

	public News() {
		super();
		// TODO Auto-generated constructor stub
	}
}

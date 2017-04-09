package cn.jbit.epetshop.entity;

import java.util.Date;

/**
 * 账目实体
 */
public class Account {
	private int id;
	private int deal_type;
	private int pet_id;
	private int seller_id;
	private int price;
	private Date deal_time;

	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Account(int id, int deal_type, int pet_id, int seller_id, int price, Date deal_time) {
		super();
		this.id = id;
		this.deal_type = deal_type;
		this.pet_id = pet_id;
		this.seller_id = seller_id;
		this.price = price;
		this.deal_time = deal_time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeal_type() {
		return deal_type;
	}

	public void setDeal_type(int deal_type) {
		this.deal_type = deal_type;
	}

	public int getPet_id() {
		return pet_id;
	}

	public void setPet_id(int pet_id) {
		this.pet_id = pet_id;
	}

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDeal_time() {
		return deal_time;
	}

	public void setDeal_time(Date deal_time) {
		this.deal_time = deal_time;
	}
}

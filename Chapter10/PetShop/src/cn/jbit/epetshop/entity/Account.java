package cn.jbit.epetshop.entity;

import java.util.Date;

/**
 * 账目实体
 */
public class Account {
	private int id;
	private int dealType;
	private int petId;
	private int sellerId;
	private int price;
	private Date dealTime;

	public Account() {
		super();
	}

	public Account(int id, int dealType, int petId, int sellerId, int price, Date dealTime) {
		super();
		this.id = id;
		this.dealType = dealType;
		this.petId = petId;
		this.sellerId = sellerId;
		this.price = price;
		this.dealTime = dealTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDealType() {
		return dealType;
	}

	public void setDealType(int dealType) {
		this.dealType = dealType;
	}

	public int getPetId() {
		return petId;
	}

	public void setPetId(int petId) {
		this.petId = petId;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDealTime() {
		return dealTime;
	}

	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}

}

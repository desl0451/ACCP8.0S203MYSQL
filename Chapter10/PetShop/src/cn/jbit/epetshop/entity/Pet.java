package cn.jbit.epetshop.entity;

import java.util.Date;

/**
 * 宠物信息实体
 */
public class Pet {
	private int id;
	private String name;
	private String typeName;
	private int health;
	private int love;
	private Date birthday;
	private int ownerId;
	private int storeId;

	public Pet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Pet(int id, String name, String typeName, int health, int love, Date birthday, int ownerId, int storeId) {
		super();
		this.id = id;
		this.name = name;
		this.typeName = typeName;
		this.health = health;
		this.love = love;
		this.birthday = birthday;
		this.ownerId = ownerId;
		this.storeId = storeId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getHealth() {
		return health;
	}

	public void setHealth(int health) {
		this.health = health;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

}

package cn.jbit.epetshop.entity;
/**
 * 宠物商店表
 */
public class PetStore {
	private int id;
	private String name;
	private String password;
	private int balance;

	public PetStore() {
		super();
		// TODO Auto-generated constructor stub
	}

	private PetStore(int id, String name, String password, int balance) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.balance = balance;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
}

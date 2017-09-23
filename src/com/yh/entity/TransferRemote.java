package com.yh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_transfer_remote")
public class TransferRemote {
	private int id;
	private Card fromCard;
	private Bank bank;
	private String tobankid;
	private String toName;

	private String addDate;
	private double money;
	private double poundMoney;
	
	

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "from_card_id")
	public Card getFromCard() {
		return fromCard;
	}

	public void setFromCard(Card fromCard) {
		this.fromCard = fromCard;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bank_id")
	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}

	public String getTobankid() {
		return tobankid;
	}

	public void setTobankid(String tobankid) {
		this.tobankid = tobankid;
	}

	public double getPoundMoney() {
		return poundMoney;
	}

	public void setPoundMoney(double poundMoney) {
		this.poundMoney = poundMoney;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

}

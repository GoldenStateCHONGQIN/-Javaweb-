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
@Table(name = "t_transfer_local")
public class TransferLocal {
	private int id;
	private Card fromCard;
	private Card toCard;

	private String addDate;
	private double money;

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
	@JoinColumn(name = "to_card_id")
	public Card getToCard() {
		return toCard;
	}

	public void setToCard(Card toCard) {
		this.toCard = toCard;
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

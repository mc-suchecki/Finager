package pl.mc.finager.model.fo;

import java.math.BigDecimal;

/**
 * FormObject used to retrieve Account details from web interface.
 * @author mc
 */
public class AccountFO {

	private String name;
	private Integer type;
	private String currency;
	private BigDecimal balance;

	/**
	 * Default constructor.
	 */
	public AccountFO() {
		this.name = "";
		this.type = 1;
		this.currency = "";
		this.balance = new BigDecimal(0);
	}

	/**
	 * Basic constructor.
	 * @param name
	 * @param type
	 * @param currency
	 * @param balance
	 */
	public AccountFO(final String name, final Integer type, final String currency, final BigDecimal balance) {
		this.name = name;
		this.type = type;
		this.currency = currency;
		this.balance = balance;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the type
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * @return the currency
	 */
	public String getCurrency() {
		return currency;
	}

	/**
	 * @param currency the currency to set
	 */
	public void setCurrency(String currency) {
		this.currency = currency;
	}

	/**
	 * @return the balance
	 */
	public BigDecimal getBalance() {
		return balance;
	}

	/**
	 * @param balance the balance to set
	 */
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

}

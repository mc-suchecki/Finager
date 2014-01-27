package pl.mc.finager.model.vo;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Currency;

/**
 * ViewObject used to display Account data in web interface.
 * @author mc
 */
public class AccountVO {

	private long id;
	private String name;
	private String type;
	private Currency currency;
	private BigDecimal balance;

	/**
	 * Default constructor.
	 */
	public AccountVO() {
		this.id = 0;
		this.name = "";
		this.type = "";
		this.currency = Currency.getInstance("EUR");
		this.balance = new BigDecimal(0);
	}

	/**
	 * Basic constructor.
	 * @param id
	 * @param name
	 * @param type
	 * @param currency
	 * @param balance
	 */
	public AccountVO(final long id, final String name, final String type, final String currencyCode, final BigDecimal balance) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.currency = Currency.getInstance(currencyCode);
		this.balance = balance;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
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
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the currency
	 */
	public String getCurrency() {
		return currency.getCurrencyCode();
	}

	/**
	 * @param currency the currency to set
	 */
	public void setCurrency(Currency currency) {
		this.currency = currency;
	}

	/**
	 * @return the balance
	 */
	public String getBalance() {
		return balance.setScale(currency.getDefaultFractionDigits(), RoundingMode.UNNECESSARY).toPlainString();
	}

	/**
	 * @param balance the balance to set
	 */
	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

}

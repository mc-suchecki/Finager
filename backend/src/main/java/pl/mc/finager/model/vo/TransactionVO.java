package pl.mc.finager.model.vo;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Currency;
import java.util.Date;

/**
 * ViewObject used to display Transaction data in web interface.
 * @author mc
 */
public class TransactionVO {

	private long number;
	private String accountName;
	private Date date;
	private BigDecimal value;
	private String currencyCode;
	private String categoryName;
	private String description;

	/**
	 * Basic constructor.
	 */
	public TransactionVO(final long number, final String account, final BigDecimal value,
			final String currency, final Date date, final String category, final String description) {
		this.number = number;
		this.accountName = account;
		this.value = value;
		this.currencyCode = currency;
		this.date = date;
		this.categoryName = category;
		this.description = description;
	}
	
	/**
	 * @return the number
	 */
	public long getNumber() {
		return number;
	}
	/**
	 * @param number the number to set
	 */
	public void setNumber(long number) {
		this.number = number;
	}
	/**
	 * @return the accountName
	 */
	public String getAccountName() {
		return accountName;
	}
	/**
	 * @param accountName the accountName to set
	 */
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	/**
	 * Used in JSP page - formatted with correct fraction digits number.
	 * TODO change name - this is confusing!
	 * @return string representing transaction value
	 */
	public String getValue() {
		return value.setScale(Currency.getInstance(currencyCode).getDefaultFractionDigits(),
				RoundingMode.UNNECESSARY).toPlainString();
	}
	/**
	 * @param value the value to set
	 */
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	/**
	 * @return the currencyCode
	 */
	public String getCurrencyCode() {
		return currencyCode;
	}
	/**
	 * @param currencyCode the currencyCode to set
	 */
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the category
	 */
	public String getCategoryName() {
		return categoryName;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
}

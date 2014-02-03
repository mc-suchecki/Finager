package pl.mc.finager.model.fo;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

/**
 * FormObject used to retrieve Transaction details from web interface.
 * @author mc
 */
public class TransactionFO {

	@NotNull
	private Date date;

	@Min(0)
	@Digits(integer=8, fraction=4)
	private BigDecimal value;

	@NotNull
	private Integer categoryID;

	private Integer accountToID;
	private Integer accountFromID;

	@Length(min=0, max=255)
	private String description;
	
	/** These fields are set by TransactionService. */
	private BigDecimal accountToPreviousBalance;
	private BigDecimal accountFromPreviousBalance;


	/**
	 * Default constructor.
	 */
	public TransactionFO() {
	}

	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * @return the categoryID
	 */
	public Integer getCategoryID() {
		return categoryID;
	}

	/**
	 * @param categoryID the categoryID to set
	 */
	public void setCategoryID(Integer categoryID) {
		this.categoryID = categoryID;
	}

	/**
	 * @return the accountToID
	 */
	public Integer getAccountToID() {
		return accountToID;
	}

	/**
	 * @param accountToID the accountToID to set
	 */
	public void setAccountToID(Integer accountToID) {
		this.accountToID = accountToID;
	}

	/**
	 * @return the accountFromID
	 */
	public Integer getAccountFromID() {
		return accountFromID;
	}

	/**
	 * @param accountFromID the accountFromID to set
	 */
	public void setAccountFromID(Integer accountFromID) {
		this.accountFromID = accountFromID;
	}

	/**
	 * @return the value
	 */
	public BigDecimal getValue() {
		return value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(BigDecimal value) {
		this.value = value;
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
	 * @return the accountToPreviousBalance
	 */
	public BigDecimal getAccountToPreviousBalance() {
		return accountToPreviousBalance;
	}

	/**
	 * @param accountToPreviousBalance the accountToPreviousBalance to set
	 */
	public void setAccountToPreviousBalance(BigDecimal accountToPreviousBalance) {
		this.accountToPreviousBalance = accountToPreviousBalance;
	}

	/**
	 * @return the accountFromPreviousBalance
	 */
	public BigDecimal getAccountFromPreviousBalance() {
		return accountFromPreviousBalance;
	}

	/**
	 * @param accountFromPreviousBalance the accountFromPreviousBalance to set
	 */
	public void setAccountFromPreviousBalance(BigDecimal accountFromPreviousBalance) {
		this.accountFromPreviousBalance = accountFromPreviousBalance;
	}
	
}

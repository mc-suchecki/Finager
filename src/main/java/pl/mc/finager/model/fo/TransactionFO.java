package pl.mc.finager.model.fo;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Length;

/**
 * FormObject used to retrieve Transaction details from web interface.
 * @author mc
 */
public class TransactionFO {

	@Past
	private Date date;

	@NotNull
	private Integer categoryID;

	private Integer accountToID;
	private Integer accountFromID;

	@Digits(integer=8, fraction=4)
	private BigDecimal value;

	@Length(min=0, max=255)
	private String description;

	/**
	 * Default constructor.
	 */
	public TransactionFO() {
		this.date = new Date();
		this.categoryID = null;
		this.accountToID = null;
		this.accountFromID = null;
		this.value = new BigDecimal(0);
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
	
}

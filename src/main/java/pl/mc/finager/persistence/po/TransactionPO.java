package pl.mc.finager.persistence.po;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Class representing Transaction entity from the database.
 * @author mc
 */
@Entity
@Table(name = "transactions")
public class TransactionPO {

	@Id
	@Column(name="transaction_number")
	@GeneratedValue(strategy=GenerationType.AUTO, generator="transaction_seq_gen")
	@SequenceGenerator(name="transaction_seq_gen", sequenceName="transactions_transaction_number_seq", allocationSize=1)
	private long number;
	
	@Column(name="account_id")
  private long accountID;

	@Column(name="category_id")
  private long categoryID;

	@Temporal(TemporalType.DATE)
	@Column(name="transaction_date")
  private Date date;

	@Column(name="value_transferred")
  private BigDecimal valueTransferred;

	@Column(name="account_balance_after")
  private BigDecimal accountBalanceAfter;

	@Column(name="description")
  private String description;

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
	 * @return the accountID
	 */
	public long getAccountID() {
		return accountID;
	}

	/**
	 * @param accountID the accountID to set
	 */
	public void setAccountID(long accountID) {
		this.accountID = accountID;
	}

	/**
	 * @return the categoryID
	 */
	public long getCategoryID() {
		return categoryID;
	}

	/**
	 * @param categoryID the categoryID to set
	 */
	public void setCategoryID(long categoryID) {
		this.categoryID = categoryID;
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
	 * @return the valueTransferred
	 */
	public BigDecimal getValueTransferred() {
		return valueTransferred;
	}

	/**
	 * @param valueTransferred the valueTransferred to set
	 */
	public void setValueTransferred(BigDecimal valueTransferred) {
		this.valueTransferred = valueTransferred;
	}

	/**
	 * @return the accountBalanceAfter
	 */
	public BigDecimal getAccountBalanceAfter() {
		return accountBalanceAfter;
	}

	/**
	 * @param accountBalanceAfter the accountBalanceAfter to set
	 */
	public void setAccountBalanceAfter(BigDecimal accountBalanceAfter) {
		this.accountBalanceAfter = accountBalanceAfter;
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

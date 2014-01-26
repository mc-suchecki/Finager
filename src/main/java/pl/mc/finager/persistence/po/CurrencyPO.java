package pl.mc.finager.persistence.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Class representing Currency entity from the database.
 * @author mc
 */
@Entity
@Table(name = "currencies")
public class CurrencyPO {

	@Id
	@Column(name="iso_code")
	private String isoCode;
	
	@Column(name="digits_after_separator")
	private Integer digitsAfterDecimalSeparator;

	/**
	 * @return the isoCode
	 */
	public String getIsoCode() {
		return isoCode;
	}

	/**
	 * @param isoCode the isoCode to set
	 */
	public void setIsoCode(String isoCode) {
		this.isoCode = isoCode;
	}

	/**
	 * @return the digitsAfterDecimalSeparator
	 */
	public Integer getDigitsAfterDecimalSeparator() {
		return digitsAfterDecimalSeparator;
	}

	/**
	 * @param digitsAfterDecimalSeparator the digitsAfterDecimalSeparator to set
	 */
	public void setDigitsAfterDecimalSeparator(Integer digitsAfterDecimalSeparator) {
		this.digitsAfterDecimalSeparator = digitsAfterDecimalSeparator;
	}
}

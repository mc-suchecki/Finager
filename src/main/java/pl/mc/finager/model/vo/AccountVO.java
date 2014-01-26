package pl.mc.finager.model.vo;

import java.math.BigDecimal;

import pl.mc.finager.model.fo.AccountFO;

/**
 * ViewObject used to display Account data in web interface.
 * @author mc
 */
public class AccountVO extends AccountFO {

	/**
	 * Basic constructor.
	 * @param name
	 * @param type
	 * @param currency
	 * @param balance
	 */
	public AccountVO(final String name, final Integer type, final String currency, final BigDecimal balance) {
		super(name, type, currency, balance);
	}

}

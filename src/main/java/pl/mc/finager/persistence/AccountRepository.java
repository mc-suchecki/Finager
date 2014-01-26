package pl.mc.finager.persistence;

import java.math.BigDecimal;
import java.util.Currency;
import java.util.List;
import java.util.Map;

import pl.mc.finager.model.fo.AccountFO;
import pl.mc.finager.model.vo.AccountVO;

/**
 * Interface representing repositories performing queries associated with Account entities.
 * @author mc
 */
public interface AccountRepository {

	/**
	 * Adds new account to the database.
	 * @param account POJO with new account data
	 * @param userID ID of the user which is adding the account
	 */
	void addNewAccount(AccountFO account, long userID);

	/**
	 * Returns list of all accounts that belong to user with given ID.
	 * @param userID ID of the user who is the owner of the accounts
	 */
	List<AccountVO> getAccountsForUserID(long userID);

	/**
	 * Returns map that maps Currency to total amount of money
	 * that particular user have in that particular currency on his accounts.
	 * @param userID ID of the user who is the owner of the accounts
	 */
	Map<Currency, BigDecimal> getTotalCashForUserID(long userID);
}

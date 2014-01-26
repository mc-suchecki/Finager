package pl.mc.finager.persistence;

import java.util.List;

/**
 * Interface representing repositories performing queries associated with Currency entities.
 * @author mc
 */
public interface CurrencyRepository {

	/**
	 * Downloads all of the Currencies from the database.
	 * @return list containing Currency ISO codes
	 */
	List<String> getAllCurrencies();
}

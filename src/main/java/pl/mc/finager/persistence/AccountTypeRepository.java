package pl.mc.finager.persistence;

import java.util.Map;

/**
 * Interface representing repositories performing queries associated with Account Type entities.
 * @author mc
 */
public interface AccountTypeRepository {

	/**
	 * Downloads all of the Account Types from the database.
	 * @return map containing Account Type ID and its name
	 */
	Map<Integer, String> getAllAccountTypes();
}

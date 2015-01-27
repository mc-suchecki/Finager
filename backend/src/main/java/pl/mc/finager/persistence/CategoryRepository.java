package pl.mc.finager.persistence;

import java.util.Map;

/**
 * Interface representing repositories performing queries associated with Category entities.
 * @author mc
 */
public interface CategoryRepository {

	/**
	 * Downloads all of the Categories from the database.
	 * Categories are formed into two-level tree structure.
	 * @return map containing entries like: (parentName, childrenMap)
	 */
	Map<String, Map<Integer, String>> getAllCategories();
}

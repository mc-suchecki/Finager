package pl.mc.finager.persistence;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import pl.mc.finager.persistence.po.CategoryPO;

/**
 * JPA repository performing queries associated with Category entities.
 * @author mc
 */
@Repository
public class CategoryRepositoryJPA implements CategoryRepository {

	private static final Logger logger = LoggerFactory.getLogger(CategoryRepositoryJPA.class);

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Map<String, Map<Integer, String>> getAllCategories() {
		logger.info("Method getAllCategories invoked");
		Query query = this.em.createQuery("SELECT category FROM CategoryPO category", CategoryPO.class);
		@SuppressWarnings("unchecked")
		List<CategoryPO> categories = query.getResultList();

		// filling the map - assuming that all parents are inserted before their children
		Map<String, Map<Integer, String>> categoriesHierarchyMap = new LinkedHashMap<String, Map<Integer, String>>();
		Map<Integer, String> parentsNamesMap = new LinkedHashMap<Integer, String>();
		for (CategoryPO category : categories) {
			if (category.getParentID() == null) {
				// parent - create new key with empty Map and save parent name for later lookup
				categoriesHierarchyMap.put(category.getName(), new LinkedHashMap<Integer, String>());
				parentsNamesMap.put(category.getID(), category.getName());
			} else {
				// child - acquire parent name and place child data into a correct Map
				String parentName = parentsNamesMap.get(category.getParentID());
				categoriesHierarchyMap.get(parentName).put(category.getID(), category.getName());
			}
		}
		return categoriesHierarchyMap;
	}

}
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

import pl.mc.finager.persistence.po.AccountTypePO;

/**
 * JPA repository performing queries associated with Account Type entities.
 * @author mc
 */
@Repository
public class AccountTypeRepositoryJPA implements AccountTypeRepository {

	private static final Logger logger = LoggerFactory.getLogger(AccountTypeRepositoryJPA.class);

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Map<Integer, String> getAllAccountTypes() {
		logger.info("Method getAllAccountTypes invoked");
		Query query = this.em.createQuery("SELECT accountType FROM AccountTypePO accountType", AccountTypePO.class);
		List<AccountTypePO> accountTypePOs = query.getResultList();
		Map<Integer, String> accountTypes = new LinkedHashMap<Integer, String>();
		for (AccountTypePO type : accountTypePOs) {
			accountTypes.put(type.getID(), type.getName());
		}
		return accountTypes;
	}

}

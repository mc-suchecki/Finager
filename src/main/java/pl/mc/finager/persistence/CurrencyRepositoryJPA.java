package pl.mc.finager.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import pl.mc.finager.persistence.po.CurrencyPO;

/**
 * JPA repository performing queries associated with Account Type entities.
 * @author mc
 */
@Repository
public class CurrencyRepositoryJPA implements CurrencyRepository {

	private static final Logger logger = LoggerFactory.getLogger(CurrencyRepositoryJPA.class);

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<String> getAllCurrencies() {
		logger.info("Method getAllCurrencies invoked");
		Query query = this.em.createQuery("SELECT currency FROM CurrencyPO currency", CurrencyPO.class);
		List<CurrencyPO> currencyPOs = query.getResultList();
		List<String> currencies = new ArrayList<String>();
		for (CurrencyPO currency : currencyPOs) {
			currencies.add(currency.getIsoCode());
		}
		return currencies;
	}

}

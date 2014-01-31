package pl.mc.finager.persistence;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pl.mc.finager.model.fo.TransactionFO;
import pl.mc.finager.model.vo.TransactionVO;

/**
 * JPA repository performing queries associated with Transaction entities.
 * @author mc
 */
@Repository
public class TransactionRepositoryJPA implements TransactionRepository {

	private static final Logger logger = LoggerFactory.getLogger(TransactionRepositoryJPA.class);

	@PersistenceContext
	private EntityManager em;
	
	@Override
	@Transactional
	public void addNewTransaction(final TransactionFO newTransaction, final long userID) {
		logger.info("Method addNewTransaction invoked");
		// TODO Auto-generated method stub
	}

	@Override
	public List<TransactionVO> getTransactionsForUserID(final long userID) {
		logger.info("Method getTransactionsForUserID invoked");
		// TODO Auto-generated method stub
		return null;
	}

}

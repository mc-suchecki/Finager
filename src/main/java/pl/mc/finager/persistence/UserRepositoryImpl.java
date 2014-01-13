package pl.mc.finager.persistence;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/** 
 * TODO - create comments
 * @author mc
 */
@Repository
public class UserRepositoryImpl implements UserRepository {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int id) throws DataAccessException {
		Query query = this.em.createQuery("SELECT user FROM users WHERE user.id = :id");
		query.setParameter("id", id);
		return (User) query.getSingleResult();
	}

}

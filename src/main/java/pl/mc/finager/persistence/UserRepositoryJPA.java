package pl.mc.finager.persistence;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import pl.mc.finager.persistence.po.UserPO;

/** 
 * JPA repository performing queries associated with User entities.
 * @author mc
 */
@Repository
public class UserRepositoryJPA implements UserRepository {

	private static final Logger logger = LoggerFactory.getLogger(UserRepositoryJPA.class);

	@PersistenceContext
	private EntityManager em;

	@Override
	//FIXME UserPO should not be used outside of persistence package!
	public UserPO findByID(int id) throws DataAccessException {
		Query query = this.em.createQuery("SELECT user FROM UserPO user WHERE user.id = :id", UserPO.class);
		query.setParameter("id", id);
		return (UserPO) query.getSingleResult();
	}

	@Override
	//FIXME UserPO should not be used outside of persistence package!
	public UserPO findByEmail(String email) throws DataAccessException {
		logger.info("Method findByEmail invoked");

		Query query = this.em.createQuery("SELECT user FROM UserPO user WHERE user.email = :email", UserPO.class);
		query.setParameter("email", email);
		UserPO user = (UserPO) query.getSingleResult();

		// TODO get Roles assigned to User
		//query = this.em.createQuery("SELECT role FROM roles WHERE role.id_user = :id");
		//query.setParameter("id", user.getID());
		//user.setRoles(query.getResultList());
		return user;
	}

}

package pl.mc.finager.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pl.mc.finager.model.fo.UserFO;
import pl.mc.finager.model.vo.UserVO;
import pl.mc.finager.persistence.po.RolePO;
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
	
	private PasswordEncoder passwordEncoder = new ShaPasswordEncoder(256);

	@Override
	public UserVO findByID(final long id) throws DataAccessException {
		logger.info("Method findByID invoked");
		Query query = this.em.createQuery("SELECT new pl.mc.finager.model.vo.UserVO("
					+ "userPO.email, userPO.passwordHash, userPO.name, userPO.surname)"
					+ " FROM UserPO userPO WHERE UserPO.id = :id", UserVO.class);
		query.setParameter("id", id);
		return (UserVO) query.getSingleResult();
	}

	@Override
	public UserVO findByEmail(final String email) throws DataAccessException {
		logger.info("Method findByEmail invoked");
		Query query = this.em.createQuery("SELECT user FROM UserPO user WHERE user.email = :email", UserPO.class);
		query.setParameter("email", email);
		UserPO userPO = (UserPO) query.getSingleResult();
		UserVO user = new UserVO(userPO.getEmail(), userPO.getPasswordHash(), userPO.getName(), userPO.getSurname());

		// acquiring Roles assigned to User
		query = this.em.createQuery("SELECT role FROM RolePO role WHERE role.userID = :id", RolePO.class);
		query.setParameter("id", userPO.getID());
		List<String> roles = new ArrayList<String>();
		for (Object role : query.getResultList()) {
			roles.add(((RolePO) role).getRole());
		}
		user.setRoles(roles);

		return user;
	}

	@Override
	@Transactional
	public void addNewUser(final UserFO newUser) {
		logger.info("Method addNewUser invoked");
		
		// copying new user data
		UserPO userPO = new UserPO();
		userPO.setName(newUser.getName());
		userPO.setSurname(newUser.getSurname());
		userPO.setEmail(newUser.getEmail());
		userPO.setPasswordHash(passwordEncoder.encodePassword(newUser.getPassword(), newUser.getEmail()));
		em.persist(userPO);
		em.flush();

		// adding default role
		RolePO rolePO = new RolePO();
		rolePO.setUserID(userPO.getID());
		rolePO.setRole("ROLE_USER");
		em.persist(rolePO);
		em.flush();
	}
}

package pl.mc.finager.persistence;

import org.springframework.dao.DataAccessException;

import pl.mc.finager.persistence.po.UserPO;

/** 
 * Interface representing repositories performing queries associated with User entities.
 * @author mc
 */
public interface UserRepository {

	/**
	 * Finds User with the provided ID.
	 * @param id of the User to find
	 * @return null if User was not found
	 * @throws DataAccessException when there is a problem with a connection
	 */
	UserPO findByID(int id) throws DataAccessException;

	/**
	 * Finds User with the provided e-mail address.
	 * @param email of the User to find
	 * @return null if User was not found
	 * @throws DataAccessException when there is a problem with a connection
	 */
	UserPO findByEmail(String email) throws DataAccessException;
}

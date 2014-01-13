package pl.mc.finager.persistence;

import org.springframework.dao.DataAccessException;

/**
 * TODO - create comments
 * @author mc
 */
public interface UserRepository {

    User findById(int id) throws DataAccessException;

}

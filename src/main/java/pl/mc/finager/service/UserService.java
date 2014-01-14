package pl.mc.finager.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pl.mc.finager.persistence.UserRepository;
import pl.mc.finager.persistence.po.UserPO;

/**
 * Service for maintaining actions associated with Users such as login and registration. Implements
 * UserDetailsService interface in order to serve as a authentication provider for Spring Security.
 * @author mc
 */
@Service
public class UserService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Override
	@SuppressWarnings("deprecation")
	public final UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
		// email is used as a username in the application
		UserPO user = userRepository.findByEmail(username);

		if (user == null) {
			throw new UsernameNotFoundException("User with username " + username + "was not found.");
		}

		//TODO get real user roles from database
		Set<GrantedAuthorityImpl> authorities = new HashSet<GrantedAuthorityImpl>();
		authorities.add(new GrantedAuthorityImpl("ROLE_USER"));

		return new User(user.getEmail(), user.getPasswordHash(), true, true, true, true, authorities);
	}

}

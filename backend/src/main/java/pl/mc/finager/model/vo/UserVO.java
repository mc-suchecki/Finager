package pl.mc.finager.model.vo;

import java.util.List;

import pl.mc.finager.model.fo.UserFO;

/**
 * ViewObject used to pass data to Spring Security
 * (as User entity data are not displayed in the interface).
 * @author mc
 */
public class UserVO extends UserFO {

	/** List of Roles assigned to particular User. */
	private List<String> roles;

	/**
	 * Basic constructor.
	 * @param email
	 * @param password
	 * @param name
	 * @param surname
	 */
	public UserVO(final String email, final String password, final String name, final String surname) {
		super(email, password, name, surname);
	}

	/**
	 * Returns list of roles assigned to particular User.
	 * @return the roles
	 */
	public List<String> getRoles() {
		return roles;
	}

	/**
	 * Sets the list of roles assigned to particular User.
	 * @param roles the roles to set
	 */
	public void setRoles(List<String> roles) {
		this.roles = roles;
	}
}

package pl.mc.finager.model.fo;

/**
 * FormObject used to retrieve User details from web interface.
 * @author mc
 */
public class UserFO {

	private String email;
	private String password;
	private String name;
	private String surname;

	/**
	 * Default constructor.
	 * @param email
	 * @param password
	 * @param name
	 * @param surname
	 */
	public UserFO() {
		this.email = "";
		this.password = "";
		this.name = "";
		this.surname = "";
	}
	
	/**
	 * Basic constructor.
	 * @param email
	 * @param password
	 * @param name
	 * @param surname
	 */
	public UserFO(final String email, final String password, final String name, final String surname) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.surname = surname;
	}
	
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the surname
	 */
	public String getSurname() {
		return surname;
	}

	/**
	 * @param surname the surname to set
	 */
	public void setSurname(String surname) {
		this.surname = surname;
	}
}

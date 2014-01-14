package pl.mc.finager.persistence.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Class representing User entity from the database.
 * @author mc
 */
@Entity
@Table(name = "users", uniqueConstraints = { @UniqueConstraint(columnNames = { "e_mail" }) })
public class UserPO {
	@Id
	@GeneratedValue
	@Column(name="id_user")
	private long id;

	@Column(name="e_mail")
	private String email;

	@Column(name="password_hash")
	private String passwordHash;

	@Column(name="name")
	private String name;

	@Column(name="surname")
	private String surname;
	
	//TODO restore this
	//private List<String> roles;

	/**
	 * @return the id
	 */
	public long getID() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setID(long id) {
		this.id = id;
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
	 * @return the passwordHash
	 */
	public String getPasswordHash() {
		return passwordHash;
	}

	/**
	 * @param passwordHash the passwordHash to set
	 */
	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
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

	/**
	 * Returns list of roles assigned to particular User.
	 * @return the roles
	 */
	//public List<String> getRoles() {
		//return roles;
	//}

	/**
	 * Sets the list of roles assigned to particular User.
	 * @param roles the roles to set
	 */
	//public void setRoles(List<String> roles) {
		//this.roles = roles;
	//}
}

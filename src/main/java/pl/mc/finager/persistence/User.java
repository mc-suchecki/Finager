package pl.mc.finager.persistence;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Class representing User entity from the database.
 * @author mc
 */
@Entity
public class User {
	@Id
	@Column(name="id_user", insertable=false, updatable=false)
	protected long id;

	@Column(name="e_mail")
	protected String email;

	@Column(name="name")
	protected String name;

	@Column(name="surname")
	protected String surname;
}

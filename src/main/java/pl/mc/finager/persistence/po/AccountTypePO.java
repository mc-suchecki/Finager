package pl.mc.finager.persistence.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Class representing Account Type entity from the database.
 * @author mc
 */
@Entity
@Table(name = "account_types")
public class AccountTypePO {

	@Id
	@Column(name="account_type_id")
	private Integer id;

	@Column(name="name")
	private String name;

	/**
	 * @return the id
	 */
	public Integer getID() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setID(Integer id) {
		this.id = id;
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
}

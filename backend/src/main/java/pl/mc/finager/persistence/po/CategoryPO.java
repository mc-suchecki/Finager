package pl.mc.finager.persistence.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Class representing Category entity from the database.
 * @author mc
 */
@Entity
@Table(name = "categories")
public class CategoryPO {

	@Id
	@Column(name="category_id")
	private Integer ID;

	@Column(name="name")
	private String name;

	@Column(name="parent_id")
	private Integer parentID;

	/**
	 * @return the ID
	 */
	public Integer getID() {
		return ID;
	}

	/**
	 * @param ID the ID to set
	 */
	public void setID(Integer ID) {
		this.ID = ID;
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
	 * @return the parentID
	 */
	public Integer getParentID() {
		return parentID;
	}

	/**
	 * @param parentID the parentID to set
	 */
	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}
}

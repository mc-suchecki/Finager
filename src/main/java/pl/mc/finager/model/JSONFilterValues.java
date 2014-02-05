package pl.mc.finager.model;

import java.util.Date;

/**
 * TODO
 * @author mc
 */
public class JSONFilterValues {

	private Integer accountFilter;
	private Integer typeFilter;
	private Date startDateFilter;
	private Date endDateFilter;

	/**
	 * @return the accountFilter
	 */
	public Integer getAccountFilter() {
		return accountFilter;
	}
	/**
	 * @param accountFilter the accountFilter to set
	 */
	public void setAccountFilter(Integer accountFilter) {
		this.accountFilter = accountFilter;
	}
	/**
	 * @return the typeFilter
	 */
	public Integer getTypeFilter() {
		return typeFilter;
	}
	/**
	 * @param typeFilter the typeFilter to set
	 */
	public void setTypeFilter(Integer typeFilter) {
		this.typeFilter = typeFilter;
	}
	/**
	 * @return the startDateFilter
	 */
	public Date getStartDateFilter() {
		return startDateFilter;
	}
	/**
	 * @param startDateFilter the startDateFilter to set
	 */
	public void setStartDateFilter(Date startDateFilter) {
		this.startDateFilter = startDateFilter;
	}
	/**
	 * @return the endDateFilter
	 */
	public Date getEndDateFilter() {
		return endDateFilter;
	}
	/**
	 * @param endDateFilter the endDateFilter to set
	 */
	public void setEndDateFilter(Date endDateFilter) {
		this.endDateFilter = endDateFilter;
	}
}

package pl.mc.finager.model;

import java.math.BigDecimal;

/**
 * TODO
 * @author mc
 */
public class JSONChartData {

	private BigDecimal value;
	private String color;
	private String title;
	
	public JSONChartData(final BigDecimal value, final String color, final String title) {
		this.value = value;
		this.color = color;
		this.title = title;
	}

	/**
	 * @return the value
	 */
	public BigDecimal getValue() {
		return value;
	}
	/**
	 * @param value the value to set
	 */
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	/**
	 * @return the color
	 */
	public String getColor() {
		return color;
	}
	/**
	 * @param color the color to set
	 */
	public void setColor(String color) {
		this.color = color;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
}

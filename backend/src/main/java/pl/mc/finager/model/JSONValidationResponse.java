package pl.mc.finager.model;

/** 
 * JSON object used to send information about form validation to 
 * user interface via AJAX response. Processed by jQuery after response.
 * @author mc
 */
public class JSONValidationResponse {

	private Boolean success;
	private Object result;

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}
}

package log;

public class Log {
	private int machine_number;
	private int error_frequency;
	private String error_type;
	private java.sql.Timestamp error_time;
	private String image;
	
	public int getMachine_number() {
		return machine_number;
	}
	public void setMachine_number(int machine_number) {
		this.machine_number = machine_number;
	}
	public int getError_frequency() {
		return error_frequency;
	}
	public void setError_frequency(int error_frequency) {
		this.error_frequency = error_frequency;
	}
	public String getError_type() {
		return error_type;
	}
	public void setError_type(String error_type) {
		this.error_type = error_type;
	}
	public java.sql.Timestamp getError_time() {
		return error_time;
	}
	public void setError_time(java.sql.Timestamp error_time) {
		this.error_time = error_time;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}


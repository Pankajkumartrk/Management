package com.mg.model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;

@Entity
@Table(name ="department")
public class Department {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
 
	private int sno;
	private String name;
	private String file;
	private long mobile;
	private String city; 
	private String address;
	private boolean status;
	
	
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFile() {
		return file;
	}
	public void SetFile(String file) {
		this.file=file;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Department(int sno, String name, String file, long mobile, String city, String address) {
		super();
		this.sno = sno;
		this.name = name;
		this.file = file;
		this.mobile = mobile;
		this.city = city;
		this.address = address;
	}
	@Override
	public String toString() {
		return "Department [sno=" + sno + ", name=" + name + ", file=" + file + ", mobile=" + mobile + ", city=" + city
				+ ", address=" + address + "]";
	}
	public Department() {
		
	}
	
	
	
	
}

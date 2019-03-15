package com.cocovill.order.dto;

public class GiftDto extends ComDto{

	private String gift_id;
	private String sang_name;
	private String sang_option;
	
	public String getGift_id() {
		return gift_id;
	}
	public void setGift_id(String gift_id) {
		this.gift_id = gift_id;
	}
	public String getSang_name() {
		return sang_name;
	}
	public void setSang_name(String sang_name) {
		this.sang_name = sang_name;
	}
	public String getSang_option() {
		return sang_option;
	}
	public void setSang_option(String sang_option) {
		this.sang_option = sang_option;
	}
	
}

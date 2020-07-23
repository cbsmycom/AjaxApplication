package com.cbs.test.user.model.vo;

public class Area {
	
	private int seq;
	private String name;
	
	public Area() {
		super();

	}

	public Area(int seq, String name) {
		super();
		this.seq = seq;
		this.name = name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Area [seq=" + seq + ", name=" + name + "]";
	}
	
	
	
	
	
	

}

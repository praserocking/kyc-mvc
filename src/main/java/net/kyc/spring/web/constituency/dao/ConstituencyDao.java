package net.kyc.spring.web.constituency.dao;

public interface ConstituencyDao {
	public Object retrieveConstituency(String name);
	public Object retrieveConstituencyForSearch(String name);
}

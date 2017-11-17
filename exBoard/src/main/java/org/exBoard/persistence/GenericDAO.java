package org.exBoard.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public abstract class GenericDAO<K,V,C> {
	@Inject
	SqlSession session;
	
	protected static final String namespace = "org.exBoard.persistence";
	
	public abstract List<K> getList(C c);
	public abstract V insert(K k);
	public abstract V delete(V no);
	public abstract V update(K k);
	public abstract V getTotal();
	public abstract K getObject(V v);
	public abstract V getPrimary(K k);
}

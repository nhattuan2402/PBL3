package database;

import java.util.ArrayList;

public interface DAOInterface<T> {
	public ArrayList<T> selectAll();
	
	public T selectByID(T t);
	
	public void Add(T t);
	
	public void Update(T t);
	
	public void Delete(T t); 
}

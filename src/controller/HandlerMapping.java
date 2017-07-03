package controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping 
{
	private Map<String, Controller> mappings;

	public HandlerMapping(String configName) 
	{
		mappings = new HashMap<>();
		
		Properties properties = new Properties();
		
		try 
		{
			InputStream is = new FileInputStream(configName);
			
			properties.load(is);
			
			Set<Object> keys = properties.keySet();
			
			for(Object key : keys)
			{
				String className = properties.getProperty(key.toString());
				
				Class<?> controllerClass = Class.forName(className);
				
				mappings.put(key.toString(), (Controller)controllerClass.newInstance());
			}
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
				
	}
	
	public Controller getController(String uri) 
	{
		return mappings.get(uri);
	}
}

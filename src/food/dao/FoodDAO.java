package food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import food.vo.FoodVO;
import util.ConnectionFactory;

public class FoodDAO 
{
	public List<FoodVO> getFoodList(String fId) 
	{
		String sql = "select * from food "
				+ "where f_id=? ";
		
		List<FoodVO> foodList = new ArrayList<>();
				
		try (
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setString(1, fId);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				FoodVO vo = new FoodVO(
						rs.getString("f_name"), 
						rs.getString("f_id")
						);
				
				foodList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return foodList;
	}

}

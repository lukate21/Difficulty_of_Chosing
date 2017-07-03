package bistro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bistro.vo.BistroVO;
import util.ConnectionFactory;

public class BistroDAO 
{
	public List<BistroVO> getBistroList(String fName) 
	{
		String sql = "select * from bistro "
				+ "where f_name=? ";
		
		List<BistroVO> bistroList = new ArrayList<>();
				
		try (
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setString(1, fName);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BistroVO vo = new BistroVO();
				vo.setbName(rs.getString("b_name"));
				vo.setfName(rs.getString("f_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setAddr(rs.getString("addr"));
				vo.setTel(rs.getString("tel"));
				vo.settScore(rs.getInt("t_score"));
				vo.setReviewCnt(rs.getInt("review_cnt"));
				
				bistroList.add(vo);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bistroList;
	}

	public BistroVO getBistroDetail(String bName) 
	{
		String sql = "select * from bistro "
				+ "where b_name=? ";
		
		BistroVO vo = null;
				
		try (
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setString(1, bName);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				vo = new BistroVO();
				vo.setbName(rs.getString("b_name"));
				vo.setfName(rs.getString("f_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setAddr(rs.getString("addr"));
				vo.setTel(rs.getString("tel"));
				vo.settScore(rs.getInt("t_score"));
				vo.setReviewCnt(rs.getInt("review_cnt"));
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return vo;
	}

	public int setAverageScore(String bName, double score) 
	{
		String sql = "update bistro set t_score=t_score+?, review_cnt=review_cnt+1 "
				+ "where b_name=? ";
		
		int result = 0;
				
		try (
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setDouble(1, score);
			pstmt.setString(2, bName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return result;		
	}
	public int setMinusScore(String bName, double score) 
	{
		String sql = "update bistro set t_score=t_score-?, review_cnt=review_cnt-1 "
				+ "where b_name=? ";
		
		int result = 0;
				
		try (
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setDouble(1, score);
			pstmt.setString(2, bName);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return result;		
	}
	
	
}

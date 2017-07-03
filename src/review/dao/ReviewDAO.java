package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import review.vo.ReviewVO;
import util.ConnectionFactory;

public class ReviewDAO 
{
	/*sql.append("select * ");
	sql.append("from (select rownum r, no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
	sql.append("from (select * from t_board order by no desc) ");
	sql.append("where rownum<=?) t ");
	sql.append("where t.r>?");*/
	
	public List<ReviewVO> getReviewList(String bName, int pageNo) 
	{
		//System.out.println(bName);
		/*String sql = "select * from review "
				+ "where b_name=? ";*/
		int reviewPerPage = 10;
		
		String sql = "select * "
				+ "from (select rownum r, b_name, m_id, content, score, reg_date, no "
				+ "from (select * from review where b_name=? order by reg_date desc) "
				+ "where rownum<=?) t "
				+ "where t.r>?";
		
		/*
		String sql="select * from(select rownum rnum, b_name, m_id, content, score, reg_date"
				+ " from review where b_name=? order by reg_date desc )"
				+ " where rnum between ? and ?";*/
		
		
		List<ReviewVO> reviewList = new ArrayList<>();
				
		try (
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setString(1, bName);
			pstmt.setInt(2, reviewPerPage * pageNo);
			pstmt.setInt(3, reviewPerPage * (pageNo - 1));
		/*	pstmt.setInt(2, (reviewPerPage * pageNo - 9));
			pstmt.setInt(3, reviewPerPage * pageNo);*/
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ReviewVO vo = new ReviewVO(
						rs.getString("b_name"), 
						rs.getString("m_id"), 
						rs.getString("content"), 
						rs.getDouble("score"), 
						rs.getString("reg_date"),
						rs.getInt("no")
						);
								
				reviewList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reviewList;
	}

	public int reviewMake(ReviewVO vo) 
	{
		String sql = "insert into review (b_name, m_id, content, score, no) "
				+ "values (?, ?, ?, ?,review_seq_no.nextval)";
		
		int result = 0;
				
		try (
				Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setString(1, vo.getbName());
			pstmt.setString(2, vo.getmId());
			pstmt.setString(3, vo.getContent());
			pstmt.setDouble(4, vo.getScore());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
	public void reviewDelete(int no, String email){
		String sql = "delete from review where no=? and M_id=?";
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);	
		){
			pstmt.setInt(1, no);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}

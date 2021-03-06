package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {
	
	/**
	 * 전체 회원 조회 메소드
	 */
	public List<MemberVO> selectAll() {
		List<MemberVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select ID, NAME, TYPE, to_char(REG_DATE, 'yyyy-mm-dd') reg_date");
		sql.append("	from t_member");
		sql.append(" order by reg_date desc");
		
		try( 
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
					String id = rs.getString("id");
					String name = rs.getString("name");
					String type = rs.getString("type");
					String regDate = rs.getString("reg_date");
					
					MemberVO member = new MemberVO(id, name, type, regDate);
					
					list.add(member);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * id에 따른 회원 상세 정보 조회 메소드
	 */
	public MemberVO selectById(String id) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from t_member");
		sql.append(" where id = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) { 
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String memberId = rs.getString("id");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String email = rs.getString("email_id") + "@" + rs.getString("email_domain");
				String tel = rs.getString("tel1") + "-" + rs.getString("tel2")  + "-" +  rs.getString("tel3");
				String post = rs.getString("post");
				String addr = rs.getString("basic_addr") + " " + rs.getString("detail_addr");
				String type = rs.getString("type");
				String regDate = rs.getString("reg_date");
			
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");
				Date date = simpleDateFormat.parse(regDate);
				regDate = simpleDateFormat.format(date);

				MemberVO member = new MemberVO(memberId, name, password, email, tel, post, addr, type, regDate);
				
				return member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 회원가입을 위한 메소드
	 */
	public void insertMember(MemberVO member) {
		
		String[] emailArr = member.getEmail().split("@");
		String[] telArr = member.getTel().split("-");
		String[] addArr = member.getAddr().split(",");
		String type = null;
		if(member.getType().equals("일반계정")) {
			type = "U";
		} else {
			type = "S";
		}
		
		
		StringBuilder sql = new StringBuilder();
		sql.append("insert into T_MEMBER(ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR, TYPE) ");
		sql.append("values(?, ?, ?, ?, ?, ?, ?, ? ,? ,? ,?, ?)");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, emailArr[0]);
			pstmt.setString(5, emailArr[1]);
			pstmt.setString(6, telArr[0]);
			pstmt.setString(7, telArr[1]);
			pstmt.setString(8, telArr[2]);
			pstmt.setString(9, member.getPost());
			pstmt.setString(10, addArr[0]);
			pstmt.setString(11, addArr[1]);
			pstmt.setString(12, type);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}

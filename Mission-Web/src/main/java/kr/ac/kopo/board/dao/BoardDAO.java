package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.util.JDBCClose;

/**
 * t_board 테이블의 CRUD 담당 클래스
 */
public class BoardDAO {
	
	/**
	 * no에 해당 게시물 조회 메소드
	 */
	public BoardVO selectByNo(int no) {
		
		StringBuilder sql = new StringBuilder();	// final 클래스이기 때문에 자식 클래스를 못 만든다.
		sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') reg_date");
		sql.append(" from t_board");
		sql.append(" where no = ? ");
		
		// jdk 7, 1.7 때 추가된 새로운 try-catch 문
		try(
				// try 문에서 만들 수 있는 객체는 try 구문을 빠져나가면, 자동으로 close를 호출한다.(finally에 close 안써도 알아서 close 해줌) 
				// 그래서 여기서 만들 수 있는 객체는 AutoCloseable이라고 하는 클래스를 상속받은 클래스만 사용 가능
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, no);
			
			ResultSet rs = pstmt.executeQuery();
			
			// 최소 0개, 최대 1개
			if(rs.next()) {
				
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(boardNo, title, writer, content, viewCnt, regDate);
				
				return board;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 *	전체게시글 조회 메소드 
	 */
	public List<BoardVO> selectAll() {
		// 하나의 레코드를 가져오는 형태가 VO
		
		List<BoardVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') reg_date");
			sql.append("	from t_board");
			sql.append("	order by no desc ");
			
			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			/* rs가 가리키고 있는 데이터가 있으면 true, 없으면 false */
			while(rs.next()) {
				int no = rs.getInt("no");
				String title   = rs.getString("title");
				String writer  = rs.getString("writer");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setRegDate(regDate);
				
				//System.out.println(board);
				list.add(board);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
		// 출력은 list.jsp가 한다. 넘겨주는 단위가 boardVO 단위
		 return list;
	}
	
	/**
	 * 새글등록
	 */
	public void insertBoard(BoardVO board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = new ConnectionFactory().getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("insert into t_board(no, title, writer, content) ");
			sql.append(" values(seq_t_board_no.nextval, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}
	

	/*
	 public static void main(String[] args) { BoardDAO dao = new BoardDAO();
	 dao.selectAll(); }
	 */
}



















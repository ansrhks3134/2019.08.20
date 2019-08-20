package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	private DAO() {}
	private static DAO instance = new DAO();
	public static DAO getInstance() {
		return instance;
	}
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		return con;
	}
	
	public int insert(DTO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into member_tbl_02 values(?,?,?,?,?,?)";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getJoindate());			
			pstmt.setString(6, vo.getGrade());
			pstmt.setString(7, vo.getCity());			
			row = pstmt.executeUpdate(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	
	public List<DTO> list(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<DTO> list = new ArrayList<DTO>();
		DTO vo = null;
		String sql = "select * from member_tbl_02";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);		
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new DTO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getString("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public DTO search(int custno){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DTO vo = null;
		String sql = "select * from member_tbl_02 wehre="+custno;
		System.out.println(custno);
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);				
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new DTO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getString("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int edit(DTO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(7, vo.getCustno());
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getJoindate());			
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());			
			row = pstmt.executeUpdate(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	
}

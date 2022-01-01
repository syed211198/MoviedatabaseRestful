package Model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;

public class FilmDAO {

	Film oneFilm = null;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs1 = null;
	PreparedStatement ps = null;
	String database = "films";
	String user = "amjads";
	String password = "wrequinF9";
	// Note none default port used, 6306 not 3306
	String url = "jdbc:mysql://mudfoot.doc.stu.mmu.ac.uk:6306/" + user;

	public FilmDAO() {
	}

	private void openConnection() {
		// loading jdbc driver for mysql
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			System.out.println(e);
		}

		// connecting to database
		try {
			// connection string for demos database, username demos, password demos
			conn = DriverManager
					.getConnection("jdbc:mysql://mudfoot.doc.stu.mmu.ac.uk:6306/amjads?user=amjads&password=wrequinF9");
			stmt = conn.createStatement();
		} catch (SQLException se) {
			System.out.println(se);
		}
	}

	private void closeConnection() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private Film getNextFilm(ResultSet rs) {
		Film thisFilm = null;
		try {
			thisFilm = new Film(rs.getInt("id"), rs.getString("title"), rs.getInt("year"), rs.getString("director"),
					rs.getString("stars"), rs.getString("review"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return thisFilm;
	}

	public ArrayList<Film> getAllFilms() {

		ArrayList<Film> allFilms = new ArrayList<Film>();
		String selectSQL = "SELECT * FROM films LIMIT 10 ";
		openConnection();

		// Create select statement and execute it
		try {
			ResultSet rs1 = stmt.executeQuery(selectSQL);
			// Retrieve the results
			while (rs1.next()) {
				oneFilm = getNextFilm(rs1);
				allFilms.add(oneFilm);
			}

			stmt.close();
			closeConnection();
		} catch (SQLException se) {
			System.out.println(se);
		}

		return allFilms;
	}

	public Film getFilmByID(int id) {
		
		//ArrayList <Film> allFilms = new ArrayList<Film>();
		String selectSQL = "SELECT * FROM films WHERE id = ?;";
		openConnection();
		// Create select statement and execute it
		try {
			ps = conn.prepareStatement(selectSQL);
			ps.setInt(1, id);
			rs1= ps.executeQuery();
			System.out.println("GET film by ID " + selectSQL);
			// Retrieve the results
			while (rs1.next()) {
				oneFilm = getNextFilm(rs1);
			}

			ps.close();
			closeConnection();
		} catch (SQLException se) {
			//System.out.println("Get a Film by ID (toString): " + allFilms.toString());
			System.out.println(se);
		}

		return oneFilm;
	}

	public ArrayList<Film> searchFilms(String searchBy, String userinput){
		   
		ArrayList<Film> allFilms = new ArrayList<Film>();
		
		String searchSQL = " ";
		
		int criteriaInt = 0;
		
		String criteriaStr = "";
		
		openConnection();
		
	    // Create select statement and execute it
		try{
			
			if(searchBy.equals("id") || searchBy.equals("year")) {
				
				criteriaInt = Integer.parseInt(userinput);
				
				searchSQL = "SELECT * FROM films WHERE " +searchBy +" = ?;";
				
				ps = conn.prepareStatement(searchSQL);
			    
				ps.setInt(1, criteriaInt);
			    
			    
			    rs1 = ps.executeQuery();
				
				
			}else {
				
				criteriaStr = userinput;
				
				searchSQL = "SELECT * FROM films WHERE " +searchBy + " like ? ;";
				
				ps = conn.prepareStatement(searchSQL);
			    
				ps.setString(1, "%"+criteriaStr+"%");
			    
			    rs1 = ps.executeQuery();
				
			}
			
			System.out.println("Search Query: " + searchSQL);
		    
		    while(rs1.next()){
		    	
		    	oneFilm = getNextFilm(rs1);
		    	
		    	allFilms.add(oneFilm);
		   
		    }

		    ps.close();
		    
		    closeConnection();
		
		} catch(SQLException se) { System.out.println(se); }
		
		System.out.println("Search Query (toString): " + allFilms.toString());

		return allFilms;
	   
   }

	public boolean insertFilm(Film film) {
		String insertSql =  "INSERT INTO films (title, year, director, stars, review)"
					+ "VALUES (?, ?, ?, ?, ?);";
		
		openConnection();
		try {
			ps = conn.prepareStatement(insertSql);
			ps.setString(1, film.getTitle());
			ps.setInt(2, film.getYear());
			ps.setString(3, film.getDirector());
			ps.setString(4, film.getStars());
			ps.setString(5, film.getReview());
			ps.executeUpdate();

			System.out.println("Inserting film:" + insertSql);
			closeConnection();
			ps.close();
			return true;

		} catch (SQLException se) {
			System.out.println(se);
		}
		return false;

	}

	public boolean deleteFilm(int id) {

		String deleteSQL = "DELETE FROM films WHERE id = ? ;";
		openConnection();
		try {
			ps = conn.prepareStatement(deleteSQL);
			ps.setInt(1, id);
			ps.executeUpdate();
			
			System.out.println("Deleting film:" + deleteSQL);
			ps.close();
			closeConnection();
			return true;

		} catch (SQLException se) {
			System.out.println(se);
		}

		return false;
	}

	public boolean UpdateFilm(Film film) {

		String updateSQL = "UPDATE films SET title = ?, year = ?, director = ?, stars = ?, review = ? WHERE id = ?;";

		openConnection();

		try {
			ps = conn.prepareStatement(updateSQL);
			ps.setString(1, film.getTitle());
			ps.setInt(2, film.getYear());
			ps.setString(3, film.getDirector());
			ps.setString(4, film.getStars());
			ps.setString(5, film.getReview());
			ps.setInt(6, film.getId());
			ps.executeUpdate();

			System.out.println("Updating  film:" + updateSQL);
			closeConnection();
			ps.close();
			return true;

		} catch (SQLException se) {
			System.out.println(se);
		}
		return false;

	}
}

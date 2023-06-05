package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.user;

public class GestionUsers {
	
  static	Connection connection = SingletonConnection.getConnection();

  

    // Method to add a new user to the database
    public void addUser(user user) throws SQLException {
        String query = "INSERT INTO users (name, password) VALUES (?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, user.getName());
        statement.setString(2, user.getPassword());
        statement.executeUpdate();
    }

    // Method to retrieve user information from the database based on the username
    public user getUser(String username) throws SQLException {
        String query = "SELECT name, password FROM users WHERE name = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, username);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            user user = new user();
            user.setName(resultSet.getString("name"));
            user.setPassword(resultSet.getString("password"));
            return user;
        }

        return null; // User not found
    }
}

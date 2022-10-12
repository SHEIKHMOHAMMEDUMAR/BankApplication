package com.test;

import org.junit.jupiter.api.*;

import com.login.LoginDao;
import com.signup.User;

import static org.junit.Assert.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDaoTest {
    User obj1 = new User();
    User obj2 = new User();
    LoginDao ld = new LoginDao();
    @BeforeAll
    public static void beforeAll(){
        System.out.println("Before all the test cases");
    }
    @AfterAll
    public static void afterAll(){
        System.out.println("After all the test cases");
    }
    @BeforeEach
    public void setUp() throws SQLException{
        obj1.setUserName("Umar");
        obj1.setPassword("7829646279uU*");
        obj2.setUserName("Rohit");
        obj2.setPassword("7829646279uU#");
    }
    @AfterEach
    public void setDown(){
        obj1 = null;
        obj2 = null;
    }
    @Test
    public void testLogin1() throws SQLException{
    	ResultSet rs1 = ld.logindao(obj1.getUserName());
    	assertEquals(true, rs1.next());
    }
    @Test
    public void testLogin2() throws SQLException{
    	ResultSet rs2 = ld.logindao(obj2.getUserName());
    	assertEquals(false, rs2.next());
    	}
    @Test
    public void testLogin3() throws SQLException{
    	ResultSet rs1 = ld.logindao(obj1.getUserName());
    	rs1.next();
    	assertNotEquals(rs1.getString(2),obj1.getPassword());
    }
    @Test
    public void testLogin4() throws SQLException{
    	ResultSet rs1 = ld.logindao(obj1.getUserName());
    	rs1.next();
    	assertEquals(rs1.getString(2),obj2.getPassword());
    }
}

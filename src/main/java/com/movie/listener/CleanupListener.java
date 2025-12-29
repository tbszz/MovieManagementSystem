package com.movie.listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

@WebListener
public class CleanupListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // No initialization needed
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Deregister JDBC drivers
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                System.out.println("Deregistering JDBC driver: " + driver);
            } catch (SQLException e) {
                System.err.println("Error deregistering JDBC driver: " + driver);
                e.printStackTrace();
            }
        }

        // Stop MySQL AbandonedConnectionCleanupThread
        try {
            AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("MySQL AbandonedConnectionCleanupThread stopped.");
        } catch (Exception e) {
            System.err.println("Error stopping MySQL AbandonedConnectionCleanupThread");
            e.printStackTrace();
        }
    }
}

package com.testyourself.db.daos;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class ConnectionPool {
	private static final Logger LOG = Logger.getLogger(ConnectionPool.class);
	
	private ConnectionPool(){
	}

	/**
	 * Establish connection with Database
	 *
	 * @return Connection with Database
	 */
	public static synchronized Connection getConnection() {
		LOG.trace("Starting tracing ConnectionPool#getConnection");
		try {
			Context initCtx = new InitialContext();
			Context envContext = (Context) initCtx.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/testingsysdb");
			LOG.trace("Connection is successful");
			return ds.getConnection();
		} catch (NamingException e) {
			LOG.error("Cannot find the data source: " + e);
			return null;
		} catch (SQLException e) {
			LOG.error("Cannot get connection from data source: " + e);
			return null;
		}
	}
}

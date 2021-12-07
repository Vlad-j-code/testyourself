package com.testyourself.db.daos;

import com.testyourself.db.daos.interfaces.IAnswerDAO;
import com.testyourself.db.daos.interfaces.IQuestionDAO;
import com.testyourself.db.daos.interfaces.IRoleDAO;
import com.testyourself.db.daos.interfaces.ISubjectDAO;
import com.testyourself.db.daos.interfaces.ITestDAO;
import com.testyourself.db.daos.interfaces.IUserDAO;

public class DAOFactory {
	public static IUserDAO getUserDAO() {
		return new UserDAO();
	}

	public static IRoleDAO getRoleDAO() {
		return new RoleDAO();
	}

	public static ISubjectDAO getSubjectDAO() {
		return new SubjectDAO();
	}

	public static ITestDAO getTestDAO() {
		return new TestDAO();
	}

	public static IQuestionDAO getQuestionDAO() {
		return new QuestionDAO();
	}

	public static IAnswerDAO getAnswerDAO() {
		return new AnswerDAO();
	}
}

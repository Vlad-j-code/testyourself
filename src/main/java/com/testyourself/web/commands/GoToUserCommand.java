package com.testyourself.web.commands;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.testyourself.Path;
import com.testyourself.db.beans.UserTestBean;
import com.testyourself.db.daos.DAOFactory;

@WebServlet(name = "GoToUserCommand")
public class GoToUserCommand extends Command {
	private static final long serialVersionUID = 225662790855890525L;
	public static final Logger LOG = Logger.getLogger(GoToUserCommand.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		LOG.trace("Start tracing GoToUserCommand");
		HttpSession session = request.getSession();
		Long userId = Long.parseLong(String.valueOf(session.getAttribute("userId")));
		List<UserTestBean> userPassedTests = DAOFactory.getTestDAO().findUserPassedTest(userId);
		request.setAttribute("passedTests", userPassedTests);
		return Path.PAGE_PAGE_USER;
	}

}

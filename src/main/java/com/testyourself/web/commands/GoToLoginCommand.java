package com.testyourself.web.commands;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.testyourself.Path;

public class GoToLoginCommand extends Command {
	public static final Logger LOG = Logger.getLogger(GoToLoginCommand.class);
	private static final long serialVersionUID = -5928728771131932205L;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		LOG.trace("Start tracing GoToLoginCommand");
		HttpSession session = request.getSession();
		
		if (session.getAttribute("username") != null) {
			return Path.PAGE_PAGE_USER;
		}
		return Path.PAGE_LOGIN;
	}
}

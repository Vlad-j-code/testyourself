package com.testyourself.web.commands;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testyourself.Path;
import com.testyourself.exceptions.Error;

@WebServlet(name = "ChangeLanguage")
public class LanguageCommand extends Command {
	private static final long serialVersionUID = -5909358727524765032L;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		List<String> languages = Arrays.asList("en", "uk");
		String language = request.getParameter("language");
		boolean existLanguage = false;
		for (String lang : languages) {
			if (language.equals(lang)) {
				existLanguage = true;
			}
		}
		if (!existLanguage) {
			request.setAttribute("errorMessage", Error.ERR_INVALID_VALUE_LANGUAGE);
			return Path.PAGE_ERROR_PAGE;
		} else {
			session.setAttribute("language", language);
		}
		return request.getContextPath();
	}

}

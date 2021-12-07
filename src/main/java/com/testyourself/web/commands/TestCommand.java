package com.testyourself.web.commands;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.testyourself.Path;
import com.testyourself.db.beans.UserTestBean;
import com.testyourself.db.daos.DAOFactory;
import com.testyourself.db.dtos.Test;

public class TestCommand extends Command {
    private static final long serialVersionUID = 2543835073488685718L;
    public static final Logger LOG = Logger.getLogger(TestCommand.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        LOG.trace("Starting trace TestCommand");
        HttpSession session = request.getSession();
        Long userId = Long.parseLong(String.valueOf(session.getAttribute("userId")));
        String sort = String.valueOf(request.getParameter("sort"));
        Long subjectId = Long.parseLong(String.valueOf(request.getParameter("subjectId")));
        List<UserTestBean> userTests = null;
        List<Test> allTests = null;

        switch (sort) {
            case "name":
                allTests = DAOFactory.getTestDAO().findUsersTestBySubject(userId, subjectId).stream()
                        .sorted(Comparator.comparing(Test::getName))
                        .collect(Collectors.toList());
                break;
            case "level":
                allTests = DAOFactory.getTestDAO().findUsersTestBySubject(userId, subjectId).stream()
                        .sorted(Comparator.comparingLong(Test::getLevel))
                        .collect(Collectors.toList());
                break;
            case "popularity":
                allTests = DAOFactory.getTestDAO().findUsersTestBySubject(userId, subjectId).stream()
                        .sorted(Comparator.comparingLong(Test::getPopularity).reversed())
                        .collect(Collectors.toList());
                break;
            default:
                allTests = DAOFactory.getTestDAO().findUsersTestBySubject(userId, subjectId);
                break;
        }

        if (userTests != null) {
            session.setAttribute("tests", userTests);
        } else if (allTests != null) {
            session.setAttribute("tests", allTests);
        }
        session.setAttribute("subjectId", subjectId);
        return Path.PAGE_TEST;
    }

}

package com.testyourself.web.commands;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.testyourself.Path;
import com.testyourself.db.daos.DAOFactory;
import com.testyourself.db.dtos.Answer;
import com.testyourself.db.dtos.Question;
import com.testyourself.exceptions.Error;

public class UpdateAnswerCommand extends Command {
	private static final long serialVersionUID = -4286195504672481297L;
	private static final Logger LOG = Logger.getLogger(UpdateAnswerCommand.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		LOG.trace("Start tracing UpdateAnswerCommand");
		Long questionId = Long.parseLong(String.valueOf(request.getParameter("question_id")));
		Long id = Long.parseLong(String.valueOf(request.getParameter("answer_id")));
		String newName = new String(request.getParameter("answer_name").getBytes("ISO-8859-1"), "UTF-8");
		Boolean newIsCorrect = Boolean.parseBoolean(request.getParameter("answer_correct"));
		boolean existAnswer = false;
		boolean existCorrect = false;
		Question question = DAOFactory.getQuestionDAO().find(questionId);
		List<Answer> answers = DAOFactory.getAnswerDAO().findByQuestionId(questionId);
		Answer currentAnswer = DAOFactory.getAnswerDAO().find(id);
		for (Answer answer : answers) {
			if (newName.equals(answer.getName()) && newIsCorrect.equals(answer.getIsCorrect())) {
				existAnswer = true;
			}

			if (newIsCorrect == true && question.getIsSingle() == true && answer.getIsCorrect() == true && currentAnswer.getIsCorrect() != true) {
				existCorrect = true;
			}
		}

		if (existAnswer) {
			request.setAttribute("errorMessage", Error.ERR_THE_SAME_ANSWER_ALREADY_EXIST);
		}
		
		if (existCorrect) {
			request.setAttribute("errorMessage", Error.ERR_CORRECT_ANSWER_ALREADY_EXIST);
		}
		
		if (!existAnswer && !existCorrect) {
			DAOFactory.getAnswerDAO().update(id, newName, newIsCorrect);
		}
		List<Answer> newAnswers = DAOFactory.getAnswerDAO().findByQuestionId(questionId);
		request.setAttribute("question_id", questionId);
		request.setAttribute("answers", newAnswers);
		return Path.PAGE_ADMIN_UPDATE_QUESTION;
	}

}

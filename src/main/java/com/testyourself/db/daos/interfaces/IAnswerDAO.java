package com.testyourself.db.daos.interfaces;

import java.util.List;

import com.testyourself.db.dtos.Answer;

public interface IAnswerDAO {
	void insert(String name, Long questionId, Boolean isCorrect);
	Answer find(Long id);
	List<Answer> findByQuestionId(Long questionId);
	void update(Long id, String name, Boolean isCorrect);
	void delete(Long id);
}

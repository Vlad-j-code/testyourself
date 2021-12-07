package com.testyourself.db.daos.interfaces;

import java.util.List;

import com.testyourself.db.dtos.Question;

public interface IQuestionDAO {
	Question find(Long id);
	List<Question> findAll(Long testId);
	void insert(String name, Long score, Long testId, Boolean isSingle);
	void update(Long questionId, String questionName, Long newScore, Boolean isSingle);
	void delete(Long questionId);
}

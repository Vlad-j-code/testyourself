package com.testyourself.db.daos.interfaces;

import java.util.List;

import com.testyourself.db.dtos.Subject;

public interface ISubjectDAO {
	List<Subject> find();
	Subject find(Long id);
	List<Subject> findUserSubjectsById(Long userId);
	void insert(String subjectName);
	void update(Long subjectId, String subjectName);
	void delete(Long subjectId);
}

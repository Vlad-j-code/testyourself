package com.testyourself.db.daos.interfaces;

import java.util.List;

import com.testyourself.db.dtos.User;

public interface IUserDAO {
	public User findUserByLogin(String login);
	User find(Long userId);
	public List<User> find();
	public List<User> findByRecords(int start, int total);
	public void add(User user);
	void update(User user);
	void addUsersToTheTest(Long testId, List<User> users);
	List<User> findUsersForAddingTheTest(Long testId);
	List<User> findUsersWithThisTest(Long testId);
}

package com.testyourself.db.daos.interfaces;

import java.util.List;

import com.testyourself.db.dtos.Role;

public interface IRoleDAO {
	List<Role> find();
	Role find(Long id);
}

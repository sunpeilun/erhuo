package com.czxy.service;

import java.util.List;

import com.czxy.domain.Classify;

public interface ClassifyService {

	List<Classify> selectAll();

	List<Classify> selectByName(String classificationName);

}

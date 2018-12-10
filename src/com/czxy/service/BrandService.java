package com.czxy.service;

import java.util.List;

import com.czxy.domain.Brand;

public interface BrandService {

	List<Brand> findBrand();

	void deletes(String[] ids);

	void addBrand(Brand b);

	void updateBrand(Brand b);

	Brand selectBrandById(Integer bid);

}

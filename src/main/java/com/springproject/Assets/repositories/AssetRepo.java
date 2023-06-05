package com.springproject.Assets.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.springproject.Assets.models.Asset;

public interface AssetRepo extends CrudRepository<Asset, Long> {
	List<Asset> findAll();
}

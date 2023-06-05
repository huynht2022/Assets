package com.springproject.Assets.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.Assets.models.Asset;
import com.springproject.Assets.repositories.AssetRepo;

@Service
public class AssetServ {
	@Autowired
	private AssetRepo assetRepo;
	
	public List<Asset> allAssets(){
		return assetRepo.findAll();
	}
	
	public Asset createAsset(Asset asset) {
		return assetRepo.save(asset);
	}
	
	public Asset findAsset(Long id) {
		Optional<Asset> optionalAsset = assetRepo.findById(id);
		if(optionalAsset.isPresent()) {
			return optionalAsset.get();
		}else {
			return null;
		}
	}
	
	public Asset updateAsset(Asset asset) {
		return assetRepo.save(asset);
	}
	
	public void deleteAsset(Asset asset) {
		assetRepo.delete(asset);
	}	
}

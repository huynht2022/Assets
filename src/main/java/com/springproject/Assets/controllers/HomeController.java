package com.springproject.Assets.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.springproject.Assets.models.Asset;
import com.springproject.Assets.services.AssetServ;

import jakarta.validation.Valid;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
		return "redirect:/assets";
	}
@Autowired
private AssetServ assetServ;
@GetMapping("/assets")
public String index(@ModelAttribute("asset") Asset asset, Model model){
	List<Asset> assets = assetServ.allAssets();
	model.addAttribute("assets", assets);
	return "index.jsp";
}
@PostMapping("/assets")
public String index(@Valid @ModelAttribute("asset") Asset asset, BindingResult result, Model model) {
	if(result.hasErrors()) {
		List<Asset> assets = assetServ.allAssets();
		model.addAttribute("assets", assets);
		return "index.jsp";
	}else {
		assetServ.createAsset(asset);
		return "redirect:/assets";
	}
}
@GetMapping("/assets/edit/{id}")
public String edit(@PathVariable("id") Long id, Model model) {	
	model.addAttribute("asset", assetServ.findAsset(id));
	return "edit.jsp";
}

@PostMapping("/assets/edit/{id}")
public String update(
@PathVariable("id") Long id, Model model, 
@Valid @ModelAttribute("asset") Asset asset, 
		BindingResult result) {
	if(result.hasErrors()) {
		model.addAttribute("asset", assetServ.findAsset(id));
		return "redirect:/edit/{id}";
	}else {
		assetServ.updateAsset(asset);
		return "redirect:/assets";
	}
}

@GetMapping("/assets/{id}")
public String displayAsset(@PathVariable("id") Long id, Model model) {
	model.addAttribute("asset", assetServ.findAsset(id));
	return "display.jsp";
}

@GetMapping("/assets/delete/{id}")
public String deleteAsset(@PathVariable("id") Long id) {
	Asset asset = assetServ.findAsset(id);
	assetServ.deleteAsset(asset);
	return "redirect:/assets";
}
}

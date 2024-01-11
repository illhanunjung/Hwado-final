package kr.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.smhrd.mapper.ArtworksMapper;

@Controller
public class ArtworksController {
	
	@Autowired
	private ArtworksMapper mapper;

}

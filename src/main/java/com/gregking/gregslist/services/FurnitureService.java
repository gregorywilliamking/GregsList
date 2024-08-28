package com.gregking.gregslist.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gregking.gregslist.models.Furniture;
import com.gregking.gregslist.repositories.FurnitureRepository;


@Service
public class FurnitureService {
	@Autowired
	FurnitureRepository fRepo;

	public List<Furniture> getAll() {
		return fRepo.findAll();
	}
	
	public void createFurniture(Furniture furniture) {
		fRepo.save(furniture);
	}


	public Furniture getOneFurniture(Long id) {
		Optional<Furniture> optionalFurniture = fRepo.findById(id);
		if (optionalFurniture.isPresent()) {
			return optionalFurniture.get();
		} else {
			return null;
		}
	}

	public Furniture update(Furniture furniture) {
		return fRepo.save(furniture);
	}

	public void deleteFurniture(Long id) {
		fRepo.deleteById(id);
	}

}

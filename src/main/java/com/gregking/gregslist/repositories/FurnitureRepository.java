package com.gregking.gregslist.repositories;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gregking.gregslist.models.Furniture;


@Repository
public interface FurnitureRepository extends CrudRepository <Furniture, Long>{
	public ArrayList<Furniture> findAll();

}

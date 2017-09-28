package com.example.springStarter.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.springStarter.model.ClassOrder;

@Repository
public interface ClassorderRepository  extends CrudRepository<ClassOrder, Integer> {



}

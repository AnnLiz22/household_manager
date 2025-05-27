package pl.coderslab.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import java.util.Optional;

public class CategoryConverter implements Converter <String, Optional<Category>> {

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public Optional<Category> convert(String source){
    return categoryRepository.findById(Long.parseLong(source));
    }
}

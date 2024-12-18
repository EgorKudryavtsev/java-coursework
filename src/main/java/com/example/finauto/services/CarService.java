package com.example.finauto.services;

import com.example.finauto.models.Car;
import com.example.finauto.models.Image;
import com.example.finauto.models.User;
import com.example.finauto.repositories.CarRepository;
import com.example.finauto.repositories.UserRepository;
import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
public class CarService {
    private static final Logger log = org.slf4j.LoggerFactory.getLogger(CarService.class);
    private final CarRepository carRepository;
    private final UserRepository userRepository;

    public CarService(CarRepository carRepository, UserRepository userRepository) {
        this.carRepository = carRepository;
        this.userRepository = userRepository;
    }

    public List<Car> listCars(String brand) {
        if (brand != null) return carRepository.findByBrand(brand);
        return carRepository.findAll();
    }

    public void saveCar(Principal principal, Car car, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        car.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            car.addImageToCar(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            car.addImageToCar(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            car.addImageToCar(image3);
        }
        Car carFromDb = carRepository.save(car);
        carFromDb.setPreviewImageId(carFromDb.getImages().get(0).getId());
        carRepository.save(car);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteCar(Long id) {
        carRepository.deleteById(id);
    }

    public Car getCarById(Long id) {
        return carRepository.findById(id).orElse(null);
    }

    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }
}

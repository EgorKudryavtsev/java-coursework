package com.example.finauto.controllers;

import com.example.finauto.models.Car;
import com.example.finauto.models.User;
import com.example.finauto.services.CarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
public class CarController {
    private final CarService carService;

    public CarController(CarService carService) {
        this.carService = carService;
    }

    @GetMapping("/")
    public String cars(@RequestParam(name = "brand", required = false) String brand, Principal principal, Model model) {
        model.addAttribute("cars", carService.listCars(brand));
        model.addAttribute("user", carService.getUserByPrincipal(principal));
        return "cars";
    }

    @GetMapping("/car/{id}")
    public String carInfo(@PathVariable Long id, Model model) {
        Car car = carService.getCarById(id);
        model.addAttribute("car", carService.getCarById(id));
        model.addAttribute("images", car.getImages());
        return "car-info";
    }

    @GetMapping("/car/create")
    public String openCreate(Principal principal, Model model) {
        User user = carService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "car-create";
    }

    @PostMapping("/car/create")
    public String createCar(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                            @RequestParam("file3") MultipartFile file3, Car car, Principal principal) throws IOException {
        carService.saveCar(principal, car, file1, file2, file3);
        return "redirect:/my/cars";
    }

    @PostMapping("/car/delete/{id}")
    public String deleteCar(@PathVariable Long id) {
        carService.deleteCar(id);
        return "redirect:/";
    }

    @GetMapping("/my/cars")
    public String userCars(Principal principal, Model model) {
        User user = carService.getUserByPrincipal(principal); // Получаем пользователя по principal
        model.addAttribute("user", user);
        model.addAttribute("cars", user.getCars());
        return "my-cars";
    }

    @GetMapping("/my/cars/{id}")
    public String userCar(@PathVariable Long id, Model model) {
        User user = carService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("cars", user.getCars());
        return "my-cars";
    }
}

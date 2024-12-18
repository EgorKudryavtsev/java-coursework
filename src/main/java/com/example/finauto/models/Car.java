package com.example.finauto.models;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cars")
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "title")
    private String title;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "car")
    private List<Image> images = new ArrayList<>();

    @Column(name = "brand")
    private String brand;

    @Column(name = "model")
    private String model;

    @Column(name = "price")
    private Integer price;

    @JoinColumn(name = "mileage")
    private Integer mileage;

    @Column(name = "release_year", columnDefinition = "text")
    private String releaseYear;

    @Column(name = "horse_power")
    private Integer horsePower;

    @Column(name = "gearbox")
    private String gearbox;

    @Column(name = "color")
    private String color;

    @Column(name = "description", columnDefinition = "text")
    private String description;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;

    private Long previewImageId;

    private LocalDateTime dateOfCreated;

    public Car() {
    }

    @PrePersist
    private void onCreate() {
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToCar(Image image) {
        image.setCar(this);
        images.add(image);
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Car;
    }

    public Long getId() {
        return this.id;
    }

    public String getTitle() {
        return this.title;
    }

    public List<Image> getImages() {
        return this.images;
    }

    public String getBrand() {
        return this.brand;
    }

    public String getModel() {
        return this.model;
    }

    public Integer getPrice() {
        return this.price;
    }

    public Integer getMileage() {
        return this.mileage;
    }

    public String getReleaseYear() {
        return this.releaseYear;
    }

    public Integer getHorsePower() {
        return this.horsePower;
    }

    public String getGearbox() {
        return this.gearbox;
    }

    public String getColor() {
        return this.color;
    }

    public String getDescription() {
        return this.description;
    }

    public User getUser() {
        return this.user;
    }

    public Long getPreviewImageId() {
        return this.previewImageId;
    }

    public LocalDateTime getDateOfCreated() {
        return this.dateOfCreated;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public void setMileage(Integer mileage) {
        this.mileage = mileage;
    }

    public void setReleaseYear(String releaseYear) {
        this.releaseYear = releaseYear;
    }

    public void setHorsePower(Integer horsePower) {
        this.horsePower = horsePower;
    }

    public void setGearbox(String gearbox) {
        this.gearbox = gearbox;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setPreviewImageId(Long previewImageId) {
        this.previewImageId = previewImageId;
    }

    public void setDateOfCreated(LocalDateTime dateOfCreated) {
        this.dateOfCreated = dateOfCreated;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Car)) return false;
        final Car other = (Car) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$images = this.getImages();
        final Object other$images = other.getImages();
        if (this$images == null ? other$images != null : !this$images.equals(other$images)) return false;
        final Object this$brand = this.getBrand();
        final Object other$brand = other.getBrand();
        if (this$brand == null ? other$brand != null : !this$brand.equals(other$brand)) return false;
        final Object this$model = this.getModel();
        final Object other$model = other.getModel();
        if (this$model == null ? other$model != null : !this$model.equals(other$model)) return false;
        final Object this$price = this.getPrice();
        final Object other$price = other.getPrice();
        if (this$price == null ? other$price != null : !this$price.equals(other$price)) return false;
        final Object this$mileage = this.getMileage();
        final Object other$mileage = other.getMileage();
        if (this$mileage == null ? other$mileage != null : !this$mileage.equals(other$mileage)) return false;
        final Object this$releaseYear = this.getReleaseYear();
        final Object other$releaseYear = other.getReleaseYear();
        if (this$releaseYear == null ? other$releaseYear != null : !this$releaseYear.equals(other$releaseYear))
            return false;
        final Object this$horsePower = this.getHorsePower();
        final Object other$horsePower = other.getHorsePower();
        if (this$horsePower == null ? other$horsePower != null : !this$horsePower.equals(other$horsePower))
            return false;
        final Object this$gearbox = this.getGearbox();
        final Object other$gearbox = other.getGearbox();
        if (this$gearbox == null ? other$gearbox != null : !this$gearbox.equals(other$gearbox)) return false;
        final Object this$color = this.getColor();
        final Object other$color = other.getColor();
        if (this$color == null ? other$color != null : !this$color.equals(other$color)) return false;
        final Object this$description = this.getDescription();
        final Object other$description = other.getDescription();
        if (this$description == null ? other$description != null : !this$description.equals(other$description))
            return false;
        final Object this$user = this.getUser();
        final Object other$user = other.getUser();
        if (this$user == null ? other$user != null : !this$user.equals(other$user)) return false;
        final Object this$previewImageId = this.getPreviewImageId();
        final Object other$previewImageId = other.getPreviewImageId();
        if (this$previewImageId == null ? other$previewImageId != null : !this$previewImageId.equals(other$previewImageId))
            return false;
        final Object this$dateOfCreated = this.getDateOfCreated();
        final Object other$dateOfCreated = other.getDateOfCreated();
        if (this$dateOfCreated == null ? other$dateOfCreated != null : !this$dateOfCreated.equals(other$dateOfCreated))
            return false;
        return true;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $images = this.getImages();
        result = result * PRIME + ($images == null ? 43 : $images.hashCode());
        final Object $brand = this.getBrand();
        result = result * PRIME + ($brand == null ? 43 : $brand.hashCode());
        final Object $model = this.getModel();
        result = result * PRIME + ($model == null ? 43 : $model.hashCode());
        final Object $price = this.getPrice();
        result = result * PRIME + ($price == null ? 43 : $price.hashCode());
        final Object $mileage = this.getMileage();
        result = result * PRIME + ($mileage == null ? 43 : $mileage.hashCode());
        final Object $releaseYear = this.getReleaseYear();
        result = result * PRIME + ($releaseYear == null ? 43 : $releaseYear.hashCode());
        final Object $horsePower = this.getHorsePower();
        result = result * PRIME + ($horsePower == null ? 43 : $horsePower.hashCode());
        final Object $gearbox = this.getGearbox();
        result = result * PRIME + ($gearbox == null ? 43 : $gearbox.hashCode());
        final Object $color = this.getColor();
        result = result * PRIME + ($color == null ? 43 : $color.hashCode());
        final Object $description = this.getDescription();
        result = result * PRIME + ($description == null ? 43 : $description.hashCode());
        final Object $user = this.getUser();
        result = result * PRIME + ($user == null ? 43 : $user.hashCode());
        final Object $previewImageId = this.getPreviewImageId();
        result = result * PRIME + ($previewImageId == null ? 43 : $previewImageId.hashCode());
        final Object $dateOfCreated = this.getDateOfCreated();
        result = result * PRIME + ($dateOfCreated == null ? 43 : $dateOfCreated.hashCode());
        return result;
    }

    public String toString() {
        return "Car(id=" + this.getId() + ", title=" + this.getTitle() + ", images=" + this.getImages() + ", brand=" + this.getBrand() + ", model=" + this.getModel() + ", price=" + this.getPrice() + ", mileage=" + this.getMileage() + ", releaseYear=" + this.getReleaseYear() + ", horsePower=" + this.getHorsePower() + ", gearbox=" + this.getGearbox() + ", color=" + this.getColor() + ", description=" + this.getDescription() + ", user=" + this.getUser() + ", previewImageId=" + this.getPreviewImageId() + ", dateOfCreated=" + this.getDateOfCreated() + ")";
    }
}
package com.example.finauto.models;

import javax.persistence.*;

@Table(name = "images")
@Entity
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String originalFileName;
    private Long size;
    private String contentType;
    private boolean previewImage;

    @Lob
    private byte[] bytes;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Car car;

    public Image() {
    }

    public Long getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getOriginalFileName() {
        return this.originalFileName;
    }

    public Long getSize() {
        return this.size;
    }

    public String getContentType() {
        return this.contentType;
    }

    public boolean isPreviewImage() {
        return this.previewImage;
    }

    public byte[] getBytes() {
        return this.bytes;
    }

    public Car getCar() {
        return this.car;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public void setPreviewImage(boolean previewImage) {
        this.previewImage = previewImage;
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Image)) return false;
        final Image other = (Image) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$id = this.getId();
        final Object other$id = other.getId();
        if (this$id == null ? other$id != null : !this$id.equals(other$id)) return false;
        final Object this$name = this.getName();
        final Object other$name = other.getName();
        if (this$name == null ? other$name != null : !this$name.equals(other$name)) return false;
        final Object this$originalFileName = this.getOriginalFileName();
        final Object other$originalFileName = other.getOriginalFileName();
        if (this$originalFileName == null ? other$originalFileName != null : !this$originalFileName.equals(other$originalFileName))
            return false;
        final Object this$size = this.getSize();
        final Object other$size = other.getSize();
        if (this$size == null ? other$size != null : !this$size.equals(other$size)) return false;
        final Object this$contentType = this.getContentType();
        final Object other$contentType = other.getContentType();
        if (this$contentType == null ? other$contentType != null : !this$contentType.equals(other$contentType))
            return false;
        if (this.isPreviewImage() != other.isPreviewImage()) return false;
        if (!java.util.Arrays.equals(this.getBytes(), other.getBytes())) return false;
        final Object this$car = this.getCar();
        final Object other$car = other.getCar();
        if (this$car == null ? other$car != null : !this$car.equals(other$car)) return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Image;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $id = this.getId();
        result = result * PRIME + ($id == null ? 43 : $id.hashCode());
        final Object $name = this.getName();
        result = result * PRIME + ($name == null ? 43 : $name.hashCode());
        final Object $originalFileName = this.getOriginalFileName();
        result = result * PRIME + ($originalFileName == null ? 43 : $originalFileName.hashCode());
        final Object $size = this.getSize();
        result = result * PRIME + ($size == null ? 43 : $size.hashCode());
        final Object $contentType = this.getContentType();
        result = result * PRIME + ($contentType == null ? 43 : $contentType.hashCode());
        result = result * PRIME + (this.isPreviewImage() ? 79 : 97);
        result = result * PRIME + java.util.Arrays.hashCode(this.getBytes());
        final Object $car = this.getCar();
        result = result * PRIME + ($car == null ? 43 : $car.hashCode());
        return result;
    }

    public String toString() {
        return "Image(id=" + this.getId() + ", name=" + this.getName() + ", originalFileName=" + this.getOriginalFileName() + ", size=" + this.getSize() + ", contentType=" + this.getContentType() + ", previewImage=" + this.isPreviewImage() + ", bytes=" + java.util.Arrays.toString(this.getBytes()) + ", car=" + this.getCar() + ")";
    }
}



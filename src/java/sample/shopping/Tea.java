
package sample.shopping;


public class Tea {
    private String id;
    private String name;
    private double price;
    private int quantity;
    private String imgPath;
    private String description;
    private int cateId;
    

    public Tea() {
    }

    public Tea(String id, String name, double price, int quantity, String imgPath, String description, int cateId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.imgPath = imgPath;
        this.description = description;
        this.cateId = cateId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    @Override
    public String toString() {
        return "Tea{" + "id=" + id + ", name=" + name + ", price=" + price + ", quantity=" + quantity + ", imgPath=" + imgPath + ", description=" + description + ", cateId=" + cateId + '}';
    }

    
    
}

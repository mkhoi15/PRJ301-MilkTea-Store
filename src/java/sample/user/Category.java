
package sample.user;


public class Category {
    private int categoryName;
    private String categoryId;

    public Category() {
    }

    public Category(int categoryName, String categoryId) {
        this.categoryName = categoryName;
        this.categoryId = categoryId;
    }

    public int getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(int categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
    
    
}


package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;
import sample.utils.DBUtils;


public class CategoryDAO {

    private static final String GET_CATEGORIES = "SELECT cateId, cateName FROM Categories";
    
    public Map<Integer, String> getCategories() throws SQLException{
        Map<Integer, String> list = new LinkedHashMap<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn!=null) {
                ptm = conn.prepareStatement(GET_CATEGORIES);
                rs = ptm.executeQuery();
                if (rs!=null) {
                    while (rs.next()) {                        
                        int categoryId = rs.getInt("cateId");
                        String categoryName = rs.getString("cateName");
                        list.put(categoryId, categoryName);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    
    
}

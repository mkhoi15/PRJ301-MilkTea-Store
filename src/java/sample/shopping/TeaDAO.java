package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utils.DBUtils;

public class TeaDAO {

    private static final String GET_PRODUCT = "SELECT productID, [name], price, quantity\n"
            + ", [image] FROM tblProduct ";

    private static final String GET_PRODUCT_PAGING = "SELECT * FROM tblProduct ORDER BY productID\n"
            + "	OFFSET ? ROWS  \n"
            + " FETCH NEXT ? ROWS ONLY";

    private static final String NUMBER_OF_PRODUCT = "SELECT COUNT(productID) as numberOfPage FROM tblProduct";

    public List<Tea> getAllProduct() throws SQLException, NamingException, ClassNotFoundException {
        List<Tea> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_PRODUCT);
//            ptm.setString(1, "%" + pName + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                Tea tea = new Tea(rs.getString("productID"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("image")
                );
                list.add(tea);
            }
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

    public List<Tea> getAllProductPaging(int offSet, int noOfRecord) throws SQLException, NamingException, ClassNotFoundException {
        List<Tea> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_PRODUCT_PAGING);
            ptm.setInt(1, offSet);
            ptm.setInt(2, noOfRecord);
            rs = ptm.executeQuery();
            while (rs.next()) {
                Tea tea = new Tea(rs.getString("productID"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("image")
                );
                list.add(tea);
            }
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

    public int getNumberOfProduct() throws SQLException, NamingException, ClassNotFoundException {
        int numberOfPage = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(NUMBER_OF_PRODUCT);
            rs = ptm.executeQuery();
            if (rs.next()) {
                numberOfPage = rs.getInt("numberOfPage");
            }
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
        return numberOfPage;
    }
    
    public List<Tea> getListByPage(List<Tea> allProductList, int start, int end){
        List<Tea> pagingList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            pagingList.add(allProductList.get(i));
        }
        return pagingList;
    }
    
}

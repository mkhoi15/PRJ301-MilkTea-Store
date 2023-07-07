package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Map;
import javax.naming.NamingException;
import sample.user.UserDTO;
import sample.utils.DBUtils;

public class OrderDAO {

    private static String INSERT_ORDER = "INSERT INTO tblOrder(userID, [date], total) VALUES (?,?,?)";

    private static final String INSERT_ORDER_DETAIL = "SET IDENTITY_INSERT tblOrderDetail ON\n"
            + "INSERT INTO tblOrderDetail(orderDetailID, productID, orderID, price, quantity)\n"
            + "VALUES(?, ?, ?, ?, ?)";

    private static String SELECT_ORDERID = "SELECT TOP 1 orderID FROM tblOrder order by orderID desc ";

    private static String REMOVE_ORDER = "DELETE FROM tblOrder where orderID = ?";

    private static String CHECK_STOCKING_PRODUCT = "SELECT quantity FROM tblProduct WHERE productID = ?";

    private static String UPDATE_PRODUCT_QUANTITY= "UPDATE tblProduct\n"
            + "SET quantity = quantity - (SELECT od.quantity FROM tblOrderDetail od WHERE od.productID = ? AND orderDetailID = ?)\n"
            + "WHERE productID = ? ";

    private static final String REMOVE_ORDER_DETAIL = "DELETE FROM tblOrderDetail WHERE orderDetailID = ?";

    public boolean addOrder(UserDTO user, Cart cart) throws SQLException {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        boolean isInsert = false;

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, date);
                ptm.setDouble(3, cart.getTotal());
                isInsert = ptm.executeUpdate() > 0;
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
        return isInsert;
    }

    public int getOrderID() throws SQLException, NamingException, ClassNotFoundException {
        int orderID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SELECT_ORDERID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                orderID = rs.getInt("orderID");
                if (orderID == 0) {
                    return orderID = 1;
                }
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
        return orderID;
    }

    public boolean addOrderDetail(int orderDetailID, Tea tea) throws SQLException {
        boolean isAdded = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
            ptm.setInt(1, orderDetailID);
            ptm.setString(2, tea.getId());
            ptm.setInt(3, orderDetailID);
            ptm.setDouble(4, tea.getPrice() * tea.getQuantity());
            ptm.setInt(5, tea.getQuantity());
            isAdded = ptm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
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

        return isAdded;
    }

    public boolean removeOrder(int orderID) throws SQLException {
        boolean isRemove = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(REMOVE_ORDER);
            ptm.setInt(1, orderID);
            isRemove = ptm.executeUpdate() > 0;
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

        return isRemove;
    }

    public int checkStockingProduct(String productID) throws SQLException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CHECK_STOCKING_PRODUCT);
            ptm.setString(1, productID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
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
        return quantity;
    }

    public boolean removeOrderDetail(int orderDetailID) throws SQLException, ClassNotFoundException, NamingException {
        boolean isRemove = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(REMOVE_ORDER_DETAIL);
            ptm.setInt(1, orderDetailID);
            isRemove = ptm.executeUpdate() > 0;
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
         return isRemove;
    }

    public boolean updateProductQuantity(String productID,int orderDetailID) throws SQLException, ClassNotFoundException, NamingException {
        boolean isUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(UPDATE_PRODUCT_QUANTITY);
            ptm.setString(1, productID);
            ptm.setInt(2, orderDetailID);
            ptm.setString(3, productID);
            isUpdate = ptm.executeUpdate() > 0;
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
        return isUpdate;
    }
}

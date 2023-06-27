package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

public class TeaDAO extends DBUtils{

    private static final String GET_ALL_TEAS = "select * from tblProduct";

    public List<Tea> getAllTeas() throws SQLException {
        List<Tea> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_TEAS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String id = rs.getString(1);
                        String fullName = rs.getString(2);
                        int price = rs.getInt(3);
                        int quantity = rs.getInt(4);
                        String imgPath = rs.getString(5);
                        String description = rs.getString(6);
                        int cateId = rs.getInt(7);
                        Tea tea = new Tea(id, fullName, price, quantity, imgPath, description, cateId);
                        list.add(tea);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        TeaDAO dao = new TeaDAO();
        List<Tea> list = dao.getAllTeas();
        for (Tea tea : list) {
            System.out.println(tea);
        }
    }
}

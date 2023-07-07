/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Order;
import sample.shopping.OrderDAO;
import sample.shopping.Tea;
import sample.user.UserDTO;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "successOrder.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user == null) {
                request.setAttribute("MESSAGE", "Please Login to Check out!");
                return;
            }
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                request.setAttribute("MESSAGE", "Your cart is empty");
            }
            OrderDAO dao = new OrderDAO();
            
            boolean isStocking = true;
            List<String> error = new ArrayList<>();
            for (Map.Entry<String, Tea> c : cart.getCart().entrySet()) {
                Tea tea = c.getValue();
                int stockingProduct = dao.checkStockingProduct(tea.getId());
                if (stockingProduct - tea.getQuantity() <= -1 || stockingProduct == 0) {
                    String errorMessage = tea.getName() + " only have " + stockingProduct + " left";
                    error.add(errorMessage);
                    isStocking = false;
                }
                
            }
            if (!isStocking) {
                request.setAttribute("MESSAGE", error);
                return;
            }
            
            boolean isUpdate = dao.addOrder(user, cart);
             if (!isUpdate) {
                request.setAttribute("MESSAGE", "Unknow error can not save your order, please try again!!!");
                return;
            }
            int orderDetailID = dao.getOrderID();
            for (Map.Entry<String, Tea> c : cart.getCart().entrySet()) {
                Tea tea = c.getValue();
                boolean saveOrderDetail = dao.addOrderDetail(orderDetailID,tea);
                if (!saveOrderDetail) {
                    request.setAttribute("MESSAGE", "No product data in the system or mistake happen when saving your order (unknown error), please try again for a few minutes");
                    dao.removeOrder(orderDetailID);
                    return;
                } 
                else {
                    if (!dao.updateProductQuantity(tea.getId(), orderDetailID)) {
                        dao.removeOrderDetail(orderDetailID);
                        request.setAttribute("MESSAGE", "The Product might be out of Stock");
                        return;
                    }
                }
            } 
            request.setAttribute("MESSAGE", "ORDER SUCCESS");
            session.removeAttribute("CART");
            session.removeAttribute("SIZE");
            
            url = SUCCESS;
            
        } catch (Exception e) {
            log("Error at: "+e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

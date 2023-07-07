/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author ADMIN
 */
public class Order {
    private int orderID;
    private String userID;
    private String date;
    private double total;

    public Order() {
    }

    public Order(int orderID, String userID, String date, double total) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", userID=" + userID + ", date=" + date + ", total=" + total + '}';
    }

    
    
}

package com.entity;

import java.math.BigDecimal;

public class Phone {
    private int id;
    private String name;
    private String colour;
    private BigDecimal price;
    private String company;
    private String timetomarket;
    private int inventory;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getTimetomarket() {
        return timetomarket;
    }

    public void setTimetomarket(String timetomarket) {
        this.timetomarket = timetomarket;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public Phone(int id, String name, String colour, BigDecimal price, String company, String timetomarket, int inventory) {
        this.id = id;
        this.name = name;
        this.colour = colour;
        this.price = price;
        this.company = company;
        this.timetomarket = timetomarket;
        this.inventory = inventory;
    }

    public Phone() {
        
    }
}

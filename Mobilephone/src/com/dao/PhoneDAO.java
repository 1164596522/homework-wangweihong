package com.dao;

import com.entity.Phone;

import java.util.List;

public interface PhoneDAO {
    List<Phone> listAll();
    int update(Phone phone);
    int delPhoneById(String id);
    int delPhoneById(String[] id);
    int add(Phone phone);
    int delPhone();
    List<Phone> getphone(String value);
}

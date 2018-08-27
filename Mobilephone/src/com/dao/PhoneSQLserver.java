package com.dao;


import com.entity.Phone;

import javax.sql.rowset.JdbcRowSet;
import java.util.List;

public class PhoneSQLserver implements PhoneDAO {
    @Override
    public List<Phone> listAll() {
        String sql = "select * from Phone";
        return JDBCUtil.preparedQuery(Phone.class,sql);
    }

    @Override
    public int update(Phone phone) {
        String sql = " update Phone set name=?,colour=?,price=?,company=?,timetomarket=?,inventory=? where id=?";
        return JDBCUtil.preparedUpdate(sql,phone.getName(),phone.getColour(),phone.getPrice(),phone.getCompany(),phone.getTimetomarket(),phone.getInventory(),phone.getId());
    }

    @Override
    public int delPhoneById(String id) {
        String sql = "delete Phone where id=?";
        return JDBCUtil.preparedUpdate(sql, id);
    }

    @Override
    public int delPhoneById(String[] ids) {
        int num=0;
        for (int i = 0; i < ids.length; i++) {
            num+=delPhoneById(ids[i]);
        }
        return num;
    }
    @Override
    public int add(Phone phone) {
        String sql = "insert into Phone values(?,?,?,?,?,?,?)";
        return JDBCUtil.preparedUpdate(sql,phone.getId(),phone.getName(),phone.getColour(),phone.getPrice(),phone.getCompany(),phone.getTimetomarket(),phone.getInventory());
    }

    @Override
    public int delPhone() {
       String sql = "delete Phone";
       return JDBCUtil.preparedUpdate(sql);
    }

    @Override
    public List<Phone> getphone(String value) {
        String sql = "select * from Phone where name like ?";
        return JDBCUtil.preparedQuery(Phone.class,sql,"%"+value+"%");
    }
}

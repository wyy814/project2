package com.project2.entity;

/**
 * Created by Administrator on 2018/10/12 0012.
 */
public class Adm {
    private String name;
    private String password;

    public Adm() {
    }

    public Adm(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Adm{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
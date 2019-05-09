package com.bw;

public class city {
    private Integer id;
    private  Integer pid;
    private  String cityname;
    private  Integer type;

    public Integer getId() {
        return id;
    }

    public Integer getPid() {
        return pid;
    }

    public String getCityname() {
        return cityname;
    }

    public Integer getType() {
        return type;
    }

    public city(Integer id, Integer pid, String cityname, Integer type) {
        this.id = id;
        this.pid = pid;
        this.cityname = cityname;
        this.type = type;
    }
}

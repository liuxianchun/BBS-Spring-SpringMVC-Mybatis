package com.lxc.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {

    public Date toDate(Date date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        String date_temp = sdf.format(date);
        return sdf.parse(date_temp);
    }

    public Date toDatetime(Date date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
        String date_temp = sdf.format(date);
        return sdf.parse(date_temp);
    }

    public Date toCNDate(Date date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年mm月dd日 HH:mm:ss");
        String date_temp = sdf.format(date);
        return sdf.parse(date_temp);
    }

    public Date toCNDatetime(Date date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年mm月dd日 HH时mm分ss秒");
        String date_temp = sdf.format(date);
        return sdf.parse(date_temp);
    }

}

package com.lxc.entity;

import java.util.Date;

/**
 * ª∞Ã‚
 */
public class Topic {
    private String topicid;
    private String userid;
    private String title;
    private String sort;
    private String context;
    private String img;
    private Date time;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTopicid() {
        return topicid;
    }

    public void setTopicid(String topicid) {
        this.topicid = topicid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "topicid=" + topicid +
                ", userid='" + userid + '\'' +
                ", title='" + title + '\'' +
                ", sort='" + sort + '\'' +
                ", context='" + context + '\'' +
                ", img='" + img + '\'' +
                ", time=" + time +
                '}';
    }
}

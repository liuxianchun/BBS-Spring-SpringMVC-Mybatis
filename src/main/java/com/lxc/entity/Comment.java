package com.lxc.entity;

import java.util.Date;

/**
 * ∆¿¬€∂‘œÛ
 */
public class Comment {
    private String commentid;
    private String userid;
    private String topicid;
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

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTopicid() {
        return topicid;
    }

    public void setTopicid(String topicid) {
        this.topicid = topicid;
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
        return "Comment{" +
                "commentid='" + commentid + '\'' +
                ", userid='" + userid + '\'' +
                ", topicid='" + topicid + '\'' +
                ", context='" + context + '\'' +
                ", img='" + img + '\'' +
                ", time=" + time +
                '}';
    }
}

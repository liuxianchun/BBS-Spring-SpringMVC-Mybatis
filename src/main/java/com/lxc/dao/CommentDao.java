package com.lxc.dao;

import com.lxc.entity.Comment;
import com.lxc.entity.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {

    @Select("select * from comment where topicid=#{topicid}")
    @Results(id="commentMap",value={
            @Result(id=true,column = "commentid",property = "commentid"),
            @Result(column = "userid",property = "userid"),
            @Result(column = "topicid",property = "topicid"),
            @Result(column = "context",property = "context"),
            @Result(column = "img",property = "img"),
            @Result(column = "time",property = "time"),
            @Result(property = "user",column = "userid",one=@One(select="com.lxc.dao.UserDao.findUserById",fetchType = FetchType.EAGER))  //¡¢º¥º”‘ÿ
    })
    public List<Comment> findCommentByTopic(String topicid);

    @Insert("insert into comment(commentid,userid,topicid,context,img,time) values(get_trans_num('comment'),#{userid},#{topicid},#{context},#{img},now())")
    public void saveComment(Comment comment);

    @Select("select u.* from user u,topic t where u.userid=t.userid and t.topicid=#{topicid}")
    public User findUserByTopic(String topicid);
}

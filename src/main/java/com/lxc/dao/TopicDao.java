package com.lxc.dao;

import com.lxc.entity.PageBean;
import com.lxc.entity.Topic;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface TopicDao {

    @Insert("insert into topic(topicid,userid,title,context,img,time,sort) values(get_trans_num('topic'),#{userid},#{title},#{context},#{img},now(),#{sort})")
    public void addTopic(Topic topic);

    @Select("select * from topic order by time desc")
    public ArrayList<Topic> findAllTopic();

    @Select("select * from topic order by time desc limit #{start},#{rows}")
    List<Topic> findByPage(@Param("start") int start, @Param("rows") int rows);

    @Select("select count(*) from topic")
    int findTotalTopic();

    @Select("select * from topic where topicid=#{topicid}")
    @Results(id="findTopic",value={
            @Result(property = "topicid",column = "topicid"),@Result(property = "userid",column = "userid"),
            @Result(property = "title",column = "title"),@Result(property = "context",column = "context"),
            @Result(property = "img",column = "img"),@Result(property = "time",column = "time"),
            @Result(property = "sort",column = "sort"),
            @Result(property = "user",column = "userid",one=@One(select="com.lxc.dao.UserDao.findUserById",fetchType = FetchType.EAGER))
    })
    Topic findTopicById(String topicid);

    @Select("select * from topic where title like concat('%',#{keywords},'%') or context like concat('%',#{keywords},'%') order by time desc limit #{start},#{rows}")
    @Results(id="topicMap",value={
            @Result(property = "topicid",column = "topicid"),@Result(property = "userid",column = "userid"),
            @Result(property = "title",column = "title"),@Result(property = "context",column = "context"),
            @Result(property = "img",column = "img"),@Result(property = "time",column = "time"),
            @Result(property = "sort",column = "sort"),
            @Result(property = "user",column = "userid",one=@One(select="com.lxc.dao.UserDao.findUserById",fetchType = FetchType.EAGER))
    })
    List<Topic> searchTopic(@Param("start") int start, @Param("rows") int rows,@Param("keywords") String keywords);

    @Select("select count(*) from topic where title like concat('%',#{keywords},'%') or context like concat('%',#{keywords},'%')")
    int findTotalSearch(String keywords);

   /* @Select("select * from topic where title like concat('%',#{keywords},'%') or context like concat('%',#{keywords},'%') order by time desc limit #{start},#{rows}")
    List<Topic> searchInitTopic(@Param("keywords") String keywords,@Param("start") String start,@Param("rows") String rows);*/
}

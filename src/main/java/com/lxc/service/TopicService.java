package com.lxc.service;

import com.lxc.entity.PageBean;
import com.lxc.entity.Topic;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface TopicService {

    public void addTopic(Topic topic);  //添加话题

    public ArrayList<Topic> findAllTopic();  //得到话题集合

    PageBean<Topic> findTopicByPage(int curPage, int rows);  //得到话题展示数据

    int findTotalTopic();   //查找全部话题

    Topic findTopicById(String topicid);   //根据topicid查找话题

    PageBean<Topic> searchTopicPage(int start,int rows,String keywords);   //搜索查询

    public int findTotalSearch(String keywords);   //查询搜索记录条数

    public PageBean<Topic> searchTopic(String keywords);   //初始查询
}

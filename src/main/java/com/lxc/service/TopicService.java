package com.lxc.service;

import com.lxc.entity.PageBean;
import com.lxc.entity.Topic;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface TopicService {

    public void addTopic(Topic topic);  //��ӻ���

    public ArrayList<Topic> findAllTopic();  //�õ����⼯��

    PageBean<Topic> findTopicByPage(int curPage, int rows);  //�õ�����չʾ����

    int findTotalTopic();   //����ȫ������

    Topic findTopicById(String topicid);   //����topicid���һ���

    PageBean<Topic> searchTopicPage(int start,int rows,String keywords);   //������ѯ

    public int findTotalSearch(String keywords);   //��ѯ������¼����

    public PageBean<Topic> searchTopic(String keywords);   //��ʼ��ѯ
}

package com.lxc.service.impl;

import com.lxc.dao.TopicDao;
import com.lxc.entity.PageBean;
import com.lxc.entity.Topic;
import com.lxc.service.TopicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("topicService")
public class TopicServiceImpl implements TopicService {

    @Resource
    private TopicDao topicDao;

    @Override
    public void addTopic(Topic topic) {
        topicDao.addTopic(topic);
    }

    @Override
    public ArrayList<Topic> findAllTopic() {
        return topicDao.findAllTopic();
    }

    @Override
    public PageBean<Topic> findTopicByPage(int curPage, int rows) {
        PageBean<Topic> pageBean = new PageBean<Topic>();
        int totalCount = findTotalTopic();   //�ܼ�¼��
        int totalPage = (totalCount % rows ==0) ?totalCount/rows : totalCount/rows+1;  //��ҳ��
        if(curPage<1)
            curPage = 1;
        if(curPage>totalPage)
            curPage = totalPage;
        pageBean.setCurrentPage(curPage);  //��ǰҳ��
        pageBean.setRows(rows);            //ÿҳ��¼��
        pageBean.setTotalPage(totalPage);  //��ҳ��
        pageBean.setTotalCount(totalCount);//�ܼ�¼��
        int start = (curPage-1)*rows;   //��ʼ��������¼
        List<Topic> topicList = topicDao.findByPage(start, rows);   //��ҳ����
        pageBean.setList(topicList);
        return pageBean;
    }

    @Override
    public int findTotalTopic() {
        return topicDao.findTotalTopic();
    }

    @Override
    public Topic findTopicById(String topicid) {
        return topicDao.findTopicById(topicid);
    }

    @Override
    public PageBean<Topic> searchTopicPage(int curPage, int rows, String keywords) {
        PageBean<Topic> pageBean = new PageBean<Topic>();
        int totalCount = findTotalSearch(keywords);   //��������¼��
        int totalPage = (totalCount % rows ==0) ?totalCount/rows : totalCount/rows+1;  //��ҳ��
        if(curPage<1)
            curPage = 1;
        if(curPage>totalPage)
            curPage = totalPage;
        pageBean.setCurrentPage(curPage);  // ��ǰҳ��
        pageBean.setRows(rows);            //ÿҳ��¼��
        pageBean.setTotalPage(totalPage);  //��ҳ��
        pageBean.setTotalCount(totalCount);//�ܼ�¼��
        int start = (curPage-1)*rows;   //��ʼ��������¼
        List<Topic> topicList = topicDao.searchTopic(start, rows,keywords);   //��ҳ����
        pageBean.setList(topicList);
        return pageBean;
    }

    @Override
    public int findTotalSearch(String keywords) {
        return topicDao.findTotalSearch(keywords);
    }

    @Override
    public PageBean<Topic> searchTopic(String keywords) {
        int rows=10;
        List<Topic> topics = topicDao.searchTopic(1,rows,keywords);
        PageBean<Topic> pageBean = new PageBean<>();
        int totalCount = findTotalSearch(keywords);   //��������¼��
        int totalPage = (totalCount % rows ==0) ?totalCount/rows : totalCount/rows+1;  //��ҳ��
        pageBean.setTotalPage(totalPage);
        pageBean.setTotalCount(totalCount);
        pageBean.setList(topics);
        pageBean.setCurrentPage(1);
        pageBean.setRows(rows);
        return pageBean;
    }
}

package com.lxc.service.impl;

import com.lxc.dao.CommentDao;
import com.lxc.entity.Comment;
import com.lxc.entity.User;
import com.lxc.service.CommentService;
import com.lxc.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentDao commentDao;

    @Override
    public List<Comment> findCommentByTopic(String topicid) {
        User user = commentDao.findUserByTopic(topicid);

        return commentDao.findCommentByTopic(topicid);
    }

    @Override
    public void saveComment(Comment comment) {
        commentDao.saveComment(comment);
    }

    @Override
    public User findUserByTopic(String topicid) {
        return commentDao.findUserByTopic(topicid);
    }
}

package com.lxc.service;

import com.lxc.entity.Comment;
import com.lxc.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentService {

    public List<Comment> findCommentByTopic(String topicid);

    public void saveComment(Comment comment);

    public User findUserByTopic(String topicid);
}

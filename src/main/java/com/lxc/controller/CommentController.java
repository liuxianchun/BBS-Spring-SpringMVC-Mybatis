package com.lxc.controller;

import com.lxc.entity.Comment;
import com.lxc.entity.Topic;
import com.lxc.entity.User;
import com.lxc.service.CommentService;
import com.lxc.service.TopicService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private TopicService topicService;

    @Resource
    private CommentService commentService;

    @RequestMapping("/topicInfo")
    public String goToCommentInfo(String topicid, Model model){
        Topic topic = topicService.findTopicById(topicid);
        System.out.println("topic:"+topic);
        List<Comment> comments = commentService.findCommentByTopic(topic.getTopicid());
        System.out.println("comment:"+comments);
        model.addAttribute("topic",topic);
        model.addAttribute("comments",comments);
        return "topicInfo";
    }

    @RequestMapping("/addComment")
    public String addComment(Comment comment, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user==null)
            return "login";
        comment.setUserid(user.getUserid());
        comment.setUser(user);
        commentService.saveComment(comment);
        model.addAttribute("topicid",comment.getTopicid());
        return "redirect:/comment/topicInfo";
    }
}

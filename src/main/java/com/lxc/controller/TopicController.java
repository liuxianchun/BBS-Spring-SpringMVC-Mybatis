package com.lxc.controller;

import com.lxc.entity.PageBean;
import com.lxc.entity.Topic;
import com.lxc.entity.User;
import com.lxc.service.TopicService;
import com.lxc.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/topic")
public class TopicController {

    @Resource
    private TopicService topicService;
    @Resource
    private UserService userService;

    @RequestMapping("/addTopic")
    public String addTopic(Topic topic) {
        User user = userService.findUserById(topic.getUserid());
        topic.setUser(user);
        topicService.addTopic(topic);
        return "redirect:/page/main";
    }

    @RequestMapping("/search")
    public String search(String keywords, Model model){
        model.addAttribute("keywords",keywords);
        PageBean<Topic> pb = topicService.searchTopic(keywords);
        model.addAttribute("pageBean",pb);
        System.out.println(pb.getCurrentPage()+","+pb.getTotalPage()+","+pb.getRows());
        return "main";

    }
}

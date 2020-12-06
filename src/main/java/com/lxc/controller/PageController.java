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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 直接返回页面
 */
@Controller
@RequestMapping("/page")
public class PageController {

    @Resource
    private TopicService topicService;

    @Resource
    private UserService userService;

    @RequestMapping("/main")
    public String Page_main(Model model, HttpServletRequest req){
        String s_curPage = req.getParameter("curPage");   //当前页码
        String s_rows = req.getParameter("rows");  //每页显示条数
        String keywords = req.getParameter("keywords");  //关键词
        if(keywords==null)
            keywords = "";
        if("".equals(s_curPage)||s_curPage==null){
            s_curPage = "1";
            s_rows = "10";
        }
        int curPage = Integer.parseInt(s_curPage);
        int rows = Integer.parseInt(s_rows);
        PageBean<Topic> pageBean = topicService.searchTopicPage(curPage,rows,keywords);
        System.out.println(pageBean);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("session user:"+user);
        if(user!=null)
            model.addAttribute("user",user);
        model.addAttribute("pageBean",pageBean);
        model.addAttribute("keywords",keywords);
        return "main";
    }
    @RequestMapping("/register")
    public String Page_register(){
        return "register";
    }
    @RequestMapping("/login")
    public String Page_login(){
        return "login";
    }
    @RequestMapping("/user_protocol")
    public String Page_user_protocol(){
        return "user_protocol";
    }
    @RequestMapping("/topicInfo")
    public String Page_topicInfo(HttpServletRequest req,Model model){
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        model.addAttribute("user",user);
        return "topicInfo";
    }
    @RequestMapping("/user_information")
    public String Page_information(HttpServletRequest request,Model model) throws ParseException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user==null)
            return "login";
        else{
            user = userService.findUserById(user.getUserid());
            Date s_birthday = user.getBirthday();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
            if(s_birthday!=null){
                String birthday = sdf.format(s_birthday);
                model.addAttribute("birthday",birthday);
            }
            session.setAttribute("user",user);
            System.out.println("session:"+user);
            return "user_information";
        }
    }
    /*发帖前先验证是否登录*/
    @RequestMapping("/topicAdd")
    public String Page_topicAdd(HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user==null)
            return "login";
        else
        return "topicAdd";
    }
}

package com.lxc.controller;

import com.lxc.entity.User;
import com.lxc.service.SysMessageService;
import com.lxc.service.UserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private SysMessageService sysmessageService;

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        simpleDateFormat.setLenient(false);
        CustomDateEditor dateEditor = new CustomDateEditor(simpleDateFormat, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }

    @RequestMapping(value = "/register",produces="text/html;charset=UTF-8")
    public String register(User user, Model model, HttpServletRequest request){
        int flag = userService.verifyUserId(user.getUserid());
        if(flag==0){
            userService.saveUser(user);
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            session.setAttribute("user", user);
            System.out.println(user.getUserid()+" register complete");
            return "redirect:/page/main";
        }else{
            //用户名被占用
            String msg = sysmessageService.getSysMessage(2);
            model.addAttribute("msg",msg);
            return "register";
        }
    }

    @RequestMapping(value = "/login",produces="text/html;charset=UTF-8")
    public String login(User sUser,Model model,HttpServletRequest request){
        int flag = userService.verifyUser(sUser.getUserid(),sUser.getPassword());
        if(flag==0){
            //用户名或密码错误
            String msg = sysmessageService.getSysMessage(1);
            model.addAttribute("msg", msg);
            return "login";
        }else{
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            User user = userService.findUserById(sUser.getUserid());
            session.setAttribute("user", user);
            System.out.println(sUser.getUserid()+" login...");
            return "redirect:/page/main";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/page/login";
    }

    @RequestMapping("/information")
    public String userInformation(HttpServletRequest req,Model model){
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if(user==null)
            return "login";
        else{
            model.addAttribute("user",user);
            return "redirect:/page/user_information";
        }
    }

    @RequestMapping("/saveInformation")
    public String saveInformation(@RequestParam("userid") String userid,
                                  @RequestParam("phone") String phone,
                                  @RequestParam("birthday") String birthday,
                                  @RequestParam("gender") String gender,
                                  @RequestParam("email") String email,
                                  @RequestParam(value="file",required=false) MultipartFile multipartFile,
                                  HttpServletRequest request,Model model) throws Exception {
        //更改user属性
       User sUser = new User();
       sUser.setUserid(userid);
       sUser.setPhone(phone);
       if(!"".equals(birthday)&&phone!=null){
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
           Date date = sdf.parse(birthday);
           sUser.setBirthday(date);
       }
        sUser.setEmail(email);
        sUser.setGender(gender);
       //文件操作
        //当前文件名称
        String originalFilename;
        if(multipartFile!=null && !multipartFile.isEmpty()) {   //0，判断是否为空
            /**
             * 对文件名进行操作防止文件重名
             */
            //1，获取原始文件名
            originalFilename = multipartFile.getOriginalFilename();
            //2,截取源文件的文件名前缀,不带后缀
            String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
            //3,加工处理文件名，原文件加上时间戳
            String newFileNamePrefix = userService.getImgNum();
            //4,得到新文件名
            String newFileName = newFileNamePrefix + originalFilename.substring(originalFilename.lastIndexOf("."));
            System.out.println("upload image:"+newFileName);
            //5,构建文件对象
            String path = request.getSession().getServletContext().getRealPath("/upload/");  //上传的位置
            sUser.setImage("upload/" + newFileName);
            File file = new File(path + newFileName);
            if(!file.exists()){    //该路径是否存在
                file.mkdirs();     //创建该文件夹
            }
            //6,执行上传操作
            try {
                multipartFile.transferTo(file);
                //上传成功，向jsp页面发送成功信息
                model.addAttribute("fileMsg","Upload success!Filename:"+originalFilename);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("fileMsg","Upload failed!Filename:"+originalFilename);
            }
        }
        if(multipartFile==null)
            model.addAttribute("fileMsg","No file!");
        System.out.println("user:"+sUser);
        if(multipartFile!=null && !multipartFile.isEmpty()){
            userService.updateUser(sUser);  //更新头像
        }else{
            userService.updateUserNoImg(sUser);  //没有上传图片，不更新
        }

        User user = userService.findUserById(sUser.getUserid());
        Date s_birthday = user.getBirthday();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
        if(s_birthday!=null){
            String str_birthday = sdf.format(s_birthday);
            model.addAttribute("birthday",str_birthday);
        }
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        System.out.println("session:"+user);
        return "user_information";
    }

}

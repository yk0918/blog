package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Users;
import service.impl.UsersServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UsersController {
    @Autowired
    private UsersServiceImpl usersService;
    @RequestMapping("/getAllPages")
    public String getUsersInfo(Model model,
                               @RequestParam(value = "number",required = false,defaultValue = "1") Integer number,
                               @RequestParam(value = "pageSize",required = false,defaultValue = "2") Integer pageSize){
        PageHelper.startPage(number,pageSize);
        List<Users> usersList=usersService.selectAll();
        PageInfo pageInfo=new PageInfo(usersList);
        model.addAttribute("usersList",usersList);
        model.addAttribute("pageInfo",pageInfo);
        return "showUsers";
    }
    @RequestMapping("/to_addUsers")
    public String to_addUsers(){
        return "addUser3";
    }
    @RequestMapping(value = "/addUsers",method = RequestMethod.POST)
    public String addUsers(Users users, @RequestParam(value = "picpath_a",required = false) MultipartFile file, HttpServletRequest request) throws IOException {
        System.out.println(users.getUsername());
        String picpath=null;
        if(file.isEmpty()){
            return "failed";
        }
        //获取文件存储路径（绝对路径）
        String path=request.getSession().getServletContext().getRealPath("/upload/");
       // String path=request.getRealPath("/WEB-INF/file");
        String fileName=file.getOriginalFilename();
        //创建文件实例
        File filePath=new File(path,fileName);
        if(!filePath.getParentFile().exists()){
            filePath.getParentFile().mkdirs();
        }

        //写入文件
        file.transferTo(filePath);
        users.setPicpath(filePath.getName());
        usersService.insert(users);
        return "redirect:/users/getAllPages";

    }
    @RequestMapping("/delUsers")
    public String delUsers(@RequestParam("id") int id){
        usersService.delete(id);
        return "redirect:/users/getAllPages";
    }


    //经入修改页面
    @RequestMapping("/to_updateUser")
    public String to_updateUser(@RequestParam("id") int id,Model model){
        Users users=usersService.selectOne(id);
        model.addAttribute("users",users);
        return "updateUser";
    }

    //修改功能
    @RequestMapping(value = "/updateUsers",method = RequestMethod.POST)
    public String updateUsers(Users users, @RequestParam(value = "picpath_a",required = false) MultipartFile file, HttpServletRequest request) throws IOException {
        String picpath=null;
        if(file.isEmpty()){
            return "failed";
        }
        //获取文件存储路径（绝对路径）
        String path=request.getSession().getServletContext().getRealPath("/upload/");
        // String path=request.getRealPath("/WEB-INF/file");
        String fileName=file.getOriginalFilename();
        //创建文件实例
        File filePath=new File(path,fileName);
        if(!filePath.getParentFile().exists()){
            filePath.getParentFile().mkdirs();
        }

        //写入文件
        file.transferTo(filePath);
        users.setPicpath(filePath.getName());
        usersService.update(users);
        return "redirect:/users/getAllPages";
    }



}

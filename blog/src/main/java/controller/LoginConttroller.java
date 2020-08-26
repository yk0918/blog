package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Users;
import service.impl.UsersServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
public class LoginConttroller {

    @Autowired
    private UsersServiceImpl usersService;
    @RequestMapping("to_login")
    public String to_login(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session){
        System.out.println(username+"===============");
       if(usersService.selectOneByName(username)!=null){
           Users users=usersService.selectOneByName(username);
            if(users.getPassword().equals(password)){
                session.setAttribute("users",users);
                return "showUsers";
            }
        }
        return "redirect:/to_login";
    }
}

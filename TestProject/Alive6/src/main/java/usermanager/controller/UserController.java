package usermanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import usermanager.model.User;
import usermanager.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;
    private int currentPage = 1;
    private int itemsOnPage = 15;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users", method = RequestMethod.GET)   //main page
    public String listUsers(Model model){
        if(currentPage<1) {
            currentPage = 1;
        }
        List<User> listUsers = userService.listUsers(currentPage, itemsOnPage);
        if(listUsers.isEmpty() && currentPage > 1){
            currentPage--;
        }
        model.addAttribute("user", new User());
        model.addAttribute("pageNumber", currentPage);
        model.addAttribute("listUsers", this.userService.listUsers(currentPage, itemsOnPage));
        return "users";    //reference on our page "users"
    }

    @RequestMapping(value = "users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getId() == 0){
            userService.addUser(user);
        }else{
            userService.updateUser(user);
        }
        return "redirect:/users";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping("edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers(currentPage, itemsOnPage));
        return "users";
    }

    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping(value = "/usernames", method = RequestMethod.GET)
    public String findUsersByName(HttpServletRequest request, Model model){
        String name = request.getParameter("username");
        System.out.println(name);
        model.addAttribute("user", new User());
        model.addAttribute("userListByName", this.userService.findUsersByName(name));
        return "usersbyname";
    }

    @RequestMapping(value = "/page/1", method = RequestMethod.GET)
    public String paginationNext(){
        currentPage++;
        return "redirect:/users";
    }

    @RequestMapping(value = "/page/0", method = RequestMethod.GET)
    public String paginationPrev(){
        currentPage--;
        return "redirect:/users";
    }



}

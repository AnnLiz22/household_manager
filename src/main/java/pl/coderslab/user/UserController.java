package pl.coderslab.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;

    @GetMapping
    public String showUserForm(Model model) {
        model.addAttribute("user", new User());
        return "/addUser";
    }

    @PostMapping
    public String addUserForm(@ModelAttribute User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/addUser";
        }
        if (user.getId() == null) {
            userRepository.save(user);
            log.info("user {} added to the database", user);
        } return "redirect:users/all";
    }

    @GetMapping("/edit/{id}")
    public String showEditUserForm(@PathVariable Long id, Model model){
        Optional <User> optionalUser = userRepository.findById(id);
        if(optionalUser.isPresent()){
            model.addAttribute("user", optionalUser.get());
            log.info("user {} is present", optionalUser);
        }
        return "editUser";
    }

    @PostMapping("/edit/{id}")
    public String editUserForm(@PathVariable Long id, @ModelAttribute User user, Model model){
        Optional <User> optionalUser = userRepository.findById(id);
        if(optionalUser.isPresent()){
            User existingUser = optionalUser.get();
            existingUser.setName(user.getName());
            existingUser.setRole(user.getName());
            userRepository.save(existingUser);
            model.addAttribute("user", existingUser);
            log.info("user {} updated", optionalUser);
        }
        return "editUser";
    }

    @PostMapping("/delete")
    public String deleteUser(User user){
        userRepository.deleteById(user.getId());

        return "redirect:users/all";
    }

    @GetMapping("/all")
    public String getAllHouseholdMembers(){
        return "allUsers";
    }


    @GetMapping("/show/{id}")
    public String showUser(@PathVariable Long id, Model model){
        Optional<User> user = userRepository.findById(id);
        model.addAttribute(user.get());
        return "showUser";
    }

    @ModelAttribute("users")
    public List<User> getAllUsers(){
        return userRepository.findAll();
    }


}


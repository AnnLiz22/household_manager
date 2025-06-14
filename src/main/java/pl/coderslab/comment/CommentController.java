package pl.coderslab.comment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.user.UserRepository;
import pl.coderslab.user_task.UserTaskRepository;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/comments")
@RequiredArgsConstructor
public class CommentController {

    private final CommentRepository commentRepository;
    private final UserRepository userRepository;
    private final UserTaskRepository userTaskRepository;

    @GetMapping
    public String showUserTaskCommentForm(Model model) {
        model.addAttribute("comment", new Comment());
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("userTasks", userTaskRepository.findAll());
        return "addComment";
    }

    @PostMapping("/add")
    public String addComment(@ModelAttribute Comment comment, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("users", userRepository.findAll());
            model.addAttribute("userTasks", userTaskRepository.findAll());
            return "addComment";
        }
        commentRepository.save(comment);
        log.info("Comment saved successfully: {}", comment);
        return "redirect:/assignTask/all";
    }

    @ModelAttribute("comments")
    public List<Comment> getComments() {
        return commentRepository.findAll();
    }

}

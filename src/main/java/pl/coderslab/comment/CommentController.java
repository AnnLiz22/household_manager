package pl.coderslab.comment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/comments")
@RequiredArgsConstructor
public class CommentController {

    private final CommentRepository commentRepository;

    @GetMapping
    public String showUserTaskCommentForm(Model model){
        model.addAttribute("comment", new Comment());
        return "addComment";
    }

    @PostMapping
    public String addComment(@ModelAttribute Comment comment){
        commentRepository.save(comment);
        return "addComment";
    }

    @ModelAttribute("comments")
    public List<Comment> getComments(){
        return commentRepository.findAll();
    }
}

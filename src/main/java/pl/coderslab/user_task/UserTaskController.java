package pl.coderslab.user_task;

import org.springframework.stereotype.Controller;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.comment.Comment;
import pl.coderslab.comment.CommentRepository;
import pl.coderslab.task.Task;
import pl.coderslab.task.TaskRepository;
import pl.coderslab.user.User;
import pl.coderslab.user.UserRepository;

import java.util.List;
import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/assignTask")
@RequiredArgsConstructor
public class UserTaskController {

  private final UserTaskRepository userTaskRepository;
  private final TaskRepository taskRepository;
  private final UserRepository userRepository;
  private final CommentRepository commentRepository;

  @GetMapping
  public String showAssignTaskForm(Model model) {
    model.addAttribute("userTask", new UserTask());
    model.addAttribute("users", userRepository.findAll());
    model.addAttribute("tasks", taskRepository.findAll());
    return "assignTaskToUser";
  }

  @PostMapping
  public String assignTask(@ModelAttribute UserTask userTask, Model model) {

      if (userTask.getUser() == null || userTask.getTask() == null) {
          return "assigningTaskError";
      }
      userTaskRepository.save(userTask);
      log.info("Assigned task {} to user {}", userTask.getTask(), userTask.getUser());
      return "redirect:/assignTask/all";
  }

    @GetMapping("/edit/{id}")
    public String showEditUserTask(@PathVariable Long id, Model model){
        Optional<UserTask> userTask = userTaskRepository.findById(id);
        userTask.ifPresent(ut -> model.addAttribute("userTask", ut));
        return "editUserTask";
    }

    @PostMapping("/edit/{id}")
  public String editUserTask(@PathVariable Long id, @ModelAttribute UserTask userTask, BindingResult result, Model model) {
    if (result.hasErrors()) {
      return "editUserTask";
    }
    userTask.setId(id);
    userTaskRepository.save(userTask);

    log.info("UserTask {} updated", userTask);
    return "redirect:/assignTask/all";
  }

  @PostMapping("/delete/{id}")
  public String deleteFromUserTasks(@PathVariable Long id) {
    userTaskRepository.deleteById(id);
    log.info("Deleted UserTask with id {}", id);
    return "redirect:/assignTask/all";
  }

  @GetMapping("/all")
  public String allUserTasks(Model model) {

    model.addAttribute("userTasks", userTaskRepository.findAll());

    return "allUserTasks";
  }

  @GetMapping("/show/{id}")
  public String showUserTask(@PathVariable Long id, Model model) {
    Optional<UserTask> optionalUserTask = userTaskRepository.findById(id);
    if (optionalUserTask.isPresent()) {
      model.addAttribute("userTask", optionalUserTask.get());
    }
    return "editUserTask";
  }

  @ModelAttribute("userTasks")
  public List<UserTask> getUserTasks() {
    return userTaskRepository.findAll();
  }

  @ModelAttribute("users")
  public List<User> getUsers() {
    return userRepository.findAll();
  }

  @ModelAttribute("comments")
  public List<Comment> getAllComments() {
    return commentRepository.findAll();
  }
}
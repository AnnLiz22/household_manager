package pl.coderslab.user_task;

import javax.validation.Valid;
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
  public String assignTask(@Valid @ModelAttribute UserTask userTask, BindingResult result, Model model) {
    if (result.hasErrors() || userTask.getUser() == null || userTask.getTask() == null) {
      return "assignTaskToUser";
    }
      userTaskRepository.save(userTask);
      log.info("Assigned task {} to user {}", userTask.getTask(), userTask.getUser());
      return "redirect:/assignTask/all";
  }

  @GetMapping("/edit/{id}")
  public String showEditUserTask(@PathVariable Long id, Model model){
    Optional<UserTask> userTaskOpt = userTaskRepository.findById(id);
    if (userTaskOpt.isPresent()) {
      UserTask userTask = userTaskOpt.get();
      model.addAttribute("userTask", userTask);
      model.addAttribute("newComment", new Comment());
      model.addAttribute("comments", commentRepository.findAllByUserTaskId(id));
      return "editUserTask";
    }
    return "redirect:/assignTask/all";
  }

  @PostMapping("/edit/{id}")
  public String editUserTask(@PathVariable Long id, @ModelAttribute UserTask userTask, BindingResult result, Model model) {
      if (result.hasErrors()) {
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("tasks", taskRepository.findAll());
        return "editUserTask";
      }

      Optional<User> optionalUser = userRepository.findById(userTask.getUser().getId());
      Optional<Task> optionalTask = taskRepository.findById(userTask.getTask().getId());

      if (optionalUser.isEmpty() || optionalTask.isEmpty()) {
        if (optionalUser.isEmpty()) {
          log.warn("User with ID {} not found during edit", userTask.getUser().getId());
        }
        if (optionalTask.isEmpty()) {
          log.warn("Task with ID {} not found during edit", userTask.getTask().getId());
        }

        model.addAttribute("editError", "Invalid user or task selected.");
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("tasks", taskRepository.findAll());
        return "editUserTask";
      }

      userTask.setId(id);
      userTask.setUser(optionalUser.get());
      userTask.setTask(optionalTask.get());

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

  @ModelAttribute("userTasks")
  public List<UserTask> getUserTasks() {
    return userTaskRepository.findAll();
  }

  @ModelAttribute("users")
  public List<User> getUsers() {
    return userRepository.findAll();
  }

  @ModelAttribute("tasks")
  public List<Task> getTasks() {
    return taskRepository.findAll();
  }

  @ModelAttribute("comments")
  public List<Comment> getAllComments() {
    return commentRepository.findAll();
  }
}
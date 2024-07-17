package pl.coderslab.task;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/tasks")
@RequiredArgsConstructor
public class TaskController {

    private final TaskRepository taskRepository;

    @GetMapping
    public String showAddTask(Model model) {
        model.addAttribute("task", new Task());
        return "addTask";
    }

    @PostMapping
    public String addTaskForm(@Valid Task task, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "addTask";
        }
        taskRepository.save(task);
        return "redirect:tasks/all";
    }

    @GetMapping("/edit/{id}")
    public String showEditTaskForm(@PathVariable Long id, Model model) {
        Optional<Task> optionalTask = taskRepository.findById(id);
        if (optionalTask.isPresent()) {
            model.addAttribute("task", optionalTask.get());
        }
        return "editTask";
    }

    @PostMapping("/edit/{id}")
    public String editTask(@PathVariable Long id, @ModelAttribute Task task, Model model) {

        Optional<Task> optionalTask = taskRepository.findById(id);
        if (optionalTask.isPresent()) {
            Task existingTask = optionalTask.get();
            existingTask.setTaskName(task.getTaskName());
            existingTask.setTaskDescription(task.getTaskDescription());
            existingTask.setCreatedOn(task.getCreatedOn());
            taskRepository.save(existingTask);
            model.addAttribute("task", existingTask);
        }
        return "editTask";
    }

    @GetMapping("delete/{id}")
    public String deleteTask(@PathVariable Long id){
        taskRepository.deleteById(id);
        return "redirect:tasks/all";
    }

    @GetMapping("/showTask/{id}")
    public String showTask(@PathVariable Long id, Model model) {

        Optional<Task> task = taskRepository.findById(id);
        model.addAttribute(task.get());
        return "showTask";
    }

    @GetMapping("/all")
    public String showAllTasks(Model model) {
        model.addAttribute("tasks", taskRepository.findAll());
        return "allTasks";
    }

    @ModelAttribute
    public List<Task> getAll(){
       return taskRepository.findAll();
    }

}

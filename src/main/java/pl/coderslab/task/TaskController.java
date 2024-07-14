package pl.coderslab.task;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

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

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String showEditTask(@PathVariable Long id, Model model){
        model.addAttribute("task", taskRepository.findById(id));
        return "editTask";
    }

    @PostMapping("/edit/{id}")
    public String updateTask(@Valid Task task, BindingResult bindingResult ){
        if(bindingResult.hasErrors()){
            return "editTask";
        }
        taskRepository.save(task);
        return "redirect:tasks/all";
    }

    @GetMapping("delete/{id}")
    public String deleteTask(@PathVariable Long id){
        taskRepository.deleteById(id);
        return "redirect:tasks/all";
    }

    @GetMapping("/show/{id}")
    public String showTask(@PathVariable Long id, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return "allTasks";
        }
        taskRepository.findById(id);
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

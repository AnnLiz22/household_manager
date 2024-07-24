package pl.coderslab.task;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.category.Category;
import pl.coderslab.category.CategoryRepository;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/tasks")
@RequiredArgsConstructor
public class TaskController {

    private final TaskRepository taskRepository;
    private final CategoryRepository categoryRepository;

    @GetMapping
    public String showAddTask(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("category", categoryRepository.findAll());
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
    public String editTask(@Valid Task task, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return "editTask";
        }
        taskRepository.save(task);

        return "redirect:/tasks/all";
    }

    @PostMapping("delete/{id}")
    public String deleteTask(@PathVariable Long id){
        taskRepository.deleteById(id);
        return "redirect:/tasks/all";
    }

    @GetMapping("/show/{id}")
    public String showTask(@PathVariable Long id, Model model) {

        Optional<Task> optionalTask = taskRepository.findById(id);
        if(optionalTask.isPresent()) {
            Task task = optionalTask.get();
            model.addAttribute("task" , task);
        } return "showTask";
    }

    @GetMapping("/all")
    public String showAllTasks(Model model) {
        model.addAttribute("tasks", taskRepository.findAll());
        return "allTasks";
    }

    @ModelAttribute("tasks")
    public List<Task> getAll(){
       return taskRepository.findAll();
    }


    @ModelAttribute("categories")
    public List<Category> getAllCategories(){
        return categoryRepository.findAll();
    }
}

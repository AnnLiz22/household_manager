package pl.coderslab.task;

import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.category.Category;
import pl.coderslab.user_task.UserTask;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@ToString
@Table(name = "tasks")
public class Task implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(min = 3, max = 20)
    private String taskName;

    private String taskDescription;

    @ToString.Exclude
    @ManyToOne(fetch = FetchType.LAZY)
    private Category category;

    private LocalDateTime createdOn;

    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private LocalDate dueDate;

    @OneToMany(mappedBy = "task", cascade = CascadeType.ALL)
    private List<UserTask> usersTasks = new ArrayList<>();

    @PrePersist
    public void prePersist() {
        createdOn = LocalDateTime.now();
    }
}

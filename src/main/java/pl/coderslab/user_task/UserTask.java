package pl.coderslab.user_task;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.task.Task;
import pl.coderslab.user.User;
import pl.coderslab.user_task_comment.UserTaskComment;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@ToString
@Table(name = "user_tasks")
public class UserTask implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    private User user;

    @ManyToOne
    private Task task;

    private boolean isDone;

    @OneToMany(mappedBy = "userTask", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<UserTaskComment> userTaskComments = new ArrayList<>();

}

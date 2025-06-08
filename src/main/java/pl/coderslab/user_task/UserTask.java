package pl.coderslab.user_task;

import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.comment.Comment;
import pl.coderslab.task.Task;
import pl.coderslab.user.User;

import javax.persistence.*;
import java.io.Serializable;

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
    @NotNull
    private User user;

    @ManyToOne
    @NotNull
    private Task task;

    private boolean isDone;

    @OneToMany(mappedBy = "userTask", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<Comment> comments = new ArrayList<>();


}

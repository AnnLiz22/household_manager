package pl.coderslab.user_task_comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.comment.Comment;
import pl.coderslab.user_task.UserTask;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table
@Getter
@Setter
@ToString
public class UserTaskComment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    private UserTask userTask;

    @ManyToOne
    private Comment comment;

}

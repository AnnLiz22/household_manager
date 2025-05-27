package pl.coderslab.comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.user.User;
import pl.coderslab.user_task.UserTask;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Getter
@Setter
@ToString
@Table(name = "comments")
public class Comment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    private String comment;

    @ManyToOne
    private UserTask userTask;

    @ManyToOne
    private User user;
}

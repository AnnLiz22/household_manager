package pl.coderslab.comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.user_task_comment.UserTaskComment;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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

    @OneToMany(mappedBy = "comment", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<UserTaskComment> userTaskComments = new ArrayList<>();

}

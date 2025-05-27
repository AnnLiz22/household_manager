package pl.coderslab.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.user_task.UserTask;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@ToString
@Table(name = "users")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotNull
    private String name;
    private String role;


    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<UserTask> userTasks = new ArrayList<>();

}

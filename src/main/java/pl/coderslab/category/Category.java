package pl.coderslab.category;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.task.Task;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Getter
@Setter
@ToString
@Table(name="categories")
public class Category implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    private String category;

    @OneToMany
    private List<Task> task;

}

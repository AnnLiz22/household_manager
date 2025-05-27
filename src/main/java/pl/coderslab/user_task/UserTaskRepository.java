package pl.coderslab.user_task;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserTaskRepository extends JpaRepository<UserTask, Long> {
  List<UserTask> findByDoneIsFalse();
}

package pl.coderslab.user_task;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTaskRepository extends JpaRepository<UserTask, Long> {

    @Query("select t from UserTask t where t.isDone = false")
     List <UserTask> findByDoneIsFalse();

    @Query("select t from UserTask t where t.isDone = true")
     List <UserTask> findByDoneIsTrue(boolean isDone);
}

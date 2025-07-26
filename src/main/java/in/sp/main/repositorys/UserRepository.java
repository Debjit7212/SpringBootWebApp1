package in.sp.main.repositorys;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.entities.User;



public interface UserRepository extends JpaRepository<User, Integer>
{
 User findByEmail(String email) ;
	
	
 User findByResetToken(String token);

}

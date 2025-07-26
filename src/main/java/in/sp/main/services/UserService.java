package in.sp.main.services;

import in.sp.main.entities.User;

public interface UserService
{


public boolean registerUser(User user);
public User loginUser(String email,String pasword);
public boolean isEmailAlreadyRegistered(String email);
public User findByEmail(String email);
public void generateResetToken(String email);
public User getUserByResetToken(String token);
public boolean resetPassword(String token, String password);

}

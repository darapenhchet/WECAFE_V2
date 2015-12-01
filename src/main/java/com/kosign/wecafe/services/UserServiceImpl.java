package com.kosign.wecafe.services;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.entities.UserRole;
import com.kosign.wecafe.enums.Status;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public User findUserById(Long id) {
		try{
			return sessionFactory.getCurrentSession().get(User.class, id);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	@Transactional
	public User findUserByEmail(String email) {
		try{
			return  (User) sessionFactory.getCurrentSession().createCriteria(User.class)
								.add(Restrictions.eq("email", email))
								.uniqueResult();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	@Transactional
	public User findUserByUsername(String username) {
		try{
			return  (User) sessionFactory.getCurrentSession().createCriteria(User.class)
								.add(Restrictions.eq("username", username))
								.uniqueResult();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	@Transactional
	public Boolean saveUser(User user) {
		try{
			System.out.println(user.getPassword());
			user.setCreatedBy(this.findUserByUsername(getPrincipal()));
			user.setCreatedDate(new Date());
			user.setLastUpdatedBy(this.findUserByUsername(getPrincipal()));
			user.setLastUpdatedDate(new Date());
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			sessionFactory.getCurrentSession().save(user);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}
	
	@Override
	@Transactional
	public Boolean updateUser(User userUpdate) {
		try{
			//User user = (User) sessionFactory.getCurrentSession().get(User.class, newUser.getId());
			//user.setFirstName(newUser.getFirstName());
			//user.setLastName(newUser.getLastName());
			//user.set
			User user = (User) sessionFactory.getCurrentSession().get(User.class, userUpdate.getId());
			Long id = user.getUserRoles().iterator().next().getId();
			System.out.println(id);
			UserRole userRole = (UserRole) sessionFactory.getCurrentSession().get(UserRole.class, id);
			Set userRoles = new HashSet<UserRole>();
			userRoles.add(userRole);
			user.setLastUpdatedBy(this.findUserByUsername(getPrincipal()));
			user.setLastUpdatedDate(new Date());
			user.setEmail(userUpdate.getEmail());
			user.setFirstName(userUpdate.getFirstName());
			user.setLastName(userUpdate.getLastName());
			user.setStatus(userUpdate.getStatus());
			user.setUserRoles(userRoles);
			sessionFactory.getCurrentSession().saveOrUpdate(user);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}

	
	@Override
	@Transactional
	public List<User> getAllUsers(){
		try{
			return (List<User>)sessionFactory.getCurrentSession().createCriteria(User.class).list();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	@Transactional
	public List<UserRole> getAllUserRoles(){
		try{
			return (List<UserRole>)sessionFactory.getCurrentSession()
						.createCriteria(UserRole.class)
						.list();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	@Transactional
	public Boolean updateUserStatus(Long id){
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			User user = session.load(User.class, id);
			if(user.getStatus().equals(Status.ACTIVE)){
				user.setStatus(Status.INACTIVE);
			}else if(user.getStatus().equals(Status.INACTIVE)){
				user.setStatus(Status.ACTIVE);
			}else {
				user.setStatus(Status.ACTIVE);
			}
			user.setLastUpdatedDate(new Date());
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return false;
	}
	
	@Override
	@Transactional
	public Boolean deleteUser(Long id){
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			User user = session.load(User.class, id);
			user.setStatus(Status.DELETED);
			user.setLastUpdatedDate(new Date());
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return false;
	}
	
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}

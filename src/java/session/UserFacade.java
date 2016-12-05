package session;

import entity.Customer;
import entity.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class UserFacade extends AbstractFacade<User> {
    @PersistenceContext(unitName = "TrivaMarketPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    
    public User addUser(String username, String email, String password) {
        User user = new User();
        user.setPlainPassword(password);
        user.setUsername(username);

        em.persist(user);
        
        Customer customer = new Customer();
        customer.setEmail(email);
        customer.setUser(user);

        em.persist(customer);
        
        return user;
    }
    
}

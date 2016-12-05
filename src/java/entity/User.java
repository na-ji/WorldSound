package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author naji
 */
@Entity
@Table(name = "users__user")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
    @NamedQuery(name = "Product.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username")
})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @Basic(optional = false)
    @Column(name = "username")
    private String username;
    
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
    private Customer customer;

    /**
     *
     * @return
     */
    public String getUsername() {
        return username;
    }

    /**
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     *
     * @param password
     */
    public void setPlainPassword(String password) {
        this.password = this.hashPassord(password);
    }
    
    /**
     *
     * @param password
     * @return
     */
    public String hashPassord(String password) {
        return DigestUtils.sha256Hex(password);
    }

    /**
     *
     * @return Customer customer
     */
    public Customer getCustomer() {
        return customer;
    }

    /**
     *
     * @param customer Customer
     */
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.User[ username=" + username + " ]";
    }
    
}

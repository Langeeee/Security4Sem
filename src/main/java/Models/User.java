package Models;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.mindrot.jbcrypt.BCrypt;

public class User {
    private String username;
    private String email;
    private String password;
    private String role;
    private static String pepper;
    
    
    private static String chosePepper() throws Exception {
        InputStream in = User.class.getClassLoader().getResourceAsStream("pepper.properties");
        Properties props = new Properties();
        try { props.load(in);
        return props.getProperty("pepper");
        }
        catch (IOException e) {
        }
        throw new Exception("Pepper not found");
    }
    

    public User(String username, String password, String email, String role) throws Exception {
        pepper = chosePepper();
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public boolean checkPassword(String plainPass, String storedPass) {
        return BCrypt.checkpw(pepper + plainPass, storedPass);
    }

     public void setPassword(String password) {
        this.password = BCrypt.hashpw(pepper + password, BCrypt.gensalt(16));
    }
}

package model;
import java.util.List;

public class LoginCheck {
    public boolean execute(String name, String rawPass, List<User> userList) {
        String hashedPass = HashUtil.toSHA256(rawPass);
        for (User u : userList) {
            if (u.getName().equals(name) && u.getPass().equals(hashedPass)) {
                return true;
            }
        }
        return false;
    }
}
package model;
import java.util.List;

public class RegistCheck {
    public boolean execute(String name, String rawPass, List<User> userList) {
        for (User u : userList) {
            if (u.getName().equals(name)) {
                return false;
            }
        }
        String hashedPass = HashUtil.toSHA256(rawPass);
        userList.add(new User(name, hashedPass));
        return true;
    }
}
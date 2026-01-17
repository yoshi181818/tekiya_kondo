package model; // ここを変更したよ
import java.io.Serializable;

public class User implements Serializable {
    private String name;
    private String pass;
    private int score;
    private boolean played;

    public User() {}
    public User(String name, String pass) {
        this.name = name;
        this.pass = pass;
        this.score = 0;
        this.played = false;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }
    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
    public boolean isPlayed() { return played; }
    public void setPlayed(boolean played) { this.played = played; }
}
package model;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class GameLogic {
    // 10点x1, 3点x1, 2点x2, 1点x3, 0点x3
    private static final int[] POINTS = {10, 3, 2, 2, 1, 1, 1, 0, 0, 0};

    public int draw() {
        List<Integer> box = new ArrayList<>();
        for (int p : POINTS) box.add(p);
        Collections.shuffle(box);
        return box.get(0);
    }
}
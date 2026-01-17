package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class OrderList implements Serializable {
    private List<String> list; // 注文リスト

    public OrderList() {
        this.list = new ArrayList<>();
    }

    // 注文を追加する
    public void setOrder(String menu) {
        list.add(menu);
    }

    // 次に作る料理（先頭）を取得する
    // まだ注文がない場合は "注文なし" を返す
    public String getNextOrder() {
        if (list.size() > 0) {
            return list.get(0);
        }
        return "注文なし";
    }

    // 現在の待ち人数を取得する
    public int getOrderNum() {
        return list.size();
    }

    // 完成した料理（先頭）をリストから削除する
    public void removeOrder() {
        if (list.size() > 0) {
            list.remove(0);
        }
    }
}
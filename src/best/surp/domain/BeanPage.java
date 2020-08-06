package best.surp.domain;
/*
 * @PackageName:best.surp.domain
 * @ClassName:BeanPage
 * @description:
 * @author Surp
 * @date:2020/8/6 16:49
 */

import java.util.List;

public class BeanPage {
    private int rows = 3;
    private int currentPage;
    private int totalPage;
    private int totalCount;
    private int displayPage =5;
    private int halfPage =(int)(displayPage-1)/2;

    public int getHalfPage() {
        return halfPage;
    }

    public void setHalfPage(int halfPage) {
        this.halfPage = halfPage;
    }

    private List<User> users;

    public int getDisplayPage() {
        return displayPage;
    }

    public void setDisplayPage(int displayPage) {
        this.displayPage = displayPage;
    }

    public BeanPage(){}
    public int getRows() {
        return rows;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    @Override
    public String toString() {
        return "BeanPage{" +
                "rows=" + rows +
                ", currentPage=" + currentPage +
                ", totalPage=" + totalPage +
                ", totalCount=" + totalCount +
                ", users=" + users +
                '}';
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}

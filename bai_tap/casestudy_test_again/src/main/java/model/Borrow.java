package model;

public class Borrow {
    private int id;
    private int id_student;
    private int id_book;
    private String borrow_date;
    private String return_date;

    public Borrow() {
    }

    public Borrow(int id, int id_student, int id_book, String borrow_date, String return_date) {
        this.id = id;
        this.id_student = id_student;
        this.id_book = id_book;
        this.borrow_date = borrow_date;
        this.return_date = return_date;
    }

    public Borrow(int id_student, int id_book, String borrow_date, String return_date) {
        this.id_student = id_student;
        this.id_book = id_book;
        this.borrow_date = borrow_date;
        this.return_date = return_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_student() {
        return id_student;
    }

    public void setId_student(int id_student) {
        this.id_student = id_student;
    }

    public int getId_book() {
        return id_book;
    }

    public void setId_book(int id_book) {
        this.id_book = id_book;
    }

    public String getBorrow_date() {
        return borrow_date;
    }

    public void setBorrow_date(String borrow_date) {
        this.borrow_date = borrow_date;
    }

    public String getReturn_date() {
        return return_date;
    }

    public void setReturn_date(String return_date) {
        this.return_date = return_date;
    }

}

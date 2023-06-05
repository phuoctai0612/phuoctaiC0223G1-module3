package model;

public class Book {
    private int id;
    private String title;
    private int page_size;

    private Authors author_id;
    private CateGory cate_gory_id;


    public Book() {
    }

    public Book(String title, int page_size, Authors author_id, CateGory cate_gory_id) {
        this.title = title;
        this.page_size = page_size;
        this.author_id = author_id;
        this.cate_gory_id = cate_gory_id;
    }


    public Book(int id, String title, int page_size, Authors author_id, CateGory cate_gory_id) {
        this.id = id;
        this.title = title;
        this.page_size = page_size;
        this.author_id = author_id;
        this.cate_gory_id = cate_gory_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPage_size() {
        return page_size;
    }

    public void setPage_size(int page_size) {
        this.page_size = page_size;
    }

    public Authors getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(Authors author_id) {
        this.author_id = author_id;
    }

    public CateGory getCate_gory_id() {
        return cate_gory_id;
    }

    public void setCate_gory_id(CateGory cate_gory_id) {
        this.cate_gory_id = cate_gory_id;
    }
}

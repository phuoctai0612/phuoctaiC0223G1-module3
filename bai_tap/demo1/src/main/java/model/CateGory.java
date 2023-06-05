package model;

public class CateGory {
    private int id;
    private String name;

    public CateGory() {
    }

    public CateGory(int id) {
        this.id = id;
    }

    public CateGory(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

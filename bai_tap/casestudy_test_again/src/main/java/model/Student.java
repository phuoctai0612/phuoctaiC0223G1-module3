package model;

public class Student {
    private int id;
    private String name_student;
    private String birthday;
    private String class_name;

    public Student() {
    }

    public Student(int id, String name_student, String birthday, String class_name) {
        this.id = id;
        this.name_student = name_student;
        this.birthday = birthday;
        this.class_name = class_name;
    }

    public Student(String name_student, String birthday, String class_name) {
        this.name_student = name_student;
        this.birthday = birthday;
        this.class_name = class_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName_student() {
        return name_student;
    }

    public void setName_student(String name_student) {
        this.name_student = name_student;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }
}

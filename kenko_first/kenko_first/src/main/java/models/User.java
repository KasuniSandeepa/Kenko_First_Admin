package models;

public class User {

    private int Id;
    private String Name;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public User(int id, String name) {
        Id = id;
        Name = name;
    }

}

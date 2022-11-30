package com.me.DenSys.app.DTO;

public class LoginPassword {
    private String loginn;
    private String password;

    public LoginPassword(String login, String password) {
        this.loginn = login;
        this.password=password;
    }

    public String getLogin() {
        return loginn;
    }

    public void setLogin(String login) {
        this.loginn = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

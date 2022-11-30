package com.me.DenSys.app.DTO;

public class LoginDetails {
    private String login;
    private String password;

    public LoginDetails(String login, String password) {
        this.login = login;
        this.password = password;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String iinOremail) {
        this.login = iinOremail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

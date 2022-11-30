package com.me.DenSys.app.DTO;

public class LoginDetails {
    private String login;
    private String password;

    public LoginDetails(String iinOremail, String password) {
        this.login = iinOremail;
        this.password = password;
    }

    public String getIinOremail() {
        return login;
    }

    public void setIinOremail(String iinOremail) {
        this.login = iinOremail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

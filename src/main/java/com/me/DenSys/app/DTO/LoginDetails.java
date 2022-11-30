package com.me.DenSys.app.DTO;

public class LoginDetails {
    private String iinOremail;
    private String password;

    public LoginDetails(String iinOremail, String password) {
        this.iinOremail = iinOremail;
        this.password = password;
    }

    public String getIinOremail() {
        return iinOremail;
    }

    public void setIinOremail(String iinOremail) {
        this.iinOremail = iinOremail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

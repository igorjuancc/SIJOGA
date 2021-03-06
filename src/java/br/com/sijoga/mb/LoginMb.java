package br.com.sijoga.mb;

import br.com.sijoga.bean.Advogado;
import br.com.sijoga.facade.LoginFacade;
import br.com.sijoga.util.Seguranca;
import br.com.sijoga.util.SijogaUtil;
import java.io.IOException;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.inject.Named;

@ManagedBean
@Named(value = "loginMb")
@SessionScoped
public class LoginMb implements Serializable {
    private String email;
    private String senha;
    private int tipoLogin;
    private Advogado advogado = new Advogado();

    public LoginMb() {
    }

    public void efetuaLogin() {
        try {
            ExternalContext ctxExt = FacesContext.getCurrentInstance().getExternalContext();
            FacesContext ctx = FacesContext.getCurrentInstance();
            FacesMessage msg;

            switch (this.tipoLogin) {
                case 1:
                    this.advogado.setSenha(Seguranca.md5(this.senha));
                    this.advogado.setEmail(this.email);
                    this.advogado = LoginFacade.loginAdvogado(this.advogado);

                    if (this.advogado != null) {
                        ctxExt.redirect(ctxExt.getRequestContextPath() + "/Advogado/InicioAdvogado.jsf");
                    } else {
                        this.senha = "";
                        this.advogado = new Advogado();
                        msg = SijogaUtil.emiteMsg("Usuario ou Senha Inválido!", 3);
                        ctx.addMessage(null, msg);
                    }
                    break;
                case 2:
                    break;
                case 3:
                    break;
            }
        } catch (Exception e) {
            try {
                SijogaUtil.mensagemErroRedirecionamento(e);
            } catch (IOException ex) {
                Logger.getLogger(LoginMb.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void logout() {
        try {
            ExternalContext ctxExt = FacesContext.getCurrentInstance().getExternalContext();
            if ((this.advogado.getId() != 0)) {
                ctxExt.invalidateSession();
                ctxExt.redirect(ctxExt.getRequestContextPath() + "/index.jsf");
            }
        } catch (Exception e) {
            try {
                SijogaUtil.mensagemErroRedirecionamento(e);
            } catch (IOException ex) {
                Logger.getLogger(LoginMb.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getTipoLogin() {
        return tipoLogin;
    }

    public void setTipoLogin(int tipoLogin) {
        this.tipoLogin = tipoLogin;
    }

    public Advogado getAdvogado() {
        return advogado;
    }

    public void setAdvogado(Advogado advogado) {
        this.advogado = advogado;
    }
}

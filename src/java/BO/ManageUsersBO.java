package BO;

public class ManageUsersBO {

    private String _email;
    private String _fnm;
    private String _lnm;
    private String _pass;
    private String _newsFrom;
    private String _photo;
    private int _Flag;

    public String getPhoto() {
        return _photo;
    }

    public void setPhoto(String _photo) {
        this._photo = _photo;
    }

    public String getEmail() {
        return _email;
    }

    public void setEmail(String _email) {
        this._email = _email;
    }

    public String getFnm() {
        return _fnm;
    }

    public void setFnm(String _fnm) {
        this._fnm = _fnm;
    }

    public String getLnm() {
        return _lnm;
    }

    public void setLnm(String _lnm) {
        this._lnm = _lnm;
    }

    public String getPass() {
        return _pass;
    }

    public void setPass(String _pass) {
        this._pass = _pass;
    }

    public String getNewsFrom() {
        return _newsFrom;
    }

    public void setNewsFrom(String _newsFrom) {
        this._newsFrom = _newsFrom;
    }

    public int getFlag() {
        return _Flag;
    }

    public void setFlag(int _Flag) {
        this._Flag = _Flag;
    }
}

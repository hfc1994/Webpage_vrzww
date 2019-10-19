package com.vrzww.po;

import java.util.Date;

public class Comment {

    private Integer cid;

    private Integer uid;

    private Integer aid;

    private Integer pid;

    private String content;

    private Date posttime;

    private String isleaf;

    private String deletestate;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getPosttime() {
        return posttime;
    }

    public void setPosttime(Date posttime) {
        this.posttime = posttime;
    }

    public String getIsleaf() {
        return isleaf;
    }

    public void setIsleaf(String isleaf) {
        this.isleaf = isleaf == null ? null : isleaf.trim();
    }

    public String getDeletestate() {
        return deletestate;
    }

    public void setDeletestate(String deletestate) {
        this.deletestate = deletestate == null ? null : deletestate.trim();
    }
}
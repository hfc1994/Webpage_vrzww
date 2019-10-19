package com.vrzww.po;

import java.util.Date;

public class Article {
  
    private Integer aid;

    private String source;

    private String author;

    private Date publishtime;

    private String title;

    private Integer likes;

    private String deletestate;

    private String content;
    
    private String mainpic;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Date getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(Date publishtime) {
        this.publishtime = publishtime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    public String getDeletestate() {
        return deletestate;
    }

    public void setDeletestate(String deletestate) {
        this.deletestate = deletestate == null ? null : deletestate.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

	public String getMainpic() {
		return mainpic;
	}

	public void setMainpic(String mainpic) {
		this.mainpic = mainpic;
	}
    
}
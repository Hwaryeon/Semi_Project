package com.kh.sp.project.model.vo;

import java.sql.Date;

public class Attachment2 implements java.io.Serializable{
	
	private int bid;
	private int pid;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevle;
	private int downloadCount;
	private String status;
	
	public Attachment2() {}
	
	@Override
	public String toString() {
		return "Attachment [bid"+"=" + bid + ", pid=" + pid + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileLevle=" + fileLevle + ", downloadCount=" + downloadCount + ", status=" + status + "]";
	}

	public Attachment2( int bid, int pid, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevle, int downloadCount, String status) {
		super();
		
		this.bid = bid;
		this.pid = pid;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevle = fileLevle;
		this.downloadCount = downloadCount;
		this.status = status;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}


	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getFileLevle() {
		return fileLevle;
	}
	public void setFileLevle(int fileLevle) {
		this.fileLevle = fileLevle;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}

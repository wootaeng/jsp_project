package jsp.file;

public class FileDto {
	private int num;
	private String writer;
	private String title;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private String regdate;
	private int StratRowNum;
	private int EndRowNum;
	
	public FileDto() {}

	public FileDto(int num, String writer, String title, String orgFileName, String saveFileName, long fileSize,
			String regdate, int stratRowNum, int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		StratRowNum = stratRowNum;
		EndRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String gettitle() {
		return title;
	}

	public void settitle(String title) {
		this.title = title;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStratRowNum() {
		return StratRowNum;
	}

	public void setStratRowNum(int stratRowNum) {
		StratRowNum = stratRowNum;
	}

	public int getEndRowNum() {
		return EndRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		EndRowNum = endRowNum;
	}
	
	
	
}

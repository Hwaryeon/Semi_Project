package com.kh.sp.project.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.sp.project.model.dao.ProjectDao;
import com.kh.sp.project.model.vo.Application;
import com.kh.sp.project.model.vo.Attachment2;

import static com.kh.sp.common.JDBCTemplate.*;
public class ProjectService {

	public int insertProject(Application a) {
			
			Connection con = getConnection();
			int result = new ProjectDao().insertProject(con,a);
			
			if(result > 0) {
				commit(con);
			}
			else {
				rollback(con);
			}
			
			close(con);
			
			
			return result;
	}

	public int insertThumbnail(Application a, ArrayList<Attachment2> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		
		
		int result1 = new ProjectDao().insertThumbnailContent(con,a);
		
		//System.out.println("result1="+result1);
		
		if(result1 > 0) {
			int pid = new ProjectDao().selectCurrval(con);
			
			for(int i = 0; i<fileList.size(); i++) {
				fileList.get(i).setPid(pid);
			}
		}
		
		int result2 = new ProjectDao().insertAttachment(con,fileList);
		
		/*int result3 = new ProjectDao().insertAttachment2(con, fileList);
		
		int result4 = new ProjectDao().insertAttachment3(con, fileList);*/
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}

package com.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.model.Student;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		if(isCheck(request.getRequestURI())){
			Map<String, Object> session = actionInvocation
					.getInvocationContext().getSession();
			Student student = (Student)session.get("student");
			if(student == null){
				return Action.LOGIN;
			}
		
		}
		return actionInvocation.invoke();
	}
		private boolean isCheck(String path){
			if(path.endsWith("/Login.action")){
				return false;
			}
			return true;
		}
}

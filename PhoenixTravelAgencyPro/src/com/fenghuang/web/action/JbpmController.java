/**
 * 
 */
package com.fenghuang.web.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbpm.api.task.Task;

import org.springframework.stereotype.Controller;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-7-16
 *
 * 描述 ：
 *
 *
 */

@Controller
public class JbpmController {
	
	private JbpmUtil  jbpmUtil = new JbpmUtil();
	
	//可以设置动态的部署 审批流程   可以通过上传文件的形式来 部署jpdl
	public String deployJbpmJpdl(HttpServletRequest request,HttpServletResponse response){
		//在这里可以通过资源包来 部署 jpdl
		jbpmUtil.getRepositoryService().createDeployment().addResourceFromClasspath("loan.jpdl.xml").deploy();
		return "";
	}
	//删除部署的流程定义
	public String deleteDeploymentJbpmJpbl(HttpServletRequest request,HttpServletResponse response,String deploymentId){
		jbpmUtil.getRepositoryService().deleteDeployment(deploymentId);
		return "";
	}
    //将用户的业务 提交给流程，并开始执行该审批流程
	public String submitJbpmStart(HttpServletRequest request,HttpServletResponse response,String processInstanceId){
		//提交流程  new HashMap里的 用户自定参数，主要是处理jpdl中的参数
		jbpmUtil.getExecutionService().startProcessInstanceById(processInstanceId,new HashMap());
		return "";
	}
	
	//根据不同的条件查询流程定义
	public String processDefinitionSelect(){
		jbpmUtil.getRepositoryService().createProcessDefinitionQuery().list();
		
		return "";
	}
	//根据不同的条件查询流程的实例
	public String processInstanceSelect(){
		jbpmUtil.getExecutionService().createProcessInstanceQuery().list();
		return "";
	}
	
	//根据用户来查询该用户的所有代办任务
	public String getTaskByUser(){
		jbpmUtil.getTaskService().findPersonalTasks("用户名");
		return "";
	}
	
	//执行 是否审批通过
	public String completeTask(String taskId){
		Task task = jbpmUtil.getTaskService().getTask("");
		//taskService.completeTask("taskId", "下个节点",用户的map参数集合 );
		return "";
	}

}

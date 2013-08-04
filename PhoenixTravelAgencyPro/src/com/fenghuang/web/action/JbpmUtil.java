/**
 * 
 */
package com.fenghuang.web.action;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.HistoryService;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;
import org.jbpm.api.TaskService;

/**
 * @author 鲍国浩
 * 
 * 版本 ： 1.0
 * 
 * 日期 ：2013-7-17
 *
 * 描述 ：
 *
 *
 */
public class JbpmUtil {
	//审批流 进程引擎
	private  ProcessEngine processEngine =Configuration.getProcessEngine();
	//审批流 资源库服务
	private RepositoryService repositoryService=processEngine.getRepositoryService();
    //审批流  执行过程服务
	private  ExecutionService executionService=processEngine.getExecutionService();
	//审批流 的任务服务
	private TaskService taskService=processEngine.getTaskService();
	//审批流的历史服务
	private HistoryService historyService = processEngine.getHistoryService();
	/**
	 * @return the processEngine
	 */
	public ProcessEngine getProcessEngine() {
		return processEngine;
	}
	/**
	 * @param processEngine the processEngine to set
	 */
	public void setProcessEngine(ProcessEngine processEngine) {
		this.processEngine = processEngine;
	}
	/**
	 * @return the repositoryService
	 */
	public RepositoryService getRepositoryService() {
		return repositoryService;
	}
	/**
	 * @param repositoryService the repositoryService to set
	 */
	public void setRepositoryService(RepositoryService repositoryService) {
		this.repositoryService = repositoryService;
	}
	/**
	 * @return the executionService
	 */
	public ExecutionService getExecutionService() {
		return executionService;
	}
	/**
	 * @param executionService the executionService to set
	 */
	public void setExecutionService(ExecutionService executionService) {
		this.executionService = executionService;
	}
	/**
	 * @return the taskService
	 */
	public TaskService getTaskService() {
		return taskService;
	}
	/**
	 * @param taskService the taskService to set
	 */
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	/**
	 * @return the historyService
	 */
	public HistoryService getHistoryService() {
		return historyService;
	}
	/**
	 * @param historyService the historyService to set
	 */
	public void setHistoryService(HistoryService historyService) {
		this.historyService = historyService;
	}
	
	

}

<%@ page contentType="text/html;charset=MS949"  import="org.apache.log4j.Logger" %>

<%!
	static Logger logger = Logger.getLogger("test.jsp");
%>

<%
	logger.fatal("fatal!!");

	logger.fatal("fatal2!!", new NullPointerException("널입니다요"));

	logger.error("error!", new NumberFormatException());

	logger.error("error!2");

	logger.warn("warn");

	logger.info("info");

	logger.debug("debug");
%>
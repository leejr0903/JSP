package index;

import org.apache.commons.logging.Log;  
import org.apache.commons.logging.LogFactory;  

public class CommonLoggingTest {
	  
	  private static final Log logger = LogFactory.getLog(CommonLoggingTest.class);  
      
	    public static void main(String[] args) {  
	          
	        if (logger.isDebugEnabled()) {  
	            logger.debug("main(String[]) -DEBUG");  
	        }  
	  
	        if (logger.isInfoEnabled()) {  
	            logger.info("main(String[]) -INFO");  
	        }  
	  
	        if (logger.isWarnEnabled()) {  
	            logger.warn("main(String[]) -WARN");  
	        }         
	  
	        if (logger.isErrorEnabled()) {  
	            logger.error("main(String[]) -ERROR");  
	        }         
	  
	        if (logger.isFatalEnabled()) {  
	            logger.fatal("main(String[]) -FATAL");  
	        }  
	    }  
}

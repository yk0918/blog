import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.Users;
import service.impl.UsersServiceImpl;

import java.util.List;

public class demo1 {
    Logger logger=Logger.getLogger(demo1.class);
    @Test
    public void test1(){
        ApplicationContext ctx=new ClassPathXmlApplicationContext("springmvc-config.xml");
        String[] names=ctx.getBeanDefinitionNames();
        UsersServiceImpl usersService= (UsersServiceImpl) ctx.getBean("usersService");
        List<Users> usersList= usersService.selectAll();
        for (Users u:usersList
             ) {
            logger.debug(u.toString());
        }

    }
}

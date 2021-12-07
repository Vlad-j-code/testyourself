package com.testyourself.db;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.testyourself.db.daos.DAOFactory;
import com.testyourself.db.dtos.Answer;
import org.apache.log4j.PropertyConfigurator;
import org.apache.naming.java.javaURLContextFactory;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;

public class TestAnswerDAO {
    static Context context;

    @BeforeClass
    public static void setupBeforeClass() throws Exception {
        MysqlConnectionPoolDataSource ds = new MysqlConnectionPoolDataSource();
        PropertyConfigurator.configure("E:/JavaAndTesting/JavaCodeVariants/tomcat8serv/src/main/webapp/WEB-INF/log4j.properties");
        ds.setURL("jdbc:mysql://localhost:3306/testingsysdb");
        ds.setUser("site");
        ds.setPassword("site");

        DataSource dataSource = ds;
        System.setProperty(Context.INITIAL_CONTEXT_FACTORY, javaURLContextFactory.class.getName());
        context = new InitialContext();
        Context ctx = context.createSubcontext("java");
        ctx.createSubcontext("comp").createSubcontext("env").createSubcontext("jdbc")
                .bind("testingsysdb", dataSource);
        context.bind("java:", ctx);
    }

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
        context.destroySubcontext("java");
        context.unbind("java:");
        context.close();
    }

    @Test
    public void findByQuestionIdTest() throws Exception {
        List<Answer> answers = DAOFactory.getAnswerDAO().findByQuestionId(54L);
        assertNotNull(answers.size());
    }

    @Test
    public void findAnswerTest() throws Exception {
        Answer answer = DAOFactory.getAnswerDAO().find(41L);
        assertEquals(answer.getName(), "Free fall metal ball");
    }


    @Test
    public void updateAnswerTest() throws Exception {
        DAOFactory.getAnswerDAO().update(41L, "Free fall metal ball", true);
        Answer answer = DAOFactory.getAnswerDAO().find(41L);
        assertEquals(answer.getName(), "Free fall metal ball");
    }

    @Test
    public void insertAnswerTest() throws Exception {
        List<Answer> answers = DAOFactory.getAnswerDAO().findByQuestionId(42L);
        int size = answers.size();
        DAOFactory.getAnswerDAO().insert("Calculation of metal strength", 42L, false);
        List<Answer> answersAfter = DAOFactory.getAnswerDAO().findByQuestionId(42L);
        assertEquals(answersAfter.size(), size+1);
    }

    @Test
    public void deleteAnswerTest() throws Exception {
        List<Answer> answers = DAOFactory.getAnswerDAO().findByQuestionId(54L);
        int size = answers.size();
        DAOFactory.getAnswerDAO().delete(54L);
        List<Answer> answersAfter = DAOFactory.getAnswerDAO().findByQuestionId(54L);
        assertEquals(answersAfter.size(), size);
    }

}

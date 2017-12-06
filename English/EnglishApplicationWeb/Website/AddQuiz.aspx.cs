using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTest : System.Web.UI.Page
{
    AccountDAO accDAO = new AccountDAO();
    AnswerDAO ansDAO = new AnswerDAO();
    QuizDAO qDAO = new QuizDAO();
    TestDAO tDAO = new TestDAO();

    WebMessageBox aa = new WebMessageBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        int testID = int.Parse(Request["IDTEST"]);
        Session["IDTEST"] = testID;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int idTest = (int)Session["IDTEST"];
        
        Answer a1 = new Answer
        {
            Details = txtAns1.Text
        };
        Answer a2 = new Answer
        {
            Details = txtAns2.Text
        };
        Answer a3 = new Answer
        {
            Details = txtAns3.Text
        };
        Answer a4 = new Answer
        {
            Details = txtAns4.Text
        };
        //boolean
        ansDAO.addAnswer(a1);
        a1.AnswerID = ansDAO.getNewestAnswerID();
        ansDAO.addAnswer(a2);
        a2.AnswerID = ansDAO.getNewestAnswerID();
        ansDAO.addAnswer(a3);
        a3.AnswerID = ansDAO.getNewestAnswerID();
        ansDAO.addAnswer(a4);
        a4.AnswerID = ansDAO.getNewestAnswerID();
        //
        Quiz q = new Quiz
        {
            QuizDetails = txtQues.Text,
            QuizAdderID = "admin",
            CorrectAnswerID = a1.AnswerID
        };
        qDAO.addQuiz(q); 
        int quizID = qDAO.getLastQuizID();
        qDAO.addQuizManage(quizID, a1.AnswerID);
        qDAO.addQuizManage(quizID, a2.AnswerID);
        qDAO.addQuizManage(quizID, a3.AnswerID);
        qDAO.addQuizManage(quizID, a4.AnswerID);
        
        int result = tDAO.addTestControl(quizID, idTest);
        txtQues.Text = idTest + " " + result;
        Response.Redirect("ViewTest.aspx");
    }

    protected void btnAddQuiz_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
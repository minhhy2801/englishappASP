using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReviewTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (q1.Text == "")
            loadPage();
    }
    protected void loadPage()
    {
        QuizDAO qdao = new QuizDAO();
        TestDAO tdao = new TestDAO();
        List<Quiz> showData = new List<Quiz>();
        string doer = (string)Session["ID"];//getSession
        int testNumber = 0;
        if (Request["IDQUIZREVIEW"] != null)
        {
            testNumber = int.Parse(Request["IDQUIZREVIEW"]);
        }
        else
        {
            testNumber = (int)Session["TESTID"];
        }
        Session["TESTID"] = null;
        LabelResult.Text = tdao.getReviewScore(doer, testNumber)[0];
        showData = qdao.getReview(doer, testNumber); //need attention
        Label[] labelUserAnswerList = { ya1, ya2, ya3, ya4, ya5, ya6, ya7, ya8, ya9, ya10, ya11, ya12, ya13, ya14, ya15, ya16, ya17, ya18, ya19, ya20 };
        Label[] labelCorrectAnswerList = { ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8, ca9, ca10, ca11, ca12, ca13, ca14, ca15, ca16, ca17, ca18, ca19, ca20 };
        Label[] labelQuestionList = { q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20 };


        for (int i = 0; i < 20; i++)
        {
            labelQuestionList[i].Text = showData[i].QuizDetails;

            if (showData[i].UserAnswer.Equals("Empty"))
            {
                labelUserAnswerList[i].Text = "You didn't do this question! ";
                labelCorrectAnswerList[i].Text = "Correct answer: " + showData[i].CorrectAnswer;
            }
            else
            {
                if (showData[i].UserAnswer.Equals(showData[i].CorrectAnswer))
                {
                    labelUserAnswerList[i].Text = "Your answer: " + showData[i].UserAnswer;
                    labelCorrectAnswerList[i].Text = "Your answer is correct!";
                    labelCorrectAnswerList[i].ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    labelUserAnswerList[i].Text = "Your answer: " + showData[i].UserAnswer;
                    labelCorrectAnswerList[i].Text = "Correct answer: " + showData[i].CorrectAnswer;
                }
            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("AllTest.aspx");
    }
}
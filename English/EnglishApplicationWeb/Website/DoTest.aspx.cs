using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class DoTest : System.Web.UI.Page
{
    AccountDAO accDAO = new AccountDAO();
    AnswerDAO ansDAO = new AnswerDAO();
    QuizDAO qDAO = new QuizDAO();
    TestDAO tDAO = new TestDAO();

    Random ran = new Random();
    List<Quiz> list = new List<Quiz>();
    TestScore ts = new TestScore();
    WebMessageBox aaa = new WebMessageBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (q1.Text == "")
        {
            loadPage();
        }
    }

    protected void loadPage()
    {
        //DAO dao = new DAO();
        int testNumber = int.Parse(Request["IDQUIZDO"]);
      //  aaa.Show(testNumber + "");
        Session["TESTID"] = testNumber;
        int[] allQuiz = tDAO.getAllQuizOfTest(testNumber);
        //aaa.Show(allQuiz.Length + "");
        int largestQuizID = tDAO.getLargestQuizIdOfTest(testNumber);
        //aaa.Show(largestQuizID + "");
        
        //for (int i = 0; i < allQuiz.Length; i++)
        //{
        //    Label3.Text += allQuiz[i] + " ";
        //}
            //Label1.Text = "Num of Quiz: " + allQuiz.Length + " Thu tu: ";
            //Label1.Text = largestQuizID + "";
        var numbers = new List<int>();
        var number = ran.Next(1, largestQuizID);
        while (numbers.Count < 20)
        { //Nếu list chưa đủ 20 phần tử
            do {
                number = ran.Next(1, largestQuizID); 
            } while (numbers.Contains(number) || !allQuiz.Contains(number));
            numbers.Add(number); //Khi đã random được ra 1 số chưa có trong list thì add nó vào list
            Label1.Text += number + " ";
        }
        for (int i = 0; i < 20; i++)
        {
            list.Add(qDAO.getQuizDetail(numbers[i]));
        }
        RadioButtonList[] rbList = { RadioButtonList1, RadioButtonList2, RadioButtonList3, RadioButtonList4, RadioButtonList5, RadioButtonList6, RadioButtonList7, RadioButtonList8, RadioButtonList9, RadioButtonList10, RadioButtonList11, RadioButtonList12, RadioButtonList13, RadioButtonList14, RadioButtonList15, RadioButtonList16, RadioButtonList17, RadioButtonList18, RadioButtonList19, RadioButtonList20 };
        Label[] labeAnswerList = { a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20 };
        Label[] labelQuestionList = { q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20 };
        Label[] labeQuestionIDList = { aID1, aID2, aID3, aID4, aID5, aID6, aID7, aID8, aID9, aID10, aID11, aID12, aID13, aID14, aID15, aID16, aID17, aID18, aID19, aID20 };
        for (int i = 0; i < 20; i++)
        {
            string[] answer = null;
            labelQuestionList[i].Text = "Quiz " + (i + 1) + ": (Detail)" + list[i].QuizDetails;
            labeAnswerList[i].Text = list[i].CorrectAnswer;
            labeAnswerList[i].Visible = false;
            labeQuestionIDList[i].Text = list[i].QuizID + "";
            labeQuestionIDList[i].Visible = false;
            answer = qDAO.getAllAnswerOfQuiz(numbers[i]);
            loadAnswer(rbList[i], answer);
        }
        
        if (Session["CountdownTimer"] == null)
        {
            Session["CountdownTimer"] = new CountDownTimer(TimeSpan.Parse("00:30:00"));
            (Session["CountdownTimer"] as CountDownTimer).Start();
        }
    }
    
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (Session["CountdownTimer"] != null)
        {
            Label2.Text = (Session["CountdownTimer"] as CountDownTimer).TimeLeft.ToString();
            if (Label2.Text.Equals("00:00:00"))
            {
                submitJob();
            }
        }
    }

    public void loadAnswer(RadioButtonList rb, string[] answer)
    {
        var numbers = new List<int>();
        var number = ran.Next(0, 4);
        while (numbers.Count < 4)
        { //Nếu list chưa đủ 20 phần tử
            while (numbers.Contains(number))
            { //Kiểm tra xem nếu phần tử này đã có trong list
                number = ran.Next(0, 4); //Nếu có trong list thì lại random ra 1 số khác
            }
            numbers.Add(number); //Khi đã random được ra 1 số chưa có trong list thì add nó vào list
            rb.Items.Add(answer[number]);
        }
    }

    public void submitJob()
    {

        String timeLeft = (Session["CountdownTimer"] as CountDownTimer).TimeLeft.ToString();
        String minute = timeLeft.Split(':').GetValue(1).ToString();
        String second = timeLeft.Split(':').GetValue(2).ToString();
        int minuteInt = 29 - int.Parse(minute);
        int secondInt = 59 - int.Parse(second);
        Session["CountdownTimer"] = null;
        int score = 0;
       // DAO dao = new DAO();
        int testNumber = (int)Session["TESTID"];
        RadioButtonList[] rbList = { RadioButtonList1, RadioButtonList2, RadioButtonList3, RadioButtonList4, RadioButtonList5, RadioButtonList6, RadioButtonList7, RadioButtonList8, RadioButtonList9, RadioButtonList10, RadioButtonList11, RadioButtonList12, RadioButtonList13, RadioButtonList14, RadioButtonList15, RadioButtonList16, RadioButtonList17, RadioButtonList18, RadioButtonList19, RadioButtonList20 };
        Label[] labeAnswerList = { a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20 };
        Label[] labelQuestionList = { q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20 };
        Label[] labeQuestionIDList = { aID1, aID2, aID3, aID4, aID5, aID6, aID7, aID8, aID9, aID10, aID11, aID12, aID13, aID14, aID15, aID16, aID17, aID18, aID19, aID20 };
        int[] quizIDList = new int[20];
        for (int i = 0; i < 20; i++)
        {
            if (rbList[i].SelectedIndex == 0 || rbList[i].SelectedIndex == 1 || rbList[i].SelectedIndex == 2 || rbList[i].SelectedIndex == 3)
            {
                if (rbList[i].SelectedValue.Equals(labeAnswerList[i].Text))
                {
                    score++;
                }
                else
                {
                    //labeAnswerList[i].Visible = true;
                }
                int result = ansDAO.getAnswerID(int.Parse(labeQuestionIDList[i].Text), rbList[i].SelectedValue);
                quizIDList[i] = int.Parse(labeQuestionIDList[i].Text);
                labeQuestionIDList[i].Text = "";
                labeQuestionIDList[i].Text = result + "";
            }
            else
            {
                int result = 0;
                quizIDList[i] = int.Parse(labeQuestionIDList[i].Text);
                labeQuestionIDList[i].Text = "";
                labeQuestionIDList[i].Text = result + "";
            }
        }
        //Label1.Text = "Score: " + score + ", Time do: " + minuteInt + ":" + secondInt;
        ts.AccountID = (string)Session["ID"]; //mai mot get session id roi sua lai
        ts.TestID = testNumber;//Text1
        DateTime now = DateTime.Now;
        //string sqlFormattedDateNow = now.Date.ToString("yyyy-MM-dd HH:mm:ss");
        string sqlFormattedDateNow = now.Year + "-" + now.Month + "-" + now.Day + " " + now.Hour + ":" + now.Minute + ":" + now.Second + "." + now.Millisecond;
        ts.TimeStart = sqlFormattedDateNow;
        ts.TimeDoTest = minuteInt + ":" + secondInt;
        ts.Score = score;
        ts.TimeDo = tDAO.getTop1TimeDo(testNumber, ts.AccountID) + 1;//(vidu) test1, id ng lam la admin
        bool sum = tDAO.addNewTestScore(ts);
        WebMessageBox wmb = new WebMessageBox();
        int idTestScore = tDAO.getTop1IDTestScore(testNumber, ts.AccountID);
        for (int i = 0; i < 20; i++)
        {
            try
            {
                tDAO.addTestReview(idTestScore, quizIDList[i], int.Parse(labeQuestionIDList[i].Text));
                if (i == 19)
                {
                    wmb.Show("Your score: " + score + "/20, Time do: " + minuteInt + ":" + secondInt);
                    Session["TESTDO"] = null;
                    Response.Redirect("ReviewTest.aspx");
                }
            }
            catch (Exception ex)
            {
            }
        }

    }

    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        submitJob();
    }

    protected void Label2_DataBinding(object sender, EventArgs e)
    {
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public class QuizDAO
{
    String strConnection = WebConfigurationManager.ConnectionStrings["XiSapAssignment1"].ToString();
    public QuizDAO()
    {

    }
    public Quiz getQuizDetail(int quizID)
    {

        Quiz result = new Quiz();
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select t1.Details as QuizDetails, t1.QuizID, t2.Details as AnswerDetails, t2.AnswerID from Quiz t1, Answer t2 where t1.AnswerID = t2.AnswerID and t1.QuizID=@quiz";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@quiz", quizID);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result.QuizDetails = (string)reader["QuizDetails"];
                result.CorrectAnswer = (string)reader["AnswerDetails"];
                result.QuizID = (int)reader["QuizID"];
                result.CorrectAnswerID = (int)reader["AnswerID"];
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return result;
    }

    public string[] getAllAnswerOfQuiz(int quizNum)
    {
        string[] result = new string[4];
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "Select t3.QuizID, t2.Details From QuizManage t3, Answer t2 Where t3.QuizID = @quizNum and t2.AnswerID = t3.AnswerID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@quizNum", quizNum);
        try
        {
            cnn.Open();
            int count = 0;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result[count] = (string)reader["Details"];
                count++;
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return result;
    }
    public bool addQuiz(Quiz q)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        string sql = "insert Quiz values(@Details, @AdderID, @AnsID)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@Details", q.QuizDetails);
        cmd.Parameters.AddWithValue("@AdderID", q.QuizAdderID);
        cmd.Parameters.AddWithValue("@AnsID", q.CorrectAnswerID);
        try
        {
            cnn.Open();
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return (count > 0);
    }
    public int addQuizManage(int quizID, int anserID)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        string sql = "insert QuizManage values(@ans, @quiz)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@ans", anserID);
        cmd.Parameters.AddWithValue("@quiz", quizID);
        try
        {
            cnn.Open();
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return count;
    }
    public int getLastQuizID()
    {
        int id = 0;
        string sql = "select top 1 QuizID from Quiz order by QuizID DESC";
        SqlConnection cnn = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(sql, cnn);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                id = (int)reader["QuizID"];
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return id;
    }

    public bool addQuizManage(List<Int32> ansID, int quizID)
    {
        int count = 0;
        string sql = "insert QuizManage (AnswerID, QuizID) values (@a1ID, @qID),(@a2ID, @qID), (@a3ID, @qID), (@a4ID, @qID)";
        SqlConnection cnn = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@a1ID", ansID[0]);
        cmd.Parameters.AddWithValue("@qID", quizID);
        cmd.Parameters.AddWithValue("@a2ID", ansID[1]);
        cmd.Parameters.AddWithValue("@a3ID", ansID[2]);
        cmd.Parameters.AddWithValue("@a4ID", ansID[3]);
        try
        {
            cnn.Open();
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return (count > 0);
    }

    public List<Quiz> getReview(string user, int numTest)
    {
        List<Quiz> finalResult = new List<Quiz>();
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select t1.QuestionDetail, t1.UserAnswerDetail, t3.Details as CorrectAnswer from (select t1.QuizID, t2.Details as UserAnswerDetail, t3.Details as QuestionDetail from TestReview t1, Answer t2, Quiz t3 where IDTestScore = (select top 1 IDTestScore from TestScore where AccountID = @id and TestID = @test order by TimeDo Desc) and t2.AnswerID = t1.AnswerID and t1.QuizID = t3.QuizID) t1, Quiz t2, Answer t3 where t1.QuizID = t2.QuizID and t2.AnswerID = t3.AnswerID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@id", user);
        cmd.Parameters.AddWithValue("@test", numTest);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Quiz result = new Quiz();
                result.QuizDetails = (string)reader["QuestionDetail"];
                result.UserAnswer = (string)reader["UserAnswerDetail"];
                result.CorrectAnswer = (string)reader["CorrectAnswer"];
                finalResult.Add(result);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return finalResult;
    }
    public int[] getNumOfAllQuiz()
    {
        int[] result = new int[99];
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select TestID, COUNT(QuizID) as numOfQuiz from TestControl group by TestID";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while (reader.Read())
            {
                result[count] = (int)reader["numOfQuiz"];
                count++;
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally
        {
            cnn.Close();
        }
        return result;
    }
}


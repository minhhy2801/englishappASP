using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Configuration;


public class AnswerDAO
    {
    String strConnection = WebConfigurationManager.ConnectionStrings["XiSapAssignment1"].ToString();
    public AnswerDAO()
    {

    }
    public int getAnswerID(int quizID, string answerDetails)
    {
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        String sql = "select t1.AnswerID from QuizManage t1, Answer t2 where t1.AnswerID = t2.AnswerID and t1.QuizID = @quiz And t2.Details = @answer";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@quiz", quizID);
        cmd.Parameters.AddWithValue("@answer", answerDetails);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = (int)reader["AnswerID"];
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
    public bool addAnswer(Answer a)
    {
        int count = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        string sql = "insert Answer values(@Details)";
        SqlCommand cmd = new SqlCommand(sql, cnn);
        cmd.Parameters.AddWithValue("@Details", a.Details);
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
    public int getNewestAnswerID()
    {
        string sql = "select top 1 AnswerID from Answer order by AnswerID DESC";
        int result = 0;
        SqlConnection cnn = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(sql, cnn);
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                result = (int)reader["AnswerID"];
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

    public List<Int32> get4Answer()
    {
        string sql = "select top 4 AnswerID from Answer order by AnswerID DESC";
        List<Int32> result = new List<Int32>();
        SqlConnection cnn = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(sql, cnn);
        Answer a = new Answer();
        try
        {
            cnn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                a.AnswerID = (int)reader["AnswerID"];
                result.Add(a.AnswerID);
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


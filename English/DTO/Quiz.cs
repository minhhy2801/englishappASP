using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Quiz
/// </summary>
public class Quiz
{
    public string QuizDetails { get; set; }
    public string CorrectAnswer { get; set; }
    public int QuizID { get; set; }
    public int CorrectAnswerID { get; set; }
    public string UserAnswer { get; set; }
    public string QuizAdderID { get; set; }
    public Quiz()
    {
        
    }
}
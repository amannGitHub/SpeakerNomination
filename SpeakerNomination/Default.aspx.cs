using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;



namespace SpeakerNomination
{
    
    public partial class _Default : System.Web.UI.Page
    {
       static string validate = "success";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtSummary.Attributes.Add("maxlength", txtSummary.MaxLength.ToString());
            }

            if (DateTime.Now >= new DateTime(2019, 7, 22))
            {
                speakerNomOpen.Visible = false;
                speakerNomClosed.Visible = true; 
            }
        }

        protected void InsertSpeakerNomination_Click(object sender, EventArgs e)
        {
            DropDownList nomineeType = FindControl("selNomineeType") as DropDownList;


            string ContactName_IN = txtContactName.Text;
            string ContactEmail_IN = txtContactEmail.Text;
            string Institute_IN = txtInstitute.Text;
            string NomineeName_IN = txtNomineeName.Text;
            string NomineeInstitution_IN = txtNomineeInstitution.Text;
            string ManuscriptTitle_IN = txtManuscriptTitle.Text;
            string ManuscriptLink_IN = txtManuscriptLink.Text;
            string GrantNumberTitle_IN = txtGrantNumberTitle.Text;
            string NomineeType_IN = selNomineeType.SelectedValue;
            string Summary_IN = txtSummary.Text;
            SpeakerNominationInsert(ContactName_IN, ContactEmail_IN, Institute_IN, NomineeName_IN, NomineeInstitution_IN, ManuscriptTitle_IN, ManuscriptLink_IN, GrantNumberTitle_IN, NomineeType_IN, Summary_IN);  
        }


        public static DataSet ExecuteCommand(ref SqlCommand Command)
        {
            
            string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DataSet ds = new DataSet();

            try
            {
                SqlConnection Connection = new SqlConnection(ConnectionString);
                Command.Connection = Connection;

                if (Command.CommandText.Contains(" "))
                {
                    Command.CommandType = CommandType.Text;
                }
                else
                {
                    Command.CommandType = CommandType.StoredProcedure;
                }

                SqlDataAdapter Adapter = new SqlDataAdapter(Command);
                Adapter.SelectCommand.CommandTimeout = 300;

                Adapter.Fill(ds);
                Connection.Close();

            }
            catch (Exception ex)
            {
                SpeakerError("Error executing stored procedure.<br />" + ex.Message);
                validate = "fail";
            }    
            return ds;
            
        }

        public void RedirectURL()
        {
            if (validate == "success")
            {
                HttpContext.Current.Response.Redirect("NominationConfirmation.aspx");
            }
            else
            {
                HttpContext.Current.Response.Redirect("Error.aspx");
            }
            
        }


        public static void SpeakerError(string ErrorMessage)
        {
            //BattelleLogDiagnostic("Error logged: " + ErrorMessage);
            ErrorSendMail(ErrorMessage, "scg", "OBSSR Speaker Nomination System Error", System.Net.Mail.MailPriority.High);
        }


        public static void ErrorSendMail(string Content, string Email, string Subject = "New Message", System.Net.Mail.MailPriority Priority = System.Net.Mail.MailPriority.Normal, string FromName = "OBSSR Speaker Nomination System", string FromEmail = "webmaster@scgcorp.com")
        {
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("mail.scgcorp.com");
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();

            mail.From = new System.Net.Mail.MailAddress(FromEmail, FromName, System.Text.Encoding.UTF8);
            if ((Email == "scg"))
            {
                mail.To.Add("amann@scgcorp.com");
            }
            else
            {
                mail.To.Add(new System.Net.Mail.MailAddress(Email));
                mail.To.Add(FromEmail);
            }

            mail.Subject = Subject;
            mail.Priority = Priority;

            mail.IsBodyHtml = true;
            mail.Body = Content;
            try
            {
                smtp.Send(mail);
            }
            finally
            {
                mail.Dispose();
                smtp = null;
            }

        }

        public void  SpeakerNominationInsert(string contactName, string contactEmail, string institute, string nomineeName, string nomineeInstitution, string manuscriptTitle, string manuscriptLink, string grantNumber, string nomineeType, string summaryManuscript)
        {
            SqlCommand Command = new SqlCommand("SpeakerNominationInsert");
            Command.Parameters.AddWithValue("contactName", contactName);
            Command.Parameters.AddWithValue("contactEmail", contactEmail);
            Command.Parameters.AddWithValue("institute", institute);
            Command.Parameters.AddWithValue("nomineeName", nomineeName);
            Command.Parameters.AddWithValue("nomineeInstitution", nomineeInstitution);
            Command.Parameters.AddWithValue("manuscriptTitle", manuscriptTitle);
            Command.Parameters.AddWithValue("manuscriptLink", manuscriptLink);
            Command.Parameters.AddWithValue("grantNumber", grantNumber);
            Command.Parameters.AddWithValue("nomineeType", nomineeType);
            Command.Parameters.AddWithValue("summaryManuscript", summaryManuscript);       
            ExecuteCommand(ref Command);
            RedirectURL();
            
        }


    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.IO;

namespace SpeakerNomination
{
    public partial class Export : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void ButtonSpeakerNominationExport_Click(object sender, EventArgs e)
        {
            DateTime regDate = DateTime.Now;
            string strDate = regDate.ToString("ddMMMyyyy");
            string fileName = "SpeakerNomination_Export" + strDate + ".xls";

            // activate the full data GridView
            gvSpeakerNominationAll.Visible = true;


            // Let's hide all unwanted stuffing
            gvSpeakerNominationAll.AllowPaging = false;
            gvSpeakerNominationAll.AllowSorting = false;
            // gvShortCourseAll.Columns(0).Visible = False


            // Let's bind data to GridView
            SqlDataSourceSpeakerNominationExport.DataBind();
            gvSpeakerNominationAll.DataBind();

            // Let's output HTML of GridView
            Response.Clear();

            Response.AddHeader("Transfer-Encoding", "identity"); // This line added 06-08-2018 to fix Chrome file download Network Failed error
            Response.ContentType = "application/vnd.xls";
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());

            StringWriter swriter = new StringWriter();
            HtmlTextWriter hwriter = new HtmlTextWriter(swriter);

            HtmlForm frm = new HtmlForm();

            gvSpeakerNominationAll.Parent.Controls.Add(frm);
            frm.Attributes["runat"] = "server";
            frm.Controls.Add(gvSpeakerNominationAll);
            frm.RenderControl(hwriter);

            Response.Write(swriter.ToString());
            Response.End();

            gvSpeakerNominationAll.Visible = false;
        }

        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        {
        }


    }
}
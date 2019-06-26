<%@ Page Title="Speaker Nomination Form" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SpeakerNomination._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="speakerNomOpen" Visible="true">
    <div class="row">
        <div class="col-md-12">
            <h2>Speaker Nomination Form</h2>
            <p>The Office of Behavioral and Social Sciences Research (OBSSR), in collaboration with the NIH Behavioral and Social Sciences Research Coordinating Committee (BSSR-CC), is seeking nominations for speakers for The Annual NIH Behavioral and Social Sciences Research Festival.</p>
            <p>The Office of Behavioral and Social Sciences Research (OBSSR), in collaboration with the NIH Behavioral and Social Sciences Research Coordinating Committee (BSSR-CC), holds the annual NIH Behavioral and Social Sciences Research Festival on the NIH campus. The festival highlights exciting research results, emerging areas, and innovations in health-related BSSR.</p>
            <p>Nominees should have the following characteristics:</p>
            <ul>
                <li>Published a compelling/exciting manuscript on their behavioral and social science research (BSSR) findings. This should be either i), a paper published in FY18-FY19 that was supported by a prior grant, preferably one still active or ii), a recently published paper that served as the preliminary data for a grant awarded in FY18-FY19. The nominee must be the lead author on the manuscript.
                    <ul>
                        <li>We are interested in publications that:
                            <ul>
                                <li>move the field forward in an important way</li>
                                <li>change or meaningfully advance existing behavioral and social sciences paradigms</li>
                                <li>are important to improving healthcare or public health</li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>Conducting cutting-edge behavioral and social sciences research. For instance, research that involves cutting-edge new approaches, methods, measurement, or trans-disciplinary work that advances BSSR.</li>
                <li>Current NIH grantees. We encourage nominations of Early Stage Investigators, New Investigators and underrepresented minorities.</li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p style="text-align:center;color:red; font-weight:bold;">FY 2019 Deadline: June 21, 2019, COB</p>
            <p style="text-align:center;font-weight:bold;">If you have any questions, please contact Dana Greene-Schloesser at <a href="mailto:kate.dana.schloesser@nih.gov">dana.schloesser@nih.gov</a>.</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <section id="nominationForm">
                <div class="form-horizontal">
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtContactName" CssClass="col-md-4 control-label">Program Contact (Organizer/Submitter) Name:</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="txtContactName" CssClass="form-control" TextMode="SingleLine" MaxLength="200" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactName"
                                CssClass="text-danger" ErrorMessage="The Program Contact (Organizer/Submitter) Name is required." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtContactEmail" CssClass="col-md-4 control-label">Program Contact Email:</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="txtContactEmail" CssClass="form-control" TextMode="Email" MaxLength="200" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContactEmail"
                                CssClass="text-danger" ErrorMessage="The Program Contact Email field is required." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtInstitute" CssClass="col-md-4 control-label">Institute/Center/Office:</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="txtInstitute" CssClass="form-control" TextMode="SingleLine" MaxLength="200" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtInstitute"
                                CssClass="text-danger" ErrorMessage="The Institute/Center/Office field is required." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtNomineeName" CssClass="col-md-4 control-label">Nominee Name:</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="txtNomineeName" CssClass="form-control" TextMode="SingleLine" MaxLength="200" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNomineeName"
                                CssClass="text-danger" ErrorMessage="The Nominee Name field is required." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtNomineeInstitution" CssClass="col-md-4 control-label">Nominee Institution:</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="txtNomineeInstitution" CssClass="form-control" TextMode="SingleLine" MaxLength="200" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNomineeInstitution"
                                CssClass="text-danger" ErrorMessage="The Nominee Institution field is required." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtManuscriptTitle" CssClass="col-md-4 control-label">Manuscript Title:</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="txtManuscriptTitle" CssClass="form-control" TextMode="SingleLine" MaxLength="300" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtManuscriptTitle"
                                CssClass="text-danger" ErrorMessage="The Manuscript Title field is required." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtManuscriptLink" CssClass="col-md-4 control-label">Link to Manuscript:</asp:Label>
                        <div class="col-md-8">
                            <asp:TextBox runat="server" ID="txtManuscriptLink" CssClass="form-control" TextMode="SingleLine" MaxLength="350" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtManuscriptLink"
                                CssClass="text-danger" ErrorMessage="The Manuscript Link field is required." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtGrantNumberTitle" CssClass="col-md-8 control-label" style="text-align:left;" >Grant number and title supporting Nominee’s manuscript:</asp:Label><br />
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtGrantNumberTitle" CssClass="form-control" TextMode="MultiLine" Rows="2" Columns="6" MaxLength="300" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGrantNumberTitle"
                                CssClass="text-danger" ErrorMessage="The Grant number and title supporting Nominee’s manuscript is required." />
                        </div>
                    </div>

                    <div class="form-group" style="max-height:100px;">
                        <asp:Label runat="server" AssociatedControlID="selNomineeType" CssClass="col-md-6 control-label" style="text-align:left;">Is the Nominee an Early Stage Investigator or New Investigator?</asp:Label>
                        <div class="col-md-2">
                            <asp:DropDownList id="selNomineeType" runat="server" CssClass="form-control" style="text-align:left; padding-bottom:0px; margin-bottom:0px;">
                                <asp:ListItem Value="ESI"></asp:ListItem>
                                <asp:ListItem Value="NI"></asp:ListItem>
                                <asp:ListItem Value="N/A"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="selNomineeType"
                                CssClass="text-danger" ErrorMessage="The is the Nominee an Early Stage Investigator or New Investigator is required." />
                        </div>
                    </div>         

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtSummary" CssClass="col-md-10 control-label" style="text-align:left; padding-top:0px; margin-top:0px;">Brief summary of the manuscript and its importance to BSSR:<br />
                        <span style="font-weight:normal;"><em>Briefly describe main findings and conclusions of the research and the importance/impact of the findings on the BSSR field. As a reminder, the evaluation criteria includes the following: moves the field forward in an important way; change or meaningful advance existing behavioral and social sciences paradigms; is important to improving healthcare or public health; conducting cutting-edge behavioral and social sciences research.</em></span><br />
                        <span style="color:red;">(Max allowed:1000 characters)</span>
                        </asp:Label>

                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtSummary" CssClass="form-control" TextMode="MultiLine"  Rows="12" Columns="6" MaxLength="1000"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSummary"
                                CssClass="text-danger" ErrorMessage="Brief summary of the manuscript and its importance to BSSR is required." />
                        </div>
                    </div>
   
                    
                    <div class="form-group">
                        <div class="col-md-10" style="text-align:center; padding-bottom:20px;">
                            <asp:Button runat="server" Text="Submit" CssClass="btn btn-default" OnClick=" InsertSpeakerNomination_Click" />
                        </div>
                    </div>
                </div>
                
            </section>
        </div>

    </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="speakerNomClosed" Visible="false">
    <div class="row">
        <div class="col-md-12">
            <h2>Speaker Nomination Form</h2>
            <br /><br />
            <p style="text-align:center;">The deadline for submitting a speaker nomination for The Annual NIH Behavioral and Social Sciences Research Festival has now closed.</p>
            <br /><br />
            <p style="text-align:center;font-weight:bold;">If you have any questions, please contact Dana Greene-Schloesser at <a href="mailto:kate.dana.schloesser@nih.gov">dana.schloesser@nih.gov</a>.</p>
            <p><br /><br /><br /><br /></p>
        </div>
    </div>
    </asp:Panel>
</asp:Content>

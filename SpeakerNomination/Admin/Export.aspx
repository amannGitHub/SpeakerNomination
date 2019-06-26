<%@ Page Title="Speaker Nomination Form - Export to Excel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Export.aspx.cs" Inherits="SpeakerNomination.Export" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row" style="padding-left:20px;">
        <h2><%: Title %></h2>
        <br />
        <p>Click the "Export to Excel" button below to export the speaker nomination information into Excel format.<br /><br /></p>
    </div>  

    <asp:SqlDataSource ID="SqlDataSourceSpeakerNominationExport" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SpeakerNominationGet" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <div class="row" style="padding-left:20px;">
       <div class="col-md-12">
         
         <asp:PlaceHolder runat="server">            
         <asp:GridView ID="gvSpeakerNominationAll" runat="server" DataSourceID="SqlDataSourceSpeakerNominationExport" AutoGenerateColumns="False" DataKeyNames="nominationID" Visible="False" cellpadding="5"
        cellspacing="5" AlternatingRowStyle-BackColor="#f8f8f8">
             <Columns>
                  <asp:BoundField DataField="nominationID" HeaderText="Nomination ID" InsertVisible="False" ReadOnly="True" SortExpression="nominationID" />
                  <asp:BoundField DataField="contactName" HeaderText="Contact Name" SortExpression="contactName" />
                  <asp:BoundField DataField="contactEmail" HeaderText="Contact Email" SortExpression="contactEmail"/>
                  <asp:BoundField DataField="institute" HeaderText="Institute" SortExpression="institute"/>
                  <asp:BoundField DataField="nomineeName" HeaderText="Nominee Name" SortExpression="nomineeName"/>                                
                  <asp:BoundField DataField="nomineeInstitution" HeaderText="Nominee Institution" SortExpression="nomineeInstitution" />
                  <asp:BoundField DataField="manuscriptTitle" HeaderText="Manuscript Title" SortExpression="manuscriptTitle"/>
                  <asp:BoundField DataField="manuscriptLink" HeaderText="Manuscript Link" SortExpression="manuscriptLink"/>
                  <asp:BoundField DataField="grantNumber" HeaderText="Grant Number" SortExpression="grantNumber"/>
                  <asp:BoundField DataField="nomineeType" HeaderText="Nominee Type" SortExpression="nomineeType"/>
                  <asp:BoundField DataField="summaryManuscript" HeaderText="Summary Manuscript" SortExpression="summaryManuscript"/>                                 
             </Columns>
         </asp:GridView>
         </asp:PlaceHolder>

        <div style="text-align:center; padding-bottom:20px;"><asp:LinkButton ID="ButtonSpeakerNominationExport" runat="server" Text="Export To Excel" CssClass="btn btn-success" OnClick="ButtonSpeakerNominationExport_Click" /></div>
      </div>

       
                   
   </div>



</asp:Content>

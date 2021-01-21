<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Page Language="C#" AutoEventWireup="true" Inherits="System.Web.UI.Page" %>
 
<script runat="server">

// executable binary file
public static readonly string OHMR = @"C:\Apps\OHMR\OpenHardwareMonitorReport.exe";

protected void Page_Load(object sender, EventArgs e)
{
    string strFilePath = OHMR;

    System.Diagnostics.ProcessStartInfo psi = new System.Diagnostics.ProcessStartInfo();

    psi.FileName = strFilePath;
    psi.UseShellExecute = false;
    psi.RedirectStandardOutput = true;
    psi.RedirectStandardInput = true;
    psi.UseShellExecute = false;

    // execute the process
    System.Diagnostics.Process proc = Process.Start(psi);
    string results = proc.StandardOutput.ReadToEnd();

    // wait for process exit code
    proc.WaitForExit();

    // designate mime:text/plain
    Response.AddHeader("Content-Type", "text/plain; charset=utf-8"); 

    // finally return the response
    this.Response.Write(results); 
}

</script>

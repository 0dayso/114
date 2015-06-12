<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplyRuleInfo.aspx.cs"
    Inherits="SiteOperationsCenter.SupplierManage.SupplyRuleInfo" %>
<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <title>�������5����</title>
    <style>
        #jiaodianList
        {
            list-style: none;
            padding-left: 0;
        }
        #jiaodianList li input
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td style="border-bottom: 1px solid;" height="20">
                <strong>
                    <img src="<%= ImageServerUrl %>/images/yunying/icn_pen02.gif" width="13" height="13"></strong>
                ������� &gt; �������5����
            </td>
        </tr>
    </table>
        <table width="960" border="1" cellspacing="0" cellpadding="8" style="border: 1px solid #ccc;
            padding: 1px;">
            <tr>
                <td height="26" align="right" bgcolor="#C0DEF3">
                    <strong>�������ͷ��</strong>
                </td>
                <td height="26">
                    ���ű��⣺
                    <input type="text" id="txtsupTopTitle" runat="server" name="txtsupTopTitle" size="40" value="" />
                    <br />
                    ���ӵ�ַ��
                    <input type="text" id="txtsupTopHref" runat="server" name="txtsupTopHref" size="40" value="" />
                    <br />
                    ���Ÿ�Ҫ��
                    <textarea type="text" runat="server" id="txtsupRuleDescription" name="txtsupRuleDescription" size="40" value="" cols="39" rows="6"></textarea>
                </td>
            </tr>
            <tr>
                <td height="28" align="right" bgcolor="#C0DEF3">
                    <p>
                        <strong>�������һ</strong></p>
                </td>
                <td height="28">
                    <p>
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�⣺
                        <input type="text" runat="server" name="txtRuleTitle1" id="txtRuleTitle1" size="40" value="" />
                        <br />
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�ӣ�
                        <input type="text"  runat="server" name="txtRuleHref1" id="txtRuleHref1" size="40" value="" />
                        <br />
                    </p>
                </td>
            </tr>
            <tr>
                <td height="28" align="right" bgcolor="#C0DEF3">
                    <p>
                        <strong>��������</strong></p>
                </td>
                <td height="28">
                    <p>
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�⣺
                        <input type="text" runat="server" name="txtRuleTitle2" id="txtRuleTitle2" size="40" value="" />
                        <br />
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�ӣ�
                        <input type="text" runat="server" name="txtRuleHref2" id="txtRuleHref2" size="40" value="" />
                        <br />
                    </p>
                </td>
            </tr>
            <tr>
                <td height="28" align="right" bgcolor="#C0DEF3">
                    <p>
                        <strong>���������</strong></p>
                </td>
                <td height="28">
                    <p>
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�⣺
                        <input type="text" runat="server" name="txtRuleTitle3" id="txtRuleTitle3" size="40" value="" />
                        <br />
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�ӣ�
                        <input type="text" runat="server" name="txtRuleHref3" id="txtRuleHref3" size="40" value="" />
                        <br />
                    </p>
                </td>
            </tr>
            <tr>
                <td height="28" align="right" bgcolor="#C0DEF3">
                    <p>
                        <strong>���������</strong></p>
                </td>
                <td height="28">
                    <p>
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�⣺
                        <input type="text" runat="server" name="txtRuleTitle4" id="txtRuleTitle4" size="40" value="" />
                        <br />
                        ��&nbsp;&nbsp;&nbsp;&nbsp;�ӣ�
                        <input type="text" runat="server" name="txtRuleHref4" id="txtRuleHref4" size="40" value="" />
                        <br />
                    </p>
                </td>
            </tr>
            <tr>
                <td height="28" align="right" bgcolor="#C0DEF3">
                    &nbsp;
                </td>
                <td height="28">
                    <asp:Button ID="btnSave" runat="server" Text="����" onclick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

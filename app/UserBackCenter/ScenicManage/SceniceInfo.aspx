<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SceniceInfo.aspx.cs" Inherits="UserBackCenter.ScenicManage.SceniceInfo" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <link href="<%=CssManage.GetCssFilePath("rightnew") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">   
    <div class="right">
        <div class="tablebox">
            <table border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#9dc4dc"
                style="width: 100%;" class="margintop5">
                <tr>
                    <td align="right">
                        ����������
                    </td>
                    <td align="left">
                        <asp:Literal ID="litSceniceName" runat="server"></asp:Literal>
                    </td>
                </tr>                
                <tr>
                    <td width="18%" align="right">
                        ��Ʊ�������ƣ�
                    </td>
                    <td align="left">
                        <asp:Literal ID="litSceniceType" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ������ϵ�ˣ�
                    </td>
                    <td align="left">
                        <asp:Literal ID="litContact" runat="server"></asp:Literal>&nbsp;&nbsp;
                        <asp:Literal ID="litContactTel" runat="server"></asp:Literal>&nbsp;&nbsp;
                        <asp:Literal ID="LitContactMQ" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ���мۣ�
                    </td>
                    <td align="left">
                        <asp:Literal ID="litMSPrice" runat="server"></asp:Literal>&nbsp;Ԫ
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��վ�Żݼۣ�
                    </td>
                    <td align="left">
                        <asp:Literal ID="litYHPrices" runat="server"></asp:Literal>&nbsp;Ԫ
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �г�������ͼۣ�
                    </td>
                    <td align="left">
                        <asp:Literal ID="litMinSCPrice" runat="server"></asp:Literal>&nbsp;Ԫ
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ͬ�з����ۣ�
                    </td>
                    <td align="left">
                        <asp:Literal ID="litTHPrice" runat="server"></asp:Literal>&nbsp;Ԫ
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        �������ƣ�
                    </td>
                    <td align="left">
                        <asp:Literal ID="litMinlimit" runat="server"></asp:Literal>����/�ף�
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Ʊ����Чʱ��Σ�
                    </td>
                    <td align="left">
                        <%=this.timeHtml%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ��Ʊ˵����
                    </td>
                    <td align="left">
                        <asp:Literal ID="litexplain" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        ͬҵ������֪��
                    </td>
                    <td align="left">
                        <asp:Literal ID="litNotes" runat="server"></asp:Literal>
                    </td>
                </tr>
<%--                <tr>
                    <td colspan="2">
                        <a class="baocun_btn" href="javascript:void(0);" onclick="parent.Boxy.getIframeDialog('<%=Request.QueryString["iframeId"] %>').hide();">�� ��</a>
                    </td>
                </tr>--%>
            </table>
        </div>
    </div>
    </form>
</body>
</html>

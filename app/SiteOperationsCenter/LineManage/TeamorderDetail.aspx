<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamorderDetail.aspx.cs"
    Inherits="SiteOperationsCenter.LineManage.TeamorderDetail" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���Ŷ�������-�鿴</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#cccccc"
        class="lr_hangbg table_basic ">
        <tr>
            <td width="31%" align="right">
                ������ţ�
            </td>
            <td width="69%" align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.OrderNo %>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��·���ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <a href="AddLine.aspx?LineId=<%=modelMTourList.RouteId %>">
                    <%=modelMTourList.RouteName%></a>�������ڣ�<%=modelMTourList.StartDate.ToString("yyyy-MM-dd")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                �����磺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <a href="/CompanyManage/AddBusinessMemeber.aspx?EditId=<%=modelMTourList.Travel%>">
                    <%=modelMTourList.TravelName%></a>
                <%=EyouSoft.Common.Utils.GetMQ(modelMTourList.TravelMQ) %>
                ��ϵ�ˣ�<%=modelMTourList.TravelContact%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ר���̣�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <a href="/CompanyManage/AddBusinessMemeber.aspx?EditId=<%=modelMTourList.Business%>"
                    target="_blank">
                    <%=modelMTourList.BusinessName%></a>
                <%=EyouSoft.Common.Utils.GetMQ(modelMTourList.BusinessMQ) %>
                ��ϵ�ˣ�<asp:Literal ID="ContactInfo" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right">
                �οͣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                
                ��ϵ�ˣ�<asp:Literal ID="litVisitorContact" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right">
                Ԥ��ʱ�䣺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.IssueTime%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ������ϵ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.VisitorContact%>
            </td>
        </tr>
        <tr>
            <td align="right">
                �ŶӲο��ۣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:Literal ID="litPriceTeam" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td width="31%" align="right">
                �������У�
            </td>
            <td width="69%" align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.StartCityName %>-
                <%=modelMTourList.EndCityName %>
            </td>
        </tr>
        <tr>
            <td width="31%" align="right">
                ������ͨ��
            </td>
            <td width="69%" align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.StartTraffic%>-<%=modelMTourList.EndTraffic%>
            </td>
        </tr>
        <tr>
            <td align="right">
                Ԥ��������
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.ScheduleNum%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ����
            </td>
            <td align="left" bgcolor="#FFFFFF">
              ����  <%=modelMTourList.AdultPrice.ToString("0.00")%>
              ��ͯ  <%=modelMTourList.ChildrenPrice.ToString("0.00")%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��С����������
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.GroupNum%>
            </td>
        </tr>
        <tr>
            <td align="right">
                �οͱ�ע��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.VisitorNotes%>
            </td>
        </tr>
        <tr>
            <td align="right">
                �����籸ע��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.TravelNotes%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ר���̱�ע��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourList.BusinessNotes%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ״̬��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=strStatus %>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="#FFFFFF">
                <asp:Button ID="btnsanve" runat="server" Text="�ύ����" OnClick="btnsanve_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

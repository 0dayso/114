<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxLineDetaile.aspx.cs"
    Inherits="SiteOperationsCenter.LineManage.AjaxLineDetaile" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Assembly="ControlLibrary" Namespace="ControlLibrary" TagPrefix="cc1" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExporPage" TagPrefix="cc2" %>
<td colspan="9" align="left">
    <cc1:CustomRepeater ID="repList" runat="server">
        <HeaderTemplate>
            <table width="96%" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#9dc4dc"
                style="margin-top: 5px; margin-bottom: 5px;">
                <tr class="list_basicbg">
                    <th class="no_cuti">
                        ��·��
                    </th>
                    <th class="no_cuti">
                        ������
                    </th>
                    <th class="no_cuti">
                        ������
                    </th>
                    <th class="no_cuti">
                        ����
                    </th>
                    <th class="no_cuti">
                        ��ͯ
                    </th>
                    <th class="no_cuti">
                        �����ܶ�
                    </th>
                    <th class="no_cuti">
                        �����ܶ�
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td bgcolor="#FFFFFF">
                    <%# Eval("RouteName")%>
                </td>
                <td align="center" bgcolor="#FFFFFF">
                    <%# Eval("TotalOrder")%>
                </td>
                <td align="center" bgcolor="#FFFFFF">
                    <%# Eval("TotalPeople")%>
                </td>
                <td align="center" bgcolor="#FFFFFF">
                    <%# Eval("TotalAdult")%>
                </td>
                <td align="center" bgcolor="#FFFFFF">
                    <%# Eval("TotalChild")%>
                </td>
                <td align="center" bgcolor="#FFFFFF">
                    <%# Math.Round(Utils.GetDecimal(Eval("TotalSale").ToString()),2)%>
                </td>
                <td align="center" bgcolor="#FFFFFF">
                    <%# Math.Round(Utils.GetDecimal(Eval("TotalSettle").ToString()), 2)%>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </cc1:CustomRepeater>
    <div align="right">
</div>
</td>


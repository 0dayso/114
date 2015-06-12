<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/NewPrintPage.Master"
    CodeBehind="TouristInfo.aspx.cs" Inherits="UserBackCenter.PrintPage.TouristInfo" %>

<%@ Import Namespace="EyouSoft.Common" %>
<asp:Content ContentPlaceHolderID="MainPrint" runat="server">
    <table width="940" align="left">
        <tbody>
            <tr>
                <td valign="top" rowspan="3" width="202" align="right">
                    <table style="margin-top: 90px" width="83%" align="right" id="tblFloating">
                        <tbody>
                            <tr>
                                <td style="color: #999999" align="left">
                                    ��ѡ��ѡ������ָ����Ŀ<br>
                                    ��Ϊ���أ�����Ϊ��ʾ
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #999999" align="left">
                                    <input id="cbkContect" hidval="tr_CollectionContect" onclick="TourInfoPrintPage.hide(this,'tr_CollectionContect')"
                                        value="checkbox" type="checkbox" name="checkbox" /><label for="cbkContect">������Ϣ</label><br>
                                    <input id="cbkLocalCompany" hidval="tblLocalCompanyInfo" onclick="TourInfoPrintPage.hide(this,'tblLocalCompanyInfo')"
                                        value="checkbox" type="checkbox" name="checkbox" /><label for="cbkLocalCompany">�ο���Ϣ</label><br>
                                    <input id="cbkPriceInfo" hidval="tblTourPriceDetail" onclick="TourInfoPrintPage.hide(this,'tblTourPriceDetail')"
                                        value="checkbox" type="checkbox" name="checkbox" /><label for="cbkPriceInfo">��ע</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td width="738">
                    <table id="tbltopright" width="100%">
                        <tbody>
                            <tr>
                                <td width="2%" align="left">
                                    <img src="<%= ImageServerUrl %>/images/printboxt-l.gif" width="16" height="37">
                                </td>
                                <td background="<%= ImageServerUrl %>/images/printboxt-m.gif" width="98%">
                                    &nbsp;
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td id="printPage" align="left" style="border-bottom: #c9c9c9 1px solid; border-left: #c9c9c9 1px solid;
                    padding-bottom: 10px; font-size: 12px; border-right: #808080 5px solid">
                    <table width="700" align="center" height="53" border="0">
                        <tr>
                            <td>
                                <table height="50" width="500" align="center" valign="middle">
                                    <tr>
                                        <td class="HeadTitle">
                                            <asp:Label ID="LeaveDate" runat="server"></asp:Label>
                                            <asp:Label ID="RouteName" runat="server"></asp:Label>
                                            �Ŷ���Ա����
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table align="center">
                        <tbody>
                            <tr id="tr_CollectionContect">
                                <td>
                                    <table width="700" align="center">
                                        <tr>
                                            <td height="31" align="left">
                                                <strong>�Ŷӻ�����Ϣ</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="ftxt">
                                                <table width="700" class="table_normal2" align="center">
                                                    <tr>
                                                        <td width="105" height="25" align="right" bgcolor="#FFFFFF">
                                                            �źţ�
                                                        </td>
                                                        <td width="182" bgcolor="#FFFFFF">
                                                            <asp:Label ID="GroupNo" runat="server"></asp:Label>
                                                        </td>
                                                        <td width="119" align="right" bgcolor="#FFFFFF">
                                                            ��·���ƣ�
                                                        </td>
                                                        <td width="294" bgcolor="#FFFFFF">
                                                            <asp:Label ID="RouteName1" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="25" align="right" bgcolor="#FFFFFF">
                                                            ����ʱ�䣺
                                                        </td>
                                                        <td bgcolor="#FFFFFF">
                                                            <asp:Label ID="LeaveTime" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" bgcolor="#FFFFFF">
                                                            �Ŷ�ʵ��������
                                                        </td>
                                                        <td bgcolor="#FFFFFF">
                                                            <%if (isTrue)
                                                              { %>
                                                            <asp:Label ID="FactNo" runat="server"></asp:Label>
                                                            <%}
                                                              else
                                                              { %>
                                                            0
                                                            <%} %>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="tblLocalCompanyInfo">
                                <td>
                                    <table width="700" align="center">
                                        <tr>
                                            <td height="35" align="left" bgcolor="#FFFFFF">
                                                <strong>�ο���Ϣ</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%if (isTrue)
                                                  { %>
                                                <asp:Repeater runat="server" ID="TouristInfomation">
                                                    <HeaderTemplate>
                                                        <table width="700" class="table_normal2" align="center" style="margin-top: 5px;">
                                                            <tr>
                                                                <th width="105" height="25" align="center" bgcolor="#FFFFFF">
                                                                    ���
                                                                </th>
                                                                <th width="182" align="center" bgcolor="#FFFFFF">
                                                                    ����
                                                                </th>
                                                                <th width="119" align="center" bgcolor="#FFFFFF">
                                                                    ��/ͯ
                                                                </th>
                                                                <th width="294" align="center" bgcolor="#FFFFFF">
                                                                    �Ա�
                                                                </th>
                                                                <th width="294" align="center" bgcolor="#FFFFFF">
                                                                    ��ϵ�绰
                                                                </th>
                                                                <th width="294" align="center" bgcolor="#FFFFFF">
                                                                    ֤��
                                                                </th>
                                                                <th width="294" align="center" bgcolor="#FFFFFF">
                                                                    ��λ��
                                                                </th>
                                                                <th width="294" align="center" bgcolor="#FFFFFF">
                                                                    ��ע
                                                                </th>
                                                            </tr>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td height="25" align="center" bgcolor="#FFFFFF">
                                                                <%#GetCount() %>
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF">
                                                                <%#Eval("VisitorName") %>
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF">
                                                                <%#Eval("CradType")%>
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF">
                                                                <%#Eval("Sex") %>
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF">
                                                                <%#Eval("Mobile")%>
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF">
                                                                <%#GetCard(Eval("IdentityCard"), Eval("Passport"), Eval("OtherCard"))%>
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF">
                                                                <%#Eval("SiteNo")%>
                                                            </td>
                                                            <td align="center" bgcolor="#FFFFFF">
                                                                <%#Eval("Notes")%>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                <%}
                                                  else
                                                  {%>
                                                �����ο���Ϣ
                                                <%} %>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="tblTourPriceDetail">
                                <td>
                                    <table width="700" align="center">
                                        <tr>
                                            <td height="35" align="left" bgcolor="#FFFFFF">
                                                <strong>��ע</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="ftxt">
                                                <textarea name="textarea" runat="server" id="Remark" style="width: 600px; height: 75px;"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>

    <script language="javascript" type="text/javascript">
        var TourInfoPrintPage = {
            hide: function(obj, containerId) {
                if (obj.checked) {
                    $("#" + containerId).hide()
                } else {
                    $("#" + containerId).show()
                }
            }
        }
    </script>

</asp:Content>

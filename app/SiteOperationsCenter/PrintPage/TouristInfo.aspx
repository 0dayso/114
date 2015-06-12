<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouristInfo.aspx.cs" Inherits="SiteOperationsCenter.PrintPage.TouristInfo" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��·����-�����·</title>
    <link href="<%=CssManage.GetCssFilePath("css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("right") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <!--��ӡ���ݿ�ʼ-->
        <table border="0" cellspacing="0" cellpadding="0" width="940" align="left">
            <tbody>
                <tr>
                    <td valign="top" rowspan="3" width="202" align="right">
                        <table style="margin-top: 90px" border="0" cellspacing="0" cellpadding="0" width="83%"
                            align="right" id="tblFloating">
                            <tbody>
                                <tr>
                                    <td style="color: #999999" align="left">
                                        ��ѡ��ѡ������ָ����Ŀ<br>
                                        ��Ϊ���أ�����Ϊ��ʾ
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: #999999" align="left">
                                        <input id="cbkContect" onclick="TourInfoPrintPage.hide(this,'tr_CollectionContect')"
                                            value="checkbox" type="checkbox" name="checkbox" /><label for="cbkContect">������Ϣ</label><br>
                                        <input id="cbkLocalCompany" onclick="TourInfoPrintPage.hide(this,'tblLocalCompanyInfo')"
                                            value="checkbox" type="checkbox" name="checkbox" /><label for="cbkLocalCompany">�ο���Ϣ</label><br>
                                        <input id="cbkPriceInfo" onclick="TourInfoPrintPage.hide(this,'tblTourPriceDetail')"
                                            value="checkbox" type="checkbox" name="checkbox" /><label for="cbkPriceInfo">��ע</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                    <td width="738">
                        <table id="tbltopright" border="0" cellspacing="0" cellpadding="0" width="100%">
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
                        <table width="100%" height="53" border="0">
                            <tr>
                                <td height="50" align="center" valign="middle" class="print_title24">
                                    <span class="HeadTitle">
                                        <asp:Label ID="LeaveDate" runat="server"></asp:Label>
                                        <asp:Label ID="RouteName" runat="server"></asp:Label>
                                        �Ŷ���Ա���� </span>
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellspacing="1" cellpadding="1" width="700" align="center">
                            <tbody>
                                <tr id="tr_CollectionContect">
                                    <td>
                                        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td height="31" align="left">
                                                    <strong>�Ŷӻ�����Ϣ</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" class="ftxt">
                                                    <table width="700" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000"
                                                        class="padd5">
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
                                                                <asp:Label ID="FactNo" runat="server"></asp:Label>
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
                                        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td height="35" align="left" bgcolor="#FFFFFF">
                                                    <strong>�ο���Ϣ</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Repeater runat="server" ID="TouristInfomation">
                                                        <HeaderTemplate>
                                                            <table width="700" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000"
                                                                class="padd5" style="margin-top: 5px;">
                                                                <tr>
                                                                    <th width="105" height="25" align="left" bgcolor="#FFFFFF">
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
                                                                <td height="25" align="left" bgcolor="#FFFFFF">
                                                                    <%#GetCount() %>
                                                                </td>
                                                                <td align="left" bgcolor="#FFFFFF">
                                                                    <%#Eval("VisitorName") %>
                                                                </td>
                                                                <td align="center" bgcolor="#FFFFFF">
                                                                    <%#Eval("CradType")%>
                                                                </td>
                                                                <td align="center" bgcolor="#FFFFFF">
                                                                    <%#Eval("Sex") %>
                                                                </td>
                                                                <td align="left" bgcolor="#FFFFFF">
                                                                    <%#Eval("ContactTel")%>
                                                                </td>
                                                                <td align="left" bgcolor="#FFFFFF">
                                                                    <%#Eval("IdentityCard")==""?"����":"���֤"%>
                                                                    <%#Eval("IdentityCard") == "" ? Eval("Passport") : Eval("IdentityCard")%>
                                                                </td>
                                                                <td align="center" bgcolor="#FFFFFF">
                                                                    <%#Eval("SiteNo")%>
                                                                </td>
                                                                <td align="left" bgcolor="#FFFFFF">
                                                                    <%#Eval("Notes")%>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tblTourPriceDetail">
                                    <td>
                                        <table width="700" border="0" align="center" cellpadding="1" cellspacing="0">
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
        <!--��ӡ���ݽ���-->
        
    
    
        <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Print") %>"></script>

    <script language="javascript" type="text/javascript">

        $(document).ready(function() {
            //�������ʾ��Ϣ���óɸ���ҳ�����������
            window.onscroll = function() {
                var div = document.getElementById("tblFloating");
                div.style.top = document.body.scrollTop + 100;
            }
            window.onresize = window.onscroll;
        });
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

    </form>
</body>
</html>

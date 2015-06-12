<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FitOrderDetail.aspx.cs"
    Inherits="SiteOperationsCenter.LineManage.FitOption" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����鿴</title>
    <%@ register assembly="ControlLibrary" namespace="ControlLibrary" tagprefix="cc1" %>
    <%@ register assembly="ControlLibrary" namespace="Adpost.Common.ExporPage" tagprefix="cc2" %>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/JavaScript">
<!--
function ViewAllCarPlan2()
{
	new Controls.Dialog('../../zx/fwbz/daoru_md.html', '��������', {width:800, height:395, minmize:'no',maximize:"yes", scrollbars: 'no',closebtn: 'yes'});
}

//-->
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#cccccc"
        class="lr_hangbg table_basic">
        <tr>
            <td width="15%" align="right" bgcolor="#f2f9fe">
                �źţ�
            </td>
            <td width="85%" align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.TourNo %>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right" bgcolor="#f2f9fe">
                ��·���ƣ�
            </td>
            <td width="85%" align="left" bgcolor="#FFFFFF">
                <a href="#">
                    <%=modelMTourOrder.RouteName %></a> �������У�<%=GetLineModel(modelMTourOrder.RouteId)%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �����磺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%--                <%=modelMTourOrder.TravelName %>
                ��������ϵ�ˣ�<%=modelMTourOrder.TravelContact%>
                �ֻ���<%=modelMTourOrder.TravelTel%><br />--%>
                <%=GetContact(modelMTourOrder.Travel, "������")%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ר���̣�
            </td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
                <%=GetContact(modelMTourOrder.Publishers, "ר����")%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �������ڣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.LeaveDate.ToShortDateString()%>
                <b>ʣ���λ��<%=modelMTourOrder.MoreThan%></b> ��<a href="UpdateScatteredFightPlan.aspx?tourId=<%=modelMTourOrder.TourId %>">�Ŷӳ�����Ϣȷ���޸�</a>��
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �������ʱ�䣺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.StartDate %>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ���ذ��ʱ�䣺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.EndDate %>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ���ȫ��˵����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.TeamLeaderDec %>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ����˵����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.SetDec %>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �ο���ϵ�ˣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <span sizcache="0" sizset="0" jquery1309744253156="18"><span sizcache="0" sizset="0"
                    jquery1309744253156="17">
                    <%=modelMTourOrder.VisitorContact%>
                </span></span>��ϵ�绰��<%=modelMTourOrder.VisitorTel%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �οͱ�ע��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.VisitorNotes%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �����籸ע��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.TravelNotes%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ר���̱�ע��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=modelMTourOrder.BusinessNotes%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ����״̬��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=strOrderStatus%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ֧��״̬��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=strPaymentStatus%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �۸���ɣ�
            </td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
                ����<%=modelMTourOrder.AdultNum%>�ˣ���ͯ<%=modelMTourOrder.ChildrenNum%>�� ����������<%=modelMTourOrder.SingleRoomNum%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �۸�
            </td>
            <td colspan="3" align="left" bgcolor="#FFFFFF">
                <table width="90%" border="0">
                    <tr>
                        <td scope="row">
                            �г��ۣ�
                        </td>
                        <td>
                            ����
                            <%=modelMTourOrder.PersonalPrice.ToString("0.00")%>
                        </td>
                        <td>
                            ��ͯ
                            <%=modelMTourOrder.ChildPrice.ToString("0.00")%>
                        </td>
                        <td>
                            �������ۼ�
                            <%=modelMTourOrder.Add.ToString("0.00")%>
                        </td>
                        <td>
                            ������
                            <%=modelMTourOrder.MarketPrice.ToString("0.00")%>
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            ����ۣ�
                        </td>
                        <td>
                            ����
                            <%=modelMTourOrder.SettlementAudltPrice.ToString("0.00")%>
                        </td>
                        <td>
                            ��ͯ
                            <%=modelMTourOrder.SettlementChildrenPrice.ToString("0.00")%>
                        </td>
                        <td>
                            ���������
                            <%=modelMTourOrder.Reduction.ToString("0.00")%>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �ܽ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                ���ۼ�
                <%=modelMTourOrder.TotalSalePrice.ToString("0.00")%>
                &nbsp; �����
                <%=modelMTourOrder.TotalSettlementPrice.ToString("0.00")%>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �����̲�����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:Button ID="btnsave" runat="server" Text="�����޸�" OnClick="btnsave_Click" />
                <asp:Button ID="btndelete" runat="server" Text="ɾ����Ч����" OnClick="btndelete_Click" />
            </td>
        </tr>
        <!--  <tr>
    <td colspan="2" align="left" bgcolor="#FFFFFF"><b>�ο���ϸ��Ϣ</b><span class="daorumd"><a href="javascript:ViewAllCarPlan2();">��������</a></span></td>
  </tr>
-->
        <div id="divFitCustomes">
            <cc1:CustomRepeater ID="repList" runat="server">
                <HeaderTemplate>
                    <tr>
                        <td colspan="2" align="center" bgcolor="#FFFFFF">
                            <table width="100%" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#9dc4dc">
                                <tr>
                                    <th>
                                        ���
                                    </th>
                                    <th>
                                        ����
                                    </th>
                                    <th>
                                        ��ϵ�绰
                                    </th>
                                    <th>
                                        ���֤
                                    </th>
                                    <th>
                                        ����
                                    </th>
                                    <th>
                                        ����֤��
                                    </th>
                                    <th>
                                        �Ա�
                                    </th>
                                    <th>
                                        ����
                                    </th>
                                    <th>
                                        ����
                                    </th>
                                    <th>
                                        ��ע
                                    </th>
                                </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <td align="center">
                        <%# Container.ItemIndex+1%>
                    </td>
                    <td align="center">
                        <%# Eval("VisitorName")%>
                    </td>
                    <td align="center">
                        <%# Eval("ContactTel")%>
                    </td>
                    <td align="center">
                        <%# Eval("IdentityCard")%>
                    </td>
                    <td align="center">
                        <%# Eval("Passport")%>
                    </td>
                    <td align="center">
                        <%# Eval("OtherCard")%>
                    </td>
                    <td align="center">
                        <%# Eval("Sex")%>
                    </td>
                    <td align="center">
                        <%# Eval("CradType")%>
                    </td>
                    <td align="center">
                        <%# Eval("SiteNo")%>
                    </td>
                    <td align="center">
                        <%# Eval("Notes")%>
                    </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table> </td> </tr>
                </FooterTemplate>
            </cc1:CustomRepeater>
            <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="30" align="right">
                        <cc2:ExporPageInfoSelect ID="ExporPageInfoSelect1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>

    <script type="text/javascript">
    
    var FitCustomesManage = {//�����б�
            GetFitCustomesList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                LoadingImg.ShowLoading("divFitCustomes");
                if (LoadingImg.IsLoadAddDataToDiv("divFitCustomes")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "FitOrderDetail.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            $("#divFitCustomes").html(html);
                        }
                    });
                }
            },
            
            LoadData: function(obj) {//��ҳ
                var Page = exporpage.getgotopage(obj);
                Parms.Page = Page;
                this.GetFitList();
            }
    }
    
    </script>

    </form>
</body>
</html>

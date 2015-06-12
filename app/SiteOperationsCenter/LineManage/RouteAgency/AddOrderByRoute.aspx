<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrderByRoute.aspx.cs"
    Inherits="SiteOperationsCenter.LineManage.RouteAgency.AddOrderByRoute" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="/usercontrol/UserOrder/OrderCustomer.ascx" TagName="OrderCustomer"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>��·����-����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript">
    commonTourModuleData.add({
        ContainerID: '<%=tblID %>',
        ReleaseType: 'AddOrderByRoute'
    });
    </script>

    <script type="text/JavaScript">
<!--
function ViewAllCarPlan1()
{
	new Controls.Dialog('../../zx/fwbz/yuding_danwei.html', 'Ԥ����λ', {width:800, height:375, minmize:'no',maximize:"yes", scrollbars: 'no',closebtn: 'yes'});
}
function ViewAllCarPlan2()
{
	new Controls.Dialog('../../zx/fwbz/daoru_md.html', '��������', {width:800, height:395, minmize:'no',maximize:"yes", scrollbars: 'no',closebtn: 'yes'});
}

//-->
    </script>

    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("ContentWindow") %>"></script>

</head>
<body>
    <form id="form1">
    <%--<table width="98%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#cccccc"
        class="lr_hangbg table_basic">
        <tr>
            <td width="33%" align="right" bgcolor="#f2f9fe">
                ��·���ƣ�
            </td>
            <td width="67%" align="left" bgcolor="#FFFFFF">
                <a href="#">��������15��</a> �������У��Ϻ�
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                Ԥ����λ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="textfield" />
                <a href="javascript:ViewAllCarPlan1();">
                    <img src="../../images/icon_select.jpg" width="28" height="18" border="0" align="absmiddle" /></a>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �������ڣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                2011-07-29 ���� <b>ʣ���λ��23</b> ��<a href="tuandui_jh_update.html">�Ŷӳ�����Ϣȷ���޸�</a>��
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �ο���ϵ�ˣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="textfield2" />
                ��ϵ�绰��
                <input type="text" name="textfield3" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ��������ϵ�ˣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="textfield22" />
                ��ϵ�绰��
                <input type="text" name="textfield23" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �۸���ɣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                ����
                <input name="text" type="text" value="10" size="6" />
                �ˣ���ͯ
                <input name="text2" type="text" value="10" size="6" />
                �� ��������
                <input name="text2" type="text" value="10" size="6" />
                ��
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ���ۼۣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <span sizset="0" sizcache="0" jquery1309744253156="18"><span sizset="0" sizcache="0"
                    jquery1309744253156="17">����
                    <input id="ro_txtManCount6" onchange="RouteOrder.changePeopleCount(this,'1')" value="14000"
                        size="10" name="ro_txtManCount62" jquery1309744253156="2" runat="server" sourcecount="1" />
                    Ԫ</span></span>����ͯ
                <input id="ro_txtManCount62" onchange="RouteOrder.changePeopleCount(this,'1')" value="13000"
                    size="10" name="ro_txtManCount63" jquery1309744253156="2" runat="server" sourcecount="1" />
                Ԫ��������
                <input id="ro_txtManCount63" onchange="RouteOrder.changePeopleCount(this,'1')" value="1000"
                    size="10" name="ro_txtManCount64" jquery1309744253156="2" runat="server" sourcecount="1" />
                Ԫ����������<span sizset="0" sizcache="0" jquery1309744253156="18"><span sizset="0" sizcache="0"
                    jquery1309744253156="17">
                    <input id="ro_txtManCount10" onchange="RouteOrder.changePeopleCount(this,'1')" value="600"
                        size="10" name="ro_txtManCount6" jquery1309744253156="2" runat="server" sourcecount="1" />
                </span></span>Ԫ
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ����ۣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <span sizset="0" sizcache="0" jquery1309744253156="18"><span sizset="0" sizcache="0"
                    jquery1309744253156="17">����
                    <input id="ro_txtManCount622" onchange="RouteOrder.changePeopleCount(this,'1')" value="14000"
                        size="10" name="ro_txtManCount622" jquery1309744253156="2" runat="server" sourcecount="1" />
                    Ԫ</span></span>����ͯ
                <input id="ro_txtManCount632" onchange="RouteOrder.changePeopleCount(this,'1')" value="13000"
                    size="10" name="ro_txtManCount632" jquery1309744253156="2" runat="server" sourcecount="1" />
                Ԫ��������
                <input id="ro_txtManCount64" onchange="RouteOrder.changePeopleCount(this,'1')" value="1000"
                    size="10" name="ro_txtManCount642" jquery1309744253156="2" runat="server" sourcecount="1" />
                Ԫ����������<span sizset="0" sizcache="0" jquery1309744253156="18"><span sizset="0" sizcache="0"
                    jquery1309744253156="17">
                    <input id="ro_txtManCount65" onchange="RouteOrder.changePeopleCount(this,'1')" value="600"
                        size="10" name="ro_txtManCount65" jquery1309744253156="2" runat="server" sourcecount="1" />
                </span></span>Ԫ
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ����Ҫ��˵����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="textarea18" id="textarea18" cols="85" rows="4"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ����״̬��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="radio" name="radiobutton" value="radiobutton" />
                Ԥ��
                <input name="radiobutton" type="radio" value="radiobutton" checked="checked" />
                Ԥ��
                <input type="radio" name="radiobutton" value="radiobutton" />
                ��ȷ��
                <input type="radio" name="radiobutton" value="radiobutton" />
                �ᵥ
                <input type="radio" name="radiobutton" value="radiobutton" />
                ȡ��
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ֧��״̬��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="radio" name="radiobutton" value="radiobutton" />
                δ֧��
                <input type="radio" name="radiobutton" value="radiobutton" />
                ��֧��
                <input name="radiobutton" type="radio" value="radiobutton" checked="checked" />
                �οͶ�����֧��
                <input type="radio" name="radiobutton" value="radiobutton" />
                �����綨����֧��
                <input type="radio" name="radiobutton" value="radiobutton" />
                ������ȫ����֧��
                <input type="radio" name="radiobutton" value="radiobutton" />
                ����
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �ܽ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                ���ۼ�
                <input id="ro_txtManCount623" onchange="RouteOrder.changePeopleCount(this,'1')" value="14000"
                    size="10" name="ro_txtManCount623" jquery1309744253156="2" runat="server" sourcecount="1" />
                &nbsp; �����
                <input id="ro_txtManCount624" onchange="RouteOrder.changePeopleCount(this,'1')" value="13000"
                    size="10" name="ro_txtManCount624" jquery1309744253156="2" runat="server" sourcecount="1" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �������ԣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="textarea" id="textarea" cols="85" rows="4"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �����̲�����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="submit" name="button3" id="button3" value=" �����޸� " />
            </td>
        </tr>
        <!--  <tr>
    <td colspan="2" align="left" bgcolor="#FFFFFF"><b>�ο���ϸ��Ϣ</b><span class="daorumd"><a href="javascript:ViewAllCarPlan2();">��������</a></span></td>
  </tr>
-->
        <tr>
            <td colspan="2" align="center" bgcolor="#FFFFFF">
                <%--<table width="100%" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#9dc4dc">
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
                            ��ע����ѡ�����볣�ÿͿ⣩
                        </th>
                    </tr>
                    <tr>
                        <td align="center">
                            1
                        </td>
                        <td align="center">
                            <input value="�ο�" size="8" name="CustomerName1" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo143" id="CertificateNo142" size="11" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo1433" id="CertificateNo1432" size="18" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo1435" id="CertificateNo1434" size="18" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo1437" id="CertificateNo1436" size="18" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <select id="select" name="select">
                                <option selected="selected" value="1">��</option>
                                <option value="0">Ů</option>
                            </select>
                        </td>
                        <td align="center">
                            <select id="select3" name="select3">
                                <option value="1">����</option>
                                <option value="0">��ͯ</option>
                            </select>
                        </td>
                        <td align="center">
                            <input name="Input" id="Input" size="10" />
                        </td>
                        <td align="center">
                            <input name="Input3" id="Input3" size="30" style="width: 120px;" />
                            <input name="checkbox" type="checkbox" value="checkbox" checked="checked" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            2
                        </td>
                        <td align="center">
                            <input value="�ο�" size="8" name="CustomerName12" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo1432" id="CertificateNo143" size="11" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo1434" id="CertificateNo1433" size="18" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo1436" id="CertificateNo1435" size="18" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <input name="CertificateNo1438" id="CertificateNo1437" size="18" style="width: 80px;" />
                        </td>
                        <td align="center">
                            <select id="select2" name="select2">
                                <option selected="selected" value="1">��</option>
                                <option value="0">Ů</option>
                            </select>
                        </td>
                        <td align="center">
                            <select id="select4" name="select4">
                                <option value="1">����</option>
                                <option value="0">��ͯ</option>
                            </select>
                        </td>
                        <td align="center">
                            <input name="Input2" id="Input2" size="10" />
                        </td>
                        <td align="center">
                            <input name="Input32" id="Input32" size="30" style="width: 120px;" />
                            <input name="checkbox2" type="checkbox" value="checkbox" checked="checked" />
                        </td>
                    </tr>
                </table>--%>
    <div id="<%=tblID %>" class="tablebox">
        <!--�����Ϣ���-->
        <table width="100%" border="0" align="center">
            <tbody>
                <tr>
                    <td valign="top" align="left" class="ftxt">
                        <table cellspacing="0" cellpadding="3" bordercolor="#9dc4dc" border="1" align="center"
                            style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td valign="top" align="left" colspan="2">
                                        <img src="<%=ImageServerUrl %>/images/jiben3.gif">
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>������</strong>��
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" ID="lblOrderNo" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>��·���ƣ�</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblRouteName"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�������ڣ�</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblLeaveDate"></asp:Label>
                                        <strong>��ǰʣ���λ��</strong><asp:Label runat="server" Text="" ID="lblCount"></asp:Label>&nbsp;&nbsp;
                                        <strong>״̬��</strong><asp:Label runat="server" Text="" ID="lblTourState"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="18%" bgcolor="#F2F9FE" align="right">
                                        <strong>������λ��</strong>
                                    </td>
                                    <td align="left">
                                        <input type="hidden" id="hideTravelID" runat="server" />
                                        <input id="txtTravel" name="txtTravel" value="" runat="server" readonly="readonly" />
                                        <a id="btnSelectTravel" href="javascript:void(0);">
                                            <img width="28" height="18" align="absmiddle" src="<%=ImageServerUrl %>/images/icon_select.jpg"></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�������У�</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblLeaveCity"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>��ͨ��</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblCar"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>����ʱ�� ���ࣺ</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblLeaveCon"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>����ʱ�� ���ࣺ</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblBackCon"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>����˵����</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblMsg"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>���ȫ��˵����</strong>
                                    </td>
                                    <td align="left">
                                        <asp:Label runat="server" Text="" ID="lblAllMsg"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�ο���ϵ�ˣ�</strong>
                                    </td>
                                    <td align="left">
                                        <input id="txtContact" name="txtContact" value="" runat="server">
                                        ��ϵ�绰
                                        <input id="txtConTactTel" name="txtConTactTel" value="" runat="server">
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�̼Ҹ����ˣ�</strong>
                                    </td>
                                    <td align="left">
                                        <input id="txtFzr" name="txtFzr" runat="server">
                                        ��ϵ�绰
                                        <input id="txtFzrTel" name="txtFzrTel" runat="server">
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�г��ۣ�</strong>
                                    </td>
                                    <td align="left">
                                        ����
                                        <asp:Label runat="server" Text="" ID="lblRetailAdultPrice"></asp:Label>
                                        Ԫ����ͯ<asp:Label runat="server" Text="" ID="lblRetailChildrenPrice"></asp:Label>
                                        Ԫ��������
                                        <asp:Label runat="server" Text="" ID="lblMarketPrice"></asp:Label>
                                        Ԫ
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        ����ۣ�
                                    </td>
                                    <td align="left">
                                        ����
                                        <asp:Label runat="server" Text="" ID="lblSettlementAudltPrice"></asp:Label>
                                        Ԫ����ͯ
                                        <asp:Label runat="server" Text="" ID="lblSettlementChildrenPrice"></asp:Label>
                                        Ԫ �������ۼ�
                                        <input id="txtAddPrice" name="txtAddPrice" runat="server">
                                        Ԫ
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�۸���ɣ�</strong>
                                    </td>
                                    <td align="left">
                                        ����
                                        <input id="txtAdultCount" name="txtAdultCount" runat="server">
                                        �ˣ���ͯ
                                        <input id="txtChildCount" name="txtChildCount" runat="server">
                                        �ˣ�������
                                        <input id="txtOtherCount" name="txtOtherCount" runat="server">��
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <uc1:ordercustomer id="OrderCustomer1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�����籸ע��</strong>
                                    </td>
                                    <td align="left">
                                        <textarea rows="4" cols="85" id="txtRemark" runat="server"></textarea>
                                    </td>
                                </tr>
                                <tr sizset="14" sizcache="0">
                                    <td bgcolor="#F2F9FE" align="right">
                                        <strong>�ܽ�</strong>
                                    </td>
                                    <td align="left" sizset="14" sizcache="0">
                                        ���ۼ�<asp:Label runat="server" Text="" ID="lblReailPriceAll"></asp:Label>
                                        &nbsp; �����
                                        <asp:Label runat="server" Text="" ID="lblSettlePriceAll"></asp:Label>
                                    </td>
                                </tr>
                                <tr sizset="14" sizcache="0">
                                    <td align="center" colspan="2">
                                        <a class="baocun_btn" href="javascript:void(0);" id="btnSave">�� ��</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <script type="text/javascript">
    var AddOrderByRoute = {
        BoxDiv: $("#<%=tblID %>"),
        TourID: '<%=Request.QueryString["tourID"] %>',
        UpdatePrice: function() {
            var adultCount = parseInt(this.BoxDiv.find("[id$=<%=txtAdultCount.ClientID %>]").val());  //������
            var childCount = parseInt(this.BoxDiv.find("[id$=<%=txtChildCount.ClientID %>]").val());  //��ͯ��
            var otherCount = parseInt(this.BoxDiv.find("[id$=<%=txtOtherCount.ClientID %>]").val());  //������
            var reAdultPrice = parseInt(this.BoxDiv.find("[id$=<%=lblRetailAdultPrice.ClientID %>]").html());  //�����г���
            var reChilePrice = parseInt(this.BoxDiv.find("[id$=<%=lblRetailChildrenPrice.ClientID %>]").html()); //��ͯ�г���
            var reOtherPrice = parseInt(this.BoxDiv.find("[id$=<%=lblMarketPrice.ClientID %>]").html());    //������۸�
            var seAdultPrice = parseInt(this.BoxDiv.find("[id$=<%=lblSettlementAudltPrice.ClientID %>]").html()); //���˽����
            var seChildPrice = parseInt(this.BoxDiv.find("[id$=<%=lblSettlementChildrenPrice.ClientID %>]").html()); //��ͯ�����
            var addPrice = parseInt(this.BoxDiv.find("[id$=<%=txtAddPrice.ClientID %>]").val());  //���������

            //�����������
            if (!adultCount > 0) { adultCount = 0; }
            if (!childCount > 0) { childCount = 0; }
            if (!otherCount > 0) { otherCount = 0; }
            if (!reAdultPrice > 0) { reAdultPrice = 0; }
            if (!reChilePrice > 0) { reChilePrice = 0; }
            if (!reOtherPrice > 0) { reOtherPrice = 0; }
            if (!seAdultPrice > 0) { seAdultPrice = 0; }
            if (!seChildPrice > 0) { seChildPrice = 0; }
            if (!addPrice > 0) { addPrice = 0; }

            //�г��ܼ�
            var rePriceAll = adultCount * reAdultPrice + childCount * reChilePrice + otherCount * reOtherPrice;
            rePriceAll = parseInt(rePriceAll * 100) / 100;
            //�����ܼ�
            var sePriceAll = adultCount * seAdultPrice + childCount * seChildPrice + addPrice;
            sePriceAll = parseInt(sePriceAll * 100) / 100;

            this.BoxDiv.find("[id$=<%=lblReailPriceAll.ClientID %>]").html(rePriceAll);
            this.BoxDiv.find("[id$=<%=lblSettlePriceAll.ClientID %>]").html(sePriceAll);
        },
        SubmitForm: function() {
            var adultCount = parseInt($.trim(AddOrderByRoute.BoxDiv.find("[id$=<%=txtAdultCount.ClientID %>]").val()));
            if (!adultCount > 0) {
                alert("�����������!");
                return;
            }
            if ($.trim(AddOrderByRoute.BoxDiv.find("[id$=<%=txtTravel.ClientID %>]").val()) == "") {
                alert("��ѡ��������!");
                return;
            }
            this.BoxDiv.find("#btnSave").html("�ύ��..");
            this.BoxDiv.find("#btnSave").unbind();
            $.ajax({
                type: "POST",
                url: "/LineManage/RouteAgency/AddOrderByRoute.aspx?tourID=" + AddOrderByRoute.TourID + "&dotype=save&v=" + Math.random(),
                data: AddOrderByRoute.BoxDiv.find("#btnSave").closest("form").serialize(),
                cache: false,
                success: function(state) {
                    if (state == "ok") {
                        alert("�����ύ�ɹ�!");
                        topTab.open("/LineManage/RouteAgency/neworders.aspx", "����ɢ�Ͷ���");
                    } else {
                        alert(state);
                        AddOrderByRoute.BoxDiv.find("#btnSave").html("�� ��");
                        AddOrderByRoute.BoxDiv.find("#btnSave").click(function() {
                            AddOrderByRoute.SubmitForm();
                        })
                    }
                },
                error: function() {
                    alert("������æ,���Ժ�����!");
                    AddOrderByRoute.BoxDiv.find("#btnSave").html("�� ��");
                    AddOrderByRoute.BoxDiv.find("#btnSave").click(function() {
                        AddOrderByRoute.SubmitForm();
                    })
                }
            });
        }
    }

    function backCallFun(data) {
        AddOrderByRoute.BoxDiv.find("#<%=hideTravelID.ClientID %>").val(data.comID);
        AddOrderByRoute.BoxDiv.find("#<%=txtTravel.ClientID %>").val(data.comName);
        AddOrderByRoute.BoxDiv.find("#<%=txtFzr.ClientID %>").val(data.conName);
        AddOrderByRoute.BoxDiv.find("#<%=txtFzrTel.ClientID %>").val(data.conTel);
    }
    $(function() {
        AddOrderByRoute.BoxDiv.find("#btnSave").click(function() {

            AddOrderByRoute.SubmitForm();
        })
        AddOrderByRoute.BoxDiv.find("#<%=txtAdultCount.ClientID %>,#<%=txtChildCount.ClientID %>,#<%=txtOtherCount.ClientID %>,#<%=txtAddPrice.ClientID %>").blur(function() {

            AddOrderByRoute.UpdatePrice();
        })

        AddOrderByRoute.BoxDiv.find("#btnSelectTravel").click(function() {
            Boxy.iframeDialog({ title: "ѡ��λ", iframeUrl: "/LineManage/QueryTour.aspx?type=new&backCallFun=backCallFun", height: 400, width: 760, draggable: false });
            return false;
        })


    })
    </script>

    </form>
</body>
</html>

<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AddLine.aspx.cs"
    Inherits="SiteOperationsCenter.LineManage.AddLine" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../usercontrol/Linecontrol/TourStandardPlan.ascx" TagName="TourStandardPlan"
    TagPrefix="uc1" %>
<%@ Register Src="../usercontrol/Linecontrol/TourServiceStandard.ascx" TagName="TourServiceStandard"
    TagPrefix="uc2" %>
<%@ Register Src="../usercontrol/SingleFileUpload.ascx" TagName="SingleFileUpload"
    TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��·����-�����·</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("swfupload") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("swfupload") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <script type="text/javascript">
        var commonTourModuleData = {
            _data: [],
            add: function(obj) {
                this._data[obj.ContainerID] = obj;
            },
            get: function(id) {
                return this._data[id];
            }
        };
    </script>

    <script type="text/javascript">
        commonTourModuleData.add({
            ContainerID: 'form1',
            ReleaseType: 'AddStandardTour'
        });
    </script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("CommonTourModule") %>"></script>

    <script type="text/javascript" src="<%=EyouSoft.Common.JsManage.GetJsFilePath("CommonTour") %>"
        cache="true"></script>

    <script type="text/javascript" language="javascript">
        //<!CDATA**�г�**��ť�л�[
        function g(o) { return document.getElementById(o); }
        function HoverLi(n) {
            //�����N����ǩ,�ͽ�i<=N;
            //�����ܷǳ�OK,����IE7,FF,IE6;
            for (var i = 1; i <= 2; i++) { g('tb_' + i).className = 'normaltab'; g('tbc_0' + i).className = 'undis'; } g('tbc_0' + n).className = 'dis'; g('tb_' + n).className = 'hovertab';
            if (n == 2) {
                TourModule.TourDaysFocus('form1', '100');
            }
        }
        //���Ҫ���ɵ������ת���뽫<li>�е�onmouseover �ĳ� onclick;
        //]]>
    </script>

    <script type="text/javascript" language="javascript">
        //<!CDATA**���۰���**��ť�л�[
        function g(o) { return document.getElementById(o); }
        function HoverLi1(n) {
            //�����N����ǩ,�ͽ�i<=N;
            //�����ܷǳ�OK,����IE7,FF,IE6;
            for (var i = 1; i <= 2; i++) { g('tb1_' + i).className = 'normaltab1'; g('tbc1_0' + i).className = 'undis1'; } g('tbc1_0' + n).className = 'dis1'; g('tb1_' + n).className = 'hovertab1';
        }
        //���Ҫ���ɵ������ת���뽫<li>�е�onmouseover �ĳ� onclick;
        //]]>
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hidOperatType" runat="server" />
    <table width="98%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC"
        class="lr_hangbg table_basic ">
        <tr>
            <td colspan="2" align="left" valign="top" bgcolor="#FFFFFF">
                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/jiben3.gif" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font>��·��Դ��
            </td>
            <td align="left" bgcolor="#FFFFFF" id="Td4">
                <input type="radio" name="radiolxs" id="chkzx" runat="server" onclick="Changechkdj(this)"
                    value="1" /><label for="chkzx" hidefocus="false">ר����</label>
                <input type="radio" name="radiolxs" id="chkdj" runat="server" onclick="Changechkdj(this)"
                    value="2" /><label for="chkdj" hidefocus="false">�ؽ���</label>
            </td>
        </tr>
        <tr>
            <td width="16%" align="right">
                <font class="ff0000">*</font> ר�����ͣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="dropWord" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font>��·����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:HiddenField ID="hideAreaTypeID" runat="server" />
                <asp:TextBox ID="txtAreaType" runat="server" ReadOnly="true" BackColor="#dadada"></asp:TextBox><a
                    id="a_AreaType" href="javascript:void(0);">
                    <img width="28" height="18" align="absmiddle" src="<%=ImageServerUrl %>/images/icon_select.jpg"></a>
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> �����磺
            </td>
            <td align="left" bgcolor="#FFFFFF" id="Td2">
                <asp:HiddenField ID="hideCompanyID" runat="server" />
                <asp:TextBox ID="txtCompany" runat="server" ReadOnly="true" BackColor="#dadada"></asp:TextBox>
                <a id="btnSelectTravel" href="javascript:void(0);">
                    <img width="28" height="18" align="absmiddle" src="<%=ImageServerUrl %>/images/icon_select.jpg"></a>
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> ��ϵ�ˣ�
            </td>
            <td align="left" bgcolor="#FFFFFF" id="Td3">
                <asp:DropDownList ID="dropPublisher" runat="server">
                    <asp:ListItem Value="0">��ѡ��</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> ��������
            </td>
            <td align="left" bgcolor="#FFFFFF" id="trBindSaleCite">
                <asp:Label ID="lblSSArea" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> ��·���ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input name="txt_LineName" type="text" id="txt_LineName" runat="server" size="45" />
            </td>
        </tr>
        <tr>
            <td align="right">
                B2C��վ��·����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input id="txt_D2BwebSite" size="60" name="txt_D2BwebSite" runat="server" />
                ����ŵ����Ա���ƣ�
            </td>
        </tr>
        <tr>
            <td align="right">
                B2B��ʾ���ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="dropB2B" runat="server">
                </asp:DropDownList>
                <input id="txt_B2B" runat="server" size="10" name="txt_B2B" value="50" valid="required|limit"
                    max="100" />
                ��1~50����������Ĭ��50����ŵ����Ա���ƣ�
            </td>
        </tr>
        <tr>
            <td align="right">
                B2C��ʾ���ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="dropB2C" runat="server">
                </asp:DropDownList>
                <input id="txt_B2C" size="10" name="txt_B2C" runat="server" max="100" value="50" />
                ��1~50����������Ĭ��50����ŵ����Ա���ƣ�
            </td>
        </tr>
        <tr>
            <td align="right">
                ���ͣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="dropRecommendType" runat="server">
                </asp:DropDownList>
                ���Ƽ�״ֻ̬����ŵ�����޸ģ�Ĭ���Ƽ���·������ӳɣ�
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> ��ͨ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                ������
                <asp:DropDownList ID="dropStartTraffic" runat="server">
                </asp:DropDownList>
                ���أ�
                <asp:DropDownList ID="dropEndTraffic" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr name="showCity" style="display: none;">
            <td align="right">
                ��Ҫ�������У�
            </td>
            <td align="left" bgcolor="#FFFFFF" id="trlistMBrowseCity">
            </td>
        </tr>
        <tr name="showword" style="display: none;">
            <td align="right">
                ��Ҫ�������ң�
            </td>
            <td align="left" bgcolor="#FFFFFF" id="trlistMBrowseCountryControl">
            </td>
        </tr>
        <tr name="showword" style="display: none;">
            <td align="right">
                ǩ֤��ͨ��֤��
            </td>
            <td align="left" bgcolor="#FFFFFF" id="tdIsviso">
                <label for="<%= AddStandardTour_radIsviso0.ClientID %>" hidefocus="false">
                    <input runat="server" type="checkbox" name="IsOrNoradIsviso" onclick="IsorNoViso(this)" id="AddStandardTour_radIsviso0"
                        value="0" />��ǩ</label>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��·����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                ����
                <input id="txt_Adultdeposit" runat="server" size="10" name="txt_Adultdeposit" />
                Ԫ ��ͯ
                <input name="txt_Childrendeposit" id="txt_Childrendeposit" type="text" runat="server" />
                Ԫ������0 ��ʾ����֧������
            </td>
        </tr>
        <tr>
            <td align="right">
                ��·��ͼ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <uc3:SingleFileUpload ID="SfUpload" runat="server" IsGenerateThumbnail="true" ImageHeight="400"
                    ImageWidth="300" />
                <asp:Literal ID="lalUploadImg" runat="server"></asp:Literal>
                <asp:HiddenField ID="hidUploadImg" runat="server" />
                <span id="errMsgsfuPhotoImg" style="color: Red"></span>����ѱ���3:2��������2M���ϴ������ɵȱ����ŵ�800�ֱ���һ�£�
            </td>
        </tr>
        <tr>
            <td align="right">
                ��·��ɫ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_LineFeatures" id="txt_LineFeatures" runat="server" cols="65"
                    rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                �������ţ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                ��С��������
                <input name="txt_Tourminnumber" runat="server" id="txt_Tourminnumber" type="text"
                    size="10" />
                �ŶӲο��۸�
                <input name="txt_TeamPrice" id="txt_TeamPrice" runat="server" type="text" size="10" />
                �������ο����г��ۣ�0Ϊһ��һ�飩
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> ������
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input name="AddStandardTour_txtTourDays" id="AddStandardTour_txtTourDays" runat="server"
                    type="text" class="bitian" size="5" valid="required|RegInteger|custom" custom="CheckMaxDay" />
                <span id="errMsg_<%=AddStandardTour_txtTourDays.ClientID %>" class="errmsg"></span>
                ��
                <input name="txt_Late" id="txt_Late" runat="server" type="text" size="6" />
                �� ��<font class="ff0000">ס������</font>��
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> ��ǰ���챨����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                ��ǰ
                <input id="txt_AdvanceDayRegistration" size="4" name="txt_AdvanceDayRegistration"
                    runat="server" />
                �죨���ڼ��㱨����ֹʱ�䣬�뾡��д׼ȷ��
                <input type="checkbox" name="chkIsCertain" id="chkIsCertain" value="1" runat="server" />
                ɢ�ͱ���������ţ���������
            </td>
        </tr>
        <tr>
            <td align="right">
                ��·���⣺
            </td>
            <td align="left" bgcolor="#FFFFFF" id="tdMThemeControl">
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> �������У�
            </td>
            <td align="left" bgcolor="#FFFFFF" id="tdBindLeaveCity">
                <asp:Literal ID="litLeaveCity" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right">
                <font class="ff0000">*</font> ���س��У�
            </td>
            <td align="left" bgcolor="#FFFFFF" id="tdBindBackCity">
                <asp:Literal ID="litbackcity" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr id="tr_xc">
            <td align="right" valign="top" style="padding-top: 50px;">
                <font class="ff0000">*</font>�г�(��׼���ͨ������������)��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                    <tr>
                        <td>
                            <div id="tb_" class="tb_">
                                <ul>
                                    <li id="tb_1" class="hovertab" onclick="HoverLi(1);"><a>���װ�</a></li>
                                    <li id="tb_2" class="normaltab" onclick="HoverLi(2);"><a>��׼��</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="width: 96%;">
                                <div class="dis" id="tbc_01">
                                    <asp:TextBox ID="txtTravel" runat="server" valid="required"></asp:TextBox>
                                </div>
                                <div class="undis" id="tbc_02">
                                    <uc1:TourStandardPlan ID="AddStandardTour_StandardPlan" ContainerID="form1" runat="server"
                                        ReleaseType="AddStandardTour" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" style="padding-top: 50px;">
                <font class="ff0000">*</font> ���۰�����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <table width="100%" border="0" cellspacing="0" cellpadding="3">
                    <tr>
                        <td>
                            <div id="tb1_" class="tb1_">
                                <ul>
                                    <li id="tb1_1" class="hovertab1" onclick="HoverLi1(1);"><a>���װ�</a></li>
                                    <li id="tb1_2" class="normaltab1" onclick="HoverLi1(2);"><a>��׼��</a> </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="width: 80%;">
                                <div class="dis1" id="tbc1_01">
                                    <textarea name="txt_Priceincludes" id="txt_Priceincludes" runat="server" cols="85"
                                        rows="5"></textarea>
                                </div>
                                <div class="undis1" id="tbc1_02">
                                    <uc2:TourServiceStandard ID="AddStandardRoute_ServiceStandard" runat="server" ReleaseType="AddStandardRoute"
                                        ContainerID="form1" />
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���۲�����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_PriceExcluding" id="txt_PriceExcluding" runat="server" cols="85"
                    rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                ������Ŀ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Giftitems" id="txt_Giftitems" runat="server" cols="85" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ͯ���������ţ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Childrenandotherarrangements" id="txt_Childrenandotherarrangements"
                    runat="server" cols="85" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���ﰲ�ţ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Shoppingarrangements" id="txt_Shoppingarrangements" runat="server"
                    cols="85" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                �Է���Ŀ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Projectattheirownexpense" id="txt_Projectattheirownexpense" runat="server"
                    cols="85" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��������֪��<br />
                ֻ���������ܿ�����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_VendorInformation" id="txt_VendorInformation" runat="server"
                    cols="85" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ע��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Remarks" id="txt_Remarks" runat="server" cols="85" rows="5"></textarea>
            </td>
        </tr>
        <tr>
            <td height="35" colspan="2" align="center" bgcolor="#FFFFFF">
                <asp:Button ID="btn_save" runat="server" Text="����󣬷�����·��" OnClick="btn_save_Click" />
            </td>
        </tr>
        <%--���۳���--%>
        <asp:HiddenField ID="hidsqlcity" runat="server" />
        <%--�г�����--%>
        <asp:HiddenField ID="hidReleaseType" runat="server" />
        <%--ר����id--%>
        <asp:HiddenField ID="hideTravelID" runat="server" />
        <%--ר��������--%>
        <asp:HiddenField ID="hideTravelName" runat="server" />
        <%--��ϵ��ID--%>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <%--��ϵ������--%>
        <asp:HiddenField ID="HiddenField2" runat="server" />
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("dcommon") %>"></script>

    <script type="text/javascript" src="/kindeditor/kindeditor-min.js"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>

    <script type="text/javascript">
        $("#form1").find("input[type=text][id$=TourDays]").attr("errmsg", "����д����!|����ֻ��������!|�������ܴ���100��!");
        CheckFormIsChange.recodeInitialDataForm($("#form1").get(0));

        function CheckMaxDay(e, formElements) {
            if (parseInt(e.value) <= parseInt(100)) {
                return true;
            } else {
                return false;
            }
        }

        KE.init({
            id: '<%=txtTravel.ClientID %>', //�༭����Ӧ�ı���id
            width: '700px',
            height: '150px',
            skinsPath: '/kindeditor/skins/',
            pluginsPath: '/kindeditor/plugins/',
            scriptPath: '/kindeditor/skins/',
            resizeMode: 0, //��߲��ɱ�
            items: keSimple //����ģʽ(keMore:�๦��,keSimple:����)
        });


        //ѡ��ؽ���
        function Changechkdj(obj) {
            var midvalue = "";
            if ($("#hidsqlcity").val() != "" || $("#hidsqlcity").val() != "ȫ��")
                midvalue = $("#hidsqlcity").val();
            else
                midvalue = $("#trBindSaleCite").html();
            if ($("#chkdj").attr("checked")) {
                $("#hidsqlcity").val(midvalue);
                $("#trBindSaleCite").html("ȫ��");
            }
            else {
                $("#trBindSaleCite").html("");
                $("#trBindSaleCite").html(midvalue);
            }
        }



        //ר�����ͣ����ڹ����ܱߵȵȣ�
        function OnchangeWord(v, t, s) {

            if ("<%=lineid %>" != "") {
                return false;
            }

            var LineType = $("#dropWord").val();
            var LineID = $("#<%=hideAreaTypeID.ClientID %>").val();

            if (LineType == "1") {
                $("tr[name='showword']").show();
                $("tr[name='showCity']").hide();
            }
            else {
                $("tr[name='showword']").hide();
                $("tr[name='showCity']").show();

            }

            //ѡ�еؽ���
            if (s != null) {
                var selectDj = null;
                var selectval = null;
                if (s.toString().split('$').length == 2) {
                    selectval = s.toString().split('$')[0];
                    selectDj = s.toString().split('$')[1];
                }
            }
            //ѡ�еؽ���
            var IsChecked = $("#chkdj").attr("checked");
            $.ajax({
                url: "AddLine.aspx?type=" + t + "&argument=" + v + "&LineId=<%=lineid %>&IsChecked=" + IsChecked,
                cache: false,
                type: "GET",
                dataType: "json",
                success: function(result) {
                    switch (t) {
                        case "GetContactByBusinessLineId": //��ȡ��ϵ��ͨ��ר����
                            var listContact = result.tolist;
                            $("#<%=dropPublisher.ClientID %>").html("");
                            $("#<%=dropPublisher.ClientID %>").append("<option value=\"0\">��ѡ��</option>");
                            for (var x = 0; x < listContact.length; x++) {
                                $("#<%=dropPublisher.ClientID %>").append("<option value=\"" + listContact[x].ID + "\">" + listContact[x].UserNameID + "</option>");
                            }
                            setTimeout(function() {
                                $("#<%=dropPublisher.ClientID %> option[value='" + s + "']").attr("selected", true);
                            }, 1);
                            break;
                    }
                },
                error: function() {
                    alert("����ʧ��!");
                }
            });
        }



        //���۳���  ���۳���  ��ҪԤ������
        function OnchangeWordByGey(v, t, selected) {
            if ("<%=lineid %>" != "") {
                return false;
            }
            var LineType = $("#dropWord").val();
            if (LineType == "1") {
                $("tr[name='showword']").show();
                $("tr[name='showCity']").hide();
                if (t == "listMBrowseCity")
                    return false;
            }
            else {
                $("tr[name='showword']").hide();
                $("tr[name='showCity']").show();
                if (t == "listMBrowseCountryControl")
                    return false;
            }

            $.ajax({
                url: "AddLine.aspx?type=" + t + "&argument=" + v + "&LineId=<%=lineid %>",
                cache: false,
                type: "GET",
                dataType: "html",
                success: function(result) {
                    switch (t) {
                        case "BindSaleCite": //��ȡ���۳���
                            $("#hidsqlcity").val(result);
                            if ($("#chkdj").attr("checked"))
                                $("#trBindSaleCite").html("ȫ��");
                            else
                                $("#trBindSaleCite").html(result);
                            break;
                        case "BindLeaveCity": //��ȡ���۳���
                            $("#tdBindLeaveCity").html(result);
                            break;
                        case "BindBackCity": //��ȡ���س���
                            $("#tdBindBackCity").html(result);
                            break;
                        case "listMBrowseCountryControl": //��ҪԤ������
                            $("#trlistMBrowseCountryControl").html(result);
                            break;
                        case "listMBrowseCity": //��ҪԤ������
                            $("#trlistMBrowseCity").html(result);
                            break;

                    }
                },
                error: function() {
                    alert("����ʧ��!");
                }
            });
        }




        //ѡ���Ƿ�ǩ֤
        function IsViso(obj) {
            var str = "";

            if ($("#tdIsviso #AddStandardTour_radIsviso" + $(obj).val() + "").length > 0) {
                if (!$(obj).attr("checked")) {
                    $("#tdIsviso #AddStandardTour_radIsviso" + $(obj).val()).closest('label').remove();
                }
            }
            else {
                $("#tdIsviso").append("<label for=\"AddStandardTour_radIsviso" + $(obj).val() + "\" hideFocus=\"false\"><input type=\"checkbox\" name=\"AddStandardTour_radIsviso\" id=\"AddStandardTour_radIsviso" + $(obj).val() + "\"  value=\"" + $(obj).val() + "\" />" + $(obj).closest('label').text() + "ǩ֤</label>");
            }
        }

        //�Ƿ���ǩ
        var str = "";
        function IsorNoViso(obj) {
            if ($(obj).attr("checked")) {
                if ($("#tdIsviso input[name=AddStandardTour_radIsviso]").length > 0) {
                    $("#tdIsviso input[name=AddStandardTour_radIsviso]").each(function() {
                        if ($(this).attr("checked")) {
                            str += $(this).val() + "&";
                        }
                        $(this).attr("checked", "");
                        $(this).attr("disabled", "disabled");
                    })
                }
            }
            else {
                if ($("#tdIsviso input[name=AddStandardTour_radIsviso]").length > 0) {
                    $("#tdIsviso input[name=AddStandardTour_radIsviso]").each(function() {
                        $(this).attr("disabled", "");
                    })
                }

                var strlist = str.split('&');
                $.each(strlist, function(j) {
                    if (strlist[j] != "") {
                        $("#tdIsviso #AddStandardTour_radIsviso" + strlist[j]).attr("checked", "checked");
                    }
                })
            }
        }



        //ר���Լ�ר���̸�ֵ
        function SelectValue(vLine, vpublicer) {

        }

        $("#<%=AddStandardTour_txtTourDays.ClientID %>").blur(function() {
            TourModule.TourDaysFocus('form1', '100');
        });




        //����
        function SetMThemeControl(v) {
            $("#tdMThemeControl").html(v);
        }
        //��������
        function SetLeaveCity(v) {
            $("#tdBindLeaveCity").html(v);
        }
        //���س���
        function SetBackCity(v) {
            $("#tdBindBackCity").html(v);
        }
        //���۳���
        function SetSaleCite(v) {
            $("#trBindSaleCite").html(v);
        }
        //��ҪԤ������
        function SetBrowseCity(v) {
            $("#trlistMBrowseCity").html(v);
        }

        //��ҪԤ������
        function SetBrowseCountryControl(v) {
            $("#trlistMBrowseCountryControl").html(v);
        }

        //��ҪԤ������ǩ֤
        function SetAddStandardTour_radIsviso(v) {
            $("#tdIsviso").append(v);
        }


        function OpenDialoge(CompanyId, LeaveCity) {
            Boxy.iframeDialog({ title: "���ó��ó��۳���", iframeUrl: "/LineManage/SetLeaveCity.aspx?ReleaseType=AddStandardTour&CompanyId=" + CompanyId + "&CityId=" + LeaveCity + "&type=LeaveCity&ContainerID=form1&rnd=" + Math.random(), height: 650, width: 450 })
        }

        function backCallFun(data, key) {

        }
        
        
    </script>

    <script type="text/javascript">

        var isSubmit = false;
        $(function() {

            $("#a_AreaType").click(function() {
                if ($("#<%=dropWord.ClientID %>").val() == "-1") {
                    alert("��ѡ��ר������");
                    return false;
                }
                Boxy.iframeDialog({ title: "ר������", iframeUrl: "/LineManage/AreaSelect.aspx?backCallFun=BackCallFun&typeId=" + $("#<%=dropWord.ClientID %>").val() + "&rnd=" + Math.random(), height: 400, width: 750, draggable: false });
                return false;
            })

            $("#btnSelectTravel").click(function() {
                var AeraID = $("#<%=hideAreaTypeID.ClientID %>").val();
                var comType = $("input[name='radiolxs']:checked").val();
                if (!comType) {
                    alert("��ѡ����·��Դ��");
                    return;
                }
                Boxy.iframeDialog({ title: "ѡ��λ", iframeUrl: "/LineManage/QueryTour.aspx?type=new&comType=" + comType + "&AeraID=" + AeraID + "&backCallFun=BackCallFun", height: 400, width: 750, draggable: false });
                return false;
            })

            var linetype = $("#<%=dropWord.ClientID %>").val();
            var line = $("#<%=hideAreaTypeID.ClientID %>").val();
            KE.create('<%=txtTravel.ClientID %>', 0);

            if (linetype == "1")//��·��������
            {
                $("tr[name='showword']").show();
            }
            $("#<%=btn_save.ClientID%>").click(function() {
                if (isSubmit) {
                    //�����ť�Ѿ��ύ��һ����֤���򷵻�ִ�б������
                    return true;
                }

                //��·��Դ
                if (!$("#chkzx").attr("checked") && !$("#chkdj").attr("checked")) {
                    alert("��ѡ����·��Դ");
                    return false;
                }
                //��·��Դ


                //ר������  ר����  ר����ϵ��
                var linetype = $("#<%=dropWord.ClientID%>").val(); //ר������
                var line = $("#<%=hideAreaTypeID.ClientID%>").val(); //ר��
                var businessLine = $("#<%=hideCompanyID.ClientID%>").val(); //ר����
                var contactname = $("#<%=dropPublisher.ClientID%>").val(); //��ϵ��
                if ('<%=lineid %>' == "" && linetype != "3") {
                    if (linetype == "-1") {
                        alert("��ѡ��ר������");
                        $("#<%=dropWord.ClientID%>").focus();
                        return false;
                    }
                    if (line == "0") {
                        alert("��ѡ��ר��");
                        $("#<%=txtAreaType.ClientID%>").focus();
                        return false;
                    }
                    if (businessLine == "0") {
                        alert("��ѡ��ר����");
                        $("#<%=hideCompanyID.ClientID%>").focus();
                        return false;
                    }
                    if (contactname == "0") {
                        alert("��ѡ����ϵ��");
                        $("#<%=dropPublisher.ClientID%>").focus();
                        return false;
                    }
                }

                //��������
                var num = 0;
                $("input[name='AddLine_chkSaleCity']").each(function() {
                    if ($(this).attr("checked")) {
                        num++;
                    }
                });
                if (num == 0) {
                    if (!$("#chkdj").attr("checked")) {
                        if ($.trim($("#trBindSaleCite").html()) != "") {
                            alert("��ѡ����������");
                            return false;
                        }
                    }
                }

                //��·����
                var Linename = $("#<%=txt_LineName.ClientID%>").val();
                if (Linename == "") {
                    alert("��������·����");
                    $("#<%=txt_LineName.ClientID%>").focus();
                    return false;
                }

                //��ͨ
                var start = $("#<%=dropStartTraffic.ClientID%>").val(); //������ͨ
                var back = $("#<%=dropEndTraffic.ClientID%>").val(); //������ͨ
                if (start == "0" || back == "0") {
                    alert("��ѡ���ͨ");
                    $("#<%=dropStartTraffic.ClientID%>").focus();
                    return false;
                }


                //��·��ͼ
                if (SfUpload.getStats().files_queued <= 0) {
                    var hidimg = $("<%=hidUploadImg.ClientID %>").val();
                    if (hidimg == "") {
                        $("#errMsgsfuPhotoImg").html("��ѡ��һ��ͼƬ");
                        return false;
                    }
                }

                if (SfUpload.getStats().files_queued > 0) {//��ͼƬ
                    SfUpload.customSettings.UploadSucessCallback = FormSubmit;
                    SfUpload.startUpload();
                    return false;
                }


                //����
                var day = $("#<%=AddStandardTour_txtTourDays.ClientID%>").val(); //����
                if (day == "" || day == "0") {
                    alert("�����������������0");
                    $("#<%=AddStandardTour_txtTourDays.ClientID%>").focus();
                    return false;
                }

                //��������
                num = 0;
                $("input[name='AddStandardTour_radPortCity']").each(function() {
                    if ($(this).attr("checked")) {
                        num++;
                    }
                });
                if (num == 0) {
                    if (linetype != "3") {
                        alert("��ѡ���������");
                        return false;
                    }
                }
                //���س���
                num = 0;
                $("input[name='AddStandardTour_radBackCity']").each(function() {
                    if ($(this).attr("checked")) {
                        num++;
                    }
                });
                if (num == 0) {
                    if (linetype != "3") {
                        alert("��ѡ�񷵻س���");
                        return false;
                    }
                }



                //��ǰ���챨��
                var earlyday = $("#<%=txt_AdvanceDayRegistration.ClientID%>").val(); //��ǰ����
                if (earlyday == "" || earlyday == "0") {
                    alert("��������ǰ�����������0");
                    $("#<%=txt_AdvanceDayRegistration.ClientID%>").focus();
                    return false;
                }

                //��ǰ���챨��


                //�ж��г̱�׼��Ľ�ͨ����
                var dropReleaseType = $("#tb_2").attr("class"); //ר�߷�������
                var number = 0;
                if (dropReleaseType == "hovertab") {
                    $("#tr_xc select").each(function() {
                        if ($(this).val() == "") {
                            number++;
                        }
                    })
                    if (number > 0) {
                        alert("��ѡ���г̱�׼��Ľ�ͨ����");
                        return false;
                    }
                    $("#hidReleaseType").val("0");
                }
                else {
                    if ($("#<%=txtTravel.ClientID%>").val() == "")//getEditorTextContents
                    {
                        alert("�����г̲���Ϊ��");
                        return false;
                    }
                    $("#hidReleaseType").val("1");
                }
                //�ж��г̱�׼��Ľ�ͨ����

                //���۰���
                var Priceincludes2 = $("#tb1_1").attr("class");
                if (Priceincludes2 == "hovertab1") {
                    var Priceincludes = $("#<%=txt_Priceincludes.ClientID%>").val(); //���۰���
                    if (Priceincludes == "" && $("#tbc1_01").css("display") != "none") {
                        alert("���۰�������Ϊ��");
                        $("#<%=txt_Priceincludes.ClientID%>").focus();
                        return false;
                    }
                    //else if (Priceincludes.length > 1000) {
                        //alert("���۰���Ϊ1000��������");
                        //$("#<%=txt_Priceincludes.ClientID%>").focus();
                        //return false;
                    //}
                    $("#AddStandardRouteCarContent").val("");
                    $("#AddStandardRouteDinnerContent").val("");
                    $("#AddStandardRouteGuideContent").val("");
                    $("#AddStandardRouteIncludeOtherContent").val("");
                    $("#AddStandardRouteResideContent").val("");
                    $("#AddStandardRouteSightContent").val("");
                    $("#AddStandardRouteTrafficContent").val("");
                }

                //�ŶӰ���֤
                if ($("#tbc1_02").css("display") != "none") {
                    var isT = false;
                    //                    $("#tbc1_02").find("textarea").each(function() {
                    //                        if ($.trim($(this).val()) != "") {
                    //                            isT = true;
                    //                        }
                    //                    })
                    //                    if (isT == false) {
                    //                        alert("���۰�����������Ŀ����Ϊ��!");
                    //                        $("#AddStandardRouteResideContent").focus();
                    //                        return false;
                    //                    }
                }

                //���۲���
                var PriceExcluding = $("#<%=txt_PriceExcluding.ClientID%>").val(); //���۰���
                //if (PriceExcluding == "") {
                    //alert("���۲�������Ϊ��");
                    //$("#<%=txt_PriceExcluding.ClientID%>").focus();
                    //return false;
                //}
                //else if (PriceExcluding.length > 1000) {
                    //alert("���۲���Ϊ1000��������");
                    //$("#<%=txt_PriceExcluding.ClientID%>").focus();
                    //return false;
                //}
                //������Ŀ
                var Giftitems = $("#<%=txt_Giftitems.ClientID%>").val(); //������Ŀ
                //if (Giftitems.length > 1000) {
                    //alert("������ĿΪ1000��������");
                    //$("#<%=txt_Giftitems.ClientID%>").focus();
                    //return false;
                //}

                //��ͯ����������
                var Childrenandotherarrangements = $("#<%=txt_Childrenandotherarrangements.ClientID%>").val(); //��ͯ����������
                //if (Childrenandotherarrangements.length > 1000) {
                    //alert("������ĿΪ1000��������");
                    //$("#<%=txt_Childrenandotherarrangements.ClientID%>").focus();
                //}

                //���ﰲ��
                var Shoppingarrangements = $("#<%=txt_Shoppingarrangements.ClientID%>").val(); //���ﰲ��
                //if (Shoppingarrangements.length > 1000) {
                    //alert("���ﰲ��Ϊ1000��������");
                    //$("#<%=txt_Shoppingarrangements.ClientID%>").focus();
                    //return false;
                //}

                //�Է���Ŀ
                var Projectattheirownexpense = $("#<%=txt_Projectattheirownexpense.ClientID%>").val(); //�Է���Ŀ
                //if (Projectattheirownexpense.length > 1000) {
                    //alert("�Է���ĿΪ1000��������");
                    //$("#<%=txt_Projectattheirownexpense.ClientID%>").focus();
                    //return false;
                //}
                //��������֪
                var VendorInformation = $("#<%=txt_VendorInformation.ClientID%>").val(); //��������֪
                //if (VendorInformation.length > 1000) {
                    //alert("��������֪Ϊ1000��������");
                    //$("#<%=txt_VendorInformation.ClientID%>").focus();
                    //return false;
                //}
                //��ע
                var Remarks = $("#<%=txt_Remarks.ClientID%>").val(); //��ע
                //if (Remarks.length > 1000) {
                    //alert("��עΪ1000��������");
                    //$("#<%=txt_Remarks.ClientID%>").focus();
                    //return false;
                //}
            });
            FV_onBlur.initValid($("#form1").get(0));
        });

        function FormSubmit() {
            isSubmit = true;
            $("#<%=btn_save.ClientID %>").click();
        }
       
    </script>

    <script type="text/javascript">
        function BackCallFun(data, type) {
            //ѡ��·����
            if (type == "1") {
                $("#<%=hideAreaTypeID.ClientID %>").val(data.id);
                $("#<%=txtAreaType.ClientID %>").val(data.name);
                //OnchangeWord(this.value, 'GetCompanyByLine', null);
                OnchangeWordByGey(data.id, 'listMBrowseCountryControl', null);
                OnchangeWordByGey(data.id, 'listMBrowseCity', null)
            }
            //ѡ��˾
            if (type == "2") {
                $("#<%=hideCompanyID.ClientID %>").val(data.comID);
                $("#<%=txtCompany.ClientID %>").val(data.comName);
                OnchangeWord(data.comID, 'GetContactByBusinessLineId', null);
                OnchangeWordByGey(data.comID, 'BindSaleCite', null);
                OnchangeWordByGey(data.comID, 'BindLeaveCity', null);
                OnchangeWordByGey(data.comID, 'BindBackCity', null);
            }
        }

    </script>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrUpdateScenice.aspx.cs"
    Inherits="UserBackCenter.ScenicManage.AddOrUpdateScenice" EnableEventValidation="false" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="/usercontrol/SingleFileUpload.ascx" TagName="sznb2" TagPrefix="uc2" %>
<%@ Register Src="/usercontrol/szindexNavigationbar.ascx" TagName="sznb" TagPrefix="uc1" %>
<%@ Register Src="../usercontrol/ProvinceAndCityAndCounty.ascx" TagName="ProvinceAndCityAndCounty"
    TagPrefix="uc2" %>
<%@ Register Assembly="ControlLibrary" Namespace="ControlLibrary" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>

    <style type="text/css">
        .unnamed1
        {
            color: Red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#9dc4dc"
        class="margintop5" style="width: 100%;">
        <tr>
            <td width="16%" align="right" bgcolor="#f2f9fe">
                <span class="unnamed1">*</span>�������ƣ�
            </td>
            <td align="left">
                <input type="text" runat="server" id="SceniceName" name="SceniceName" valid="required"
                    errmsg="����д��������" />
                <span id="errMsg_SceniceName" class="unnamed1"></span>
                <input type="hidden" id="SceniceID" value="<%=SceniceId %>" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                Ӣ�����ƣ�
            </td>
            <td align="left">
                <input type="text" runat="server" id="EnName" name="EnName" />
                <span id="errMsg_EnName" class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ��ͼ��Ϣ��
            </td>
            <td align="left">
                (<label id="X" name="lng" runat="server"></label>,<label id="Y" name="lat" runat="server"></label>)
                <asp:HiddenField runat="server" ID="jingdu" />
                <asp:HiddenField runat="server" ID="weidu" />
                <input type="button" name="Setmap" id="Setmap" value="��ͼѡ��" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                �ͷ��绰��
            </td>
            <td align="left">
                <input type="text" runat="server" name="Telephone" id="Telephone" />
                <%--valid="isPhone" errmsg="��������ȷ�ĵ绰����"--%>
                <span id="errMsg_Telephone" class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ��ϵ�ˣ�
            </td>
            <td align="left">
                <asp:DropDownList runat="server" ID="ContactOperator">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ���Ҵ��룺
            </td>
            <td align="left">
                <%--<uc2:ProvinceAndCityAndCounty ID="ProvinceAndCityAndCounty1" runat="server" />--%>
                <span class="unnamed1">*</span>ʡ�ݣ�
                <asp:DropDownList ID="dropProvinceId" runat="server" valid="required" errmsg="��ѡ��ʡ��">
                </asp:DropDownList>
                <span class="unnamed1">*</span>���У�
                <asp:DropDownList ID="dropCityId" runat="server" valid="required" errmsg="��ѡ�����">
                </asp:DropDownList>
                ������
                <asp:DropDownList ID="dropCountyId" runat="server">
                </asp:DropDownList>
                <span id="errMsg_<%=dropProvinceId.ClientID %>" class="unnamed1"></span><span id="errMsg_<%=dropCityId.ClientID %>"
                    class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" style="background-color: #f2f9fe;">
                �ر�����
            </td>
            <td align="left">
                <div id="divLandMarkinit">
                    <%=LankMarks%></div>
                <div id="labLandMark">
                </div>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ���ĵ�ַ��
            </td>
            <td align="left">
                <input type="text" runat="server" name="CnAddress" id="CnAddress" style="width: 400px" /><span
                    id="errMsg_CnAddress" class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                Ӣ�ĵ�ַ��
            </td>
            <td align="left">
                <input type="text" runat="server" name="EnAddress" id="EnAddress" style="width: 400px"
                    errmsg="��������ȷ��Ӣ�ĵ�ַ" />
                <span id="errMsg_EnAddress" class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                <span class="unnamed1">*</span>���⣺
            </td>
            <td align="left">
                <%=ThemeCheckBox%>
                <span id="errMsg_ThemeCheck" class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                �����ȼ���
            </td>
            <td align="left">
                <asp:DropDownList ID="ScenicLevel" runat="server">
                </asp:DropDownList>
                <span id="errMsg_ScenicLevel" style="display: none;" class="unnamed1">��ѡ�����ȼ�</span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                ������ݣ�
            </td>
            <td align="left">
                <input name="SetYear" runat="server" type="text" size="6" id="SetYear" />
                ��� <span id="errMsg_SetYear" style="display: none;" class="unnamed1">��������ȷ�����</span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                �ճ�����ʱ�䣺
            </td>
            <td align="left">
                <textarea runat="server" id="OpenTime" style="width: 460px; height: 110px;"></textarea>
                <span id="errMsg_OpenTime" class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                <span class="unnamed1">*</span>������ϸ���ܣ�
            </td>
            <td align="left">
                <asp:TextBox ID="txtDescription" runat="server" valid="required"
                    errmsg="�����뾰����ϸ����" ></asp:TextBox>
                    <span id="errMsg_txtDescription" class="unnamed1"></span>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                ��ͨ˵����
            </td>
            <td align="left">
                <textarea runat="server" id="Traffic" style="width: 460px; height: 110px;"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                �ܱ���ʩ��
            </td>
            <td align="left">
                <textarea id="Facilities" runat="server" style="width: 460px; height: 110px;"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F2F9FE">
                ��ע��
            </td>
            <td align="left">
                <textarea id="Notes" runat="server" style="width: 460px; height: 110px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="#F2F9FE">
                <asp:Button ID="btnSave" runat="server" class="baocun_an" Text="�� ��" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("GetCityList") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <script type="text/javascript" src="/kindeditor/kindeditor-min.js"></script>

    <script type="text/javascript">


        KE.init({
            id: '<%=txtDescription.ClientID %>', //�༭����Ӧ�ı���id
            width: '700px',
            height: '150px',
            skinsPath: '/kindeditor/skins/',
            pluginsPath: '/kindeditor/plugins/',
            scriptPath: '/kindeditor/skins/',
            resizeMode: 0, //��߲��ɱ�
            items: keSimple //����ģʽ(keMore:�๦��,keSimple:����)
        });
        //��������ѡ����
        function maxSum(id) {
            //alert(id);
            var sum = 0;
            sum = $('input:checkbox[name="ThemeCheck"]:checked').length;
            if (sum > 3) {
                $('input:checkbox[name="ThemeCheck"]:checked').each(function() {
                    //alert($(this).attr("id"));
                    if ($(this).attr("id") != id) {
                        $(this).attr("checked", false);
                        return false;
                    }

                });
                //alert("��������ѡ����");
            }
        }
        
        $(function() {
            //alert(YearEnd);
            $("#Setmap").click(function() {
                var jingdu = $("#jingdu").val();
                var weidu = $("#weidu").val();
                var SceniceName = $("#<%=SceniceName.ClientID %>").val();
                var SceniceId = $("#SceniceID").val();
                var url = "/ScenicManage/SetGoogleMap.aspx?jingdu=" + jingdu + "&weidu=" + weidu + "&SceniceName=" + SceniceName + "&SceniceID=" + SceniceId;
                var title = "���õ�ͼ";
                //alert(url);
                Boxy.iframeDialog({ title: title, iframeUrl: url, height: 800, width: 900, draggable: true });
                return false;
            });
            var time = new Date();
            var YearEnd = time.getFullYear();
            $("#<%=SetYear.ClientID %>").blur(function() {
                //alert(SetyearToInt);
                if ($("#<%=SetYear.ClientID %>").val() != "") {
                    var SetyearToInt = parseInt($("#<%=SetYear.ClientID %>").val());
                    if (!(/^[0-9]+$/.test(SetyearToInt)) || SetyearToInt > YearEnd) {
                        $("#errMsg_SetYear").show();
                        $("#<%=SetYear.ClientID %>").focus();
                    }
                    else {
                        $("#errMsg_SetYear").hide();
                    }
                }
            })

            //��ʼ����Ԫ��ʧȥ����ʱ����Ϊ��������֤�ı�Ԫ��ʧȥ����ʱ����֤����Ч�ԡ�
            FV_onBlur.initValid($("#<%=btnSave.ClientID %>").closest("form").get(0));

            $("#<%=btnSave.ClientID %>").click(function() {
                if ($("#<%=SetYear.ClientID %>").val() != "") {
                    var SetyearToInt = parseInt($("#<%=SetYear.ClientID %>").val());
                    if (!(/^[0-9]+$/.test(SetyearToInt)) || SetyearToInt > YearEnd) {
                        $("#errMsg_SetYear").show();
                        $("#<%=SetYear.ClientID %>").focus();
                        return false;
                    }
                }
                if ($("#<%=SceniceName.ClientID %>").val().length > 28) {
                    $("#errMsg_SceniceName").html("�����������̫�����벻Ҫ����28���ַ�!");
                    $("#<%=SceniceName.ClientID %>").focus();
                    return false;
                }
                if ($("#<%=EnName.ClientID %>").val().length > 100) {
                    $("#errMsg_EnName").html("�����������̫�����벻Ҫ����100���ַ�!");
                    $("#<%=EnName.ClientID %>").focus();
                    return false;
                }
                if ($("#<%=Telephone.ClientID %>").val().length > 50) {
                    $("#errMsg_Telephone").html("�����������̫�����벻Ҫ����50���ַ�!");
                    $("#<%=Telephone.ClientID %>").focus();
                    return false;
                }
                if ($("#<%=CnAddress.ClientID %>").val().length > 60) {
                    $("#errMsg_CnAddress").html("�����������̫�����벻Ҫ����60���ַ�!");
                    $("#<%=CnAddress.ClientID %>").focus();
                    return false;
                }
                if ($("#<%=EnAddress.ClientID %>").val().length > 200) {
                    $("#errMsg_EnAddress").html("�����������̫�����벻Ҫ����200���ַ�!");
                    $("#<%=EnAddress.ClientID %>").focus();
                    return false;
                }
                if ($("#<%=OpenTime.ClientID %>").val().length > 200) {
                    $("#errMsg_OpenTime").html("�����������̫�����벻Ҫ����200���ַ�!");
                    $("#<%=OpenTime.ClientID %>").focus();
                    return false;
                }
                var form = $(this).closest("form").get(0);
                //�����Ŧ����ִ�е���֤����

                return ValiDatorForm.validator(form, "span");
            });

        })
        //�󶨵ر�����
        function BinLankId() {
            var v = $("#dropCityId option:selected").val();
            if (v == "0") {
                $("#divLandMarkinit").html("");
                $("#labLandMark").html("");
            }
            else {
                $.ajax({
                    url: "/ScenicManage/AddOrUpdateScenice.aspx?type=BinLankId&arg=" + v,
                    dataType: "html",
                    cache: false,
                    type: "post",
                    success: function(html) {
                        $("#divLandMarkinit").html("");
                        $("#labLandMark").html(html);
                    }
                });
            }
        }
        function SetProvince(ProvinceId) {
            $("#<%=dropProvinceId.ClientID %>").attr("value", ProvinceId);
        }
        function SetCity(CityId) {
            $("#<%=dropCityId.ClientID %>").attr("value", CityId);
        }
        function SetCounty(CountyId) {
            $("#<%=dropCountyId.ClientID %>").attr("value", CountyId)
        }
        $(function() {
            KE.create('<%=txtDescription.ClientID %>', 0);
        })
    </script>

    </form>
</body>
</html>

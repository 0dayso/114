<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLineArea.aspx.cs" EnableEventValidation="false"
    Inherits="SiteOperationsCenter.PlatformManagement.AddLineArea" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ͨ��ר������ά��-���</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("GetCityList") %>"></script>

    <style type="text/css">
        .btnCss
        {
            background: url(<%=ImageServerUrl%>/images/yunying/tianjiabaocun.gif) no-repeat center center;
            width: 53px;
            padding-top: 4px;
            display: inline-block;
            text-align: center;
            font-weight: normal;
            vertical-align: middle;
        }
        .unnamed1
        {
            color: Red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="99%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#cccccc"
        class="lr_hangbg table_basic">
        <tr>
            <td width="17%" align="right" bgcolor="#f2f9fe">
                <span class="unnamed1">*</span> ר������
            </td>
            <td width="83%" align="left" bgcolor="#FFFFFF">
                <asp:TextBox ID="txtAreaName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                <span class="unnamed1">*</span>ר����Ҫ����
            </td>
            <td align="left" bgcolor="#FFFFFF">              
                <asp:DropDownList  ID="dropCountryOrCity" runat="server" size="5"></asp:DropDownList>
                <asp:DropDownList  ID="ddlCityList" runat="server" size="5"></asp:DropDownList>
                <asp:DropDownList ID="ddlCountyList" runat="server" size="5">
                </asp:DropDownList>
                <input type="button" name="btnmove" id="btnmove" value="���" />
                <p class="AreaIDlist" style="width: 100%;"><%=strAreaCityHtml %>
                </p>
                <asp:HiddenField ID="hidProACityID" runat="server" />
                <asp:HiddenField ID="hidProACityACounID" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                <span class="unnamed1">*</span> ���ࣺ
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:Literal ID="LitrouteType" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#f2f9fe">
                ��������վ��<br />
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=RouteAreaList %>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="#f2f9fe">
                <asp:LinkButton ID="btnsave" runat="server" OnClick="btnsave_Click" CssClass="btnCss">����</asp:LinkButton>
            </td>
        </tr>
    </table>
    </form>

    <script type="text/javascript">
        var ThisPage = {
            IsProvince: true,
            IsCountry: '<%=Request.QueryString["routeType"]%>' == '1' ? true : false,
            CountryId: '', CountryText: '', CityId: '', CityName: '', provinceID: '', provinceName: '',
            InitData: function() {
                this.CountryId = $("#ddlCountyList option:selected").val();
                this.CountryText = $("#ddlCountyList option:selected").text();
                this.CityId = $("#ddlCityList option:selected").val();
                this.CityName = $("#ddlCityList option:selected").text();
                this.provinceID = $("#dropCountryOrCity option:selected").val();
                this.provinceName = $("#dropCountryOrCity option:selected").text();
            },
            AddCityOrCon: function() {
                this.InitData();
                if (ThisPage.CityId == "0") { return; }
                if ($("#ddlCityList option:selected").length == 0) {
                    return;
                }
                //�ж��Ƿ����
                var cityArray = $("#hidProACityID").val().split(',');
                if (cityArray.length > 0) {
                    for (var i = 0; i < cityArray.length; i++) {
                        if (cityArray[i] == ThisPage.CityId) {
                            return;
                        }
                    }
                }
                $("#hidProACityID").val($("#hidProACityID").val() + ThisPage.CityId + ",");
                $(".AreaIDlist").append("<input type=\"checkbox\" value=\"" + ThisPage.provinceID + "," + ThisPage.CityId + "\"  checked=\"checked\" name=\"cbxCity\"/>" + ThisPage.CityName + "&nbsp");
            },
            AddChild: function() {
                this.InitData();
                if (ThisPage.CountryId == "0") { return; }
                if ($("#ddlCountyList option:selected").length == 0) { return; }
                //�ж��Ƿ����
                var cityArray = $("#hidProACityACounID").val().split(',');
                if (cityArray.length > 0) {
                    for (var i = 0; i < cityArray.length; i++) {
                        if (cityArray[i] == ThisPage.CountryId) {
                            return;
                        }
                    }
                }
                $("#hidProACityACounID").val($("#hidProACityACounID").val() + ThisPage.CountryId + ",");
                if (ThisPage.provinceID && ThisPage.CityId) {
                    $(".AreaIDlist").append("<input type=\"checkbox\"  checked=\"checked\" value=\"" + ThisPage.provinceID + "," + ThisPage.CityId + "," + ThisPage.CountryId + "\" name=\"cbxCounty\"/>" + ThisPage.CountryText + "&nbsp");
                }                
            }
        }

        function SelectDomesticOrWord(v) {
            //�� ���� �ܱ� ������
            if (v == "0" || v == "2") {
                BindProvinceList('dropCountryOrCity');
                //�Ƴ�id=0��ʡ��
                $("#dropCountryOrCity option").each(function() {
                    if ($(this).val() == "0") {
                        $(this).remove();
                    }
                });
                //�Ƴ��������������
                if ($("#ddlCityList option").length > 0) {
                    $("#ddlCityList option").each(function() {
                        $(this).remove();
                    });
                }
            }
            else { //����
                //�Ƴ�ʡ�����������
                if ($("#dropCountryOrCity option").length > 0) {
                    $("#dropCountryOrCity option").each(function() {
                        $(this).remove();
                    });
                }
                //�Ƴ��������������
                if ($("#ddlCityList option").length > 0) {
                    $("#ddlCityList option").each(function() {
                        $(this).remove();
                    });
                }
            }
        }

        //ajax ���������·������޼� or ������·�����ʡ��
        function GetCountryOrCityHtml() {
            $.ajax({
                type: "POST",
                url: "/PlatformManagement/AddLineArea.aspx?Method=action",
                cache: false,
                dataType: "json",
                success: function(jsonData) {
                    if (jsonData.CountryList.length > 0) {
                        for (var i = 0; i < jsonData.CountryList.length - 1; i++) {
                            $("#dropCountryOrCity").append("<option value='" + jsonData.CountryList[i].CountryID + "'>" + jsonData.CountryList[i].CountryName + "</option>");
                        }
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("�����쳣!");
                }
            });
        }


        $(document).ready(function() {
            $("#<%=ddlCountyList.ClientID %>").click(function() {
                ThisPage.IsProvince = false;
            });
            if (!ThisPage.IsCountry) {
                //��ʡ��
                SelectDomesticOrWord("0");
                $("#ddlCountyList").attr("display", "block");
                $("#ddlCityList").change(function() {
                    /*arguments[0] �����ؼ�Id  arguments[1] ���пؼ�ID   arguments[2] ����Id  arguments[3] ʡ��Id*/
                    ThisPage.IsProvince = true;
                    SetList('ddlCountyList', 'ddlCityList', $("#ddlCityList option:selected").val(), $("#dropCountryOrCity option:selected").val());
                });
            } else {
                //�󶨹���
                GetCountryOrCityHtml();
                $("#ddlCountyList").css("display", "none");
            }


            $("#dropCountryOrCity").change(function() {
                if (!ThisPage.IsCountry) { //����
                    /*arguments[0] ���пؼ�Id  arguments[1] ʡ��Id   arguments[2] ����Id*/
                    SetList('ddlCityList', $(this).val(), '');
                }
                else { //����
                    $("#ddlCityList").html("");
                    var continentId = $("#dropCountryOrCity option:selected").val();
                    //����ѡ����������Ӧ�Ĺ��� �󶨵�������
                    $.ajax({
                        type: "POST",
                        url: "/PlatformManagement/AddLineArea.aspx?Method=actionC&ID=" + continentId,
                        cache: false,
                        dataType: "json",
                        success: function(jsonData) {
                            if (jsonData.CountryList.length > 0) {
                                for (var i = 0; i < jsonData.CountryList.length - 1; i++) {
                                    var existe = false;
                                    if ($("#ddlCityList")[0].options.length > 0) {
                                        $("#ddlCityList option").each(function() {
                                            if ($(this).val() == jsonData.CountryList[i].CountryID) {
                                                existe = true;
                                            }
                                        });
                                        if (!existe) {
                                            $("#ddlCityList").append("<option value='" + jsonData.CountryList[i].CountryID + "'>" + jsonData.CountryList[i].CountryName + "</option>");
                                        }
                                    }
                                    else {
                                        $("#ddlCityList").append("<option value='" + jsonData.CountryList[i].CountryID + "'>" + jsonData.CountryList[i].CountryName + "</option>");
                                    }
                                }
                            }
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                            alert("�����쳣!");
                        }
                    });
                }
            });


            $("#btnmove").click(function() {
                if (ThisPage.IsProvince) {
                    ThisPage.AddCityOrCon();
                } else {
                    ThisPage.AddChild();
                }
                return false;
            });


            //�ύ��֤
            $("#<%=btnsave.ClientID %>").click(function() {
                //��·��������
                var AreaName = $("#<%=txtAreaName.ClientID %>").val();
                if (AreaName == "" || AreaName == undefined) {
                    alert("����д�������ƣ�");
                    return false;
                }
            });
        });
    </script>

</body>
</html>

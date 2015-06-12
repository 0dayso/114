<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LineCompanyAnalysis.aspx.cs"
    Inherits="SiteOperationsCenter.Statistics.LineCompanyAnalysis" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../usercontrol/ProvinceAndCityAndAreaList.ascx" TagName="ProvinceAndCityAndAreaList"
    TagPrefix="uc1" %>
<%@ Register Src="../usercontrol/StartAndEndDate.ascx" TagName="StartAndEndDate"
    TagPrefix="uc2" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExporPage" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />

    <script language="JavaScript" type="text/javascript">

        function mouseovertr(o) {
            o.style.backgroundColor = "#FFF9E7";
        }
        function mouseouttr(o) {
            o.style.backgroundColor = ""
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;
        margin-bottom: 3px;">
        <tr>
            <td width="24" style="border-bottom: 1px solid #62A8E4">
                &nbsp;
            </td>
            <td width="105" height="24" background="<%=ImageServerUrl %>/images/yunying/weichulidingdan.gif"
                align="center">
                <strong class="shenglanz"><a>�������</a></strong>
            </td>
            <td align="left" style="border-bottom: 1px solid #62A8E4">
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="59%" background="<%=ImageServerUrl %>/images/yunying/chaxunbg.gif" style="background: url(<%=ImageServerUrl %>/images/yunying/chaxunbg.gif) repeat-x top">
                <uc2:StartAndEndDate ID="StartAndEndDate2" runat="server" />
                <img id="imgSituation" src="<%=ImageServerUrl %>/images/yunying/chaxun.gif" width="62"
                    height="21" align="absmiddle" />
                <div id="divLeft">
                </div>
            </td>
            <td width="1%" style="border-right: 1px solid #cccccc;">
                &nbsp;
            </td>
            <td width="40%" align="center" valign="bottom">
                ��Ʒ�ɽ�����ͼ��<a href="javascript:void(0)" onclick="OpenBigFlash()">�鿴��ͼ</a>��
                <div id="divRight">
                    <iframe width="100%" height="170px" id="flashIframe" frameborder="0" scrolling="no">
                    </iframe>
                </div>
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;
        margin-bottom: 3px;">
        <tr>
            <td width="24px" style="border-bottom: 1px solid #62A8E4">
                &nbsp;
            </td>
            <td width="105px" height="24px" style="background: url(<%=ImageServerUrl %>/images/yunying/weichulidingdan.gif) no-repeat"
                align="center">
                <strong class="shenglanz"><a>��Ʒ����</a></strong>
            </td>
            <td align="left" style="border-bottom: 1px solid #62A8E4;">
                <%--��ǰ����3546����·��Ʒ--%>&nbsp;
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td background="<%=ImageServerUrl %>/images/yunying/chaxunbg.gif">
                <table width="100%" border="0" align="left" cellpadding="1" cellspacing="0">
                    <tr>
                        <td>
                            <span>��λ����:<input type="text" id="txtCompanyName" style="width: 100px;" /></span>
                            <span>
                                <uc1:ProvinceAndCityAndAreaList ID="ProvinceAndCityAndAreaList1" runat="server" />
                                <uc2:StartAndEndDate ID="StartAndEndDate1" runat="server" />
                            </span><span></span>
                            <img id="imgSearch" src="<%=ImageServerUrl %>/images/yunying/chaxun.gif" width="62"
                                height="21" align="absmiddle" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="kuang">
        <tr id="table_head" style="background: url(<%=ImageServerUrl %>/images/yunying/hangbg.gif) repeat-x"
            class="white" height="23px">
            <td width="50px" align="center" valign="middle">
                <strong>
                    <input type="checkbox" name="checkbox" value="checkbox" />
                </strong>
            </td>
            <td width="110px" align="center">
                <strong>����������</strong>
            </td>
            <td width="140px" align="center" valign="middle">
                <strong>��·����</strong>
            </td>
            <td width="50px" align="center" valign="middle">
                <strong>��Ʒ��</strong>
            </td>
            <td width="70px" align="center" valign="middle">
                <strong><a class="DataListDownGray" onclick="DataSort(this)" rel="2|3">�ѳɽ�</a></strong>
            </td>
            <td width="70px" align="center" valign="middle">
                <strong><a class="DataListDownGray" onclick="DataSort(this)" rel="4|5">����λ</a></strong>
            </td>
            <td width="80px" align="center" valign="middle">
                <strong><a class="DataListDownGray" onclick="DataSort(this)" rel="6|7">��λ����</a></strong>
            </td>
            <td width="80px" align="center" valign="middle">
                <strong><a class="DataListDownGray" onclick="DataSort(this)" rel="8|9">��Ч����</a></strong>
            </td>
            <td width="80px" align="center" valign="middle">
                <strong><a class="DataListDownGray" onclick="DataSort(this)" rel="10|11">��¼����</a></strong>
            </td>
            <td width="70px" align="center" valign="middle">
                <a class="DataListDownGray" onclick="DataSort(this)" rel="12|13"><strong>���鿴</strong></a>
            </td>
        </tr>
    </table>
    <div id="divDataList" style="text-align: center; padding: 0">
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" align="right">
                <a style="display: none;" href="listclicktrack.htm">����鿴ȫ����¼��¼<img src="<%=ImageServerUrl %>/images/yunying/ico.gif"
                    width="11" height="11" /></a>
            </td>
        </tr>
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script src="../DatePicker/WdatePicker.js" type="text/javascript"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <script type="text/javascript">
        var pageIndex = 1;
        $(function() {
            $("#imgSearch").click(function() {
                pageIndex = 1;
                orderIndex = 0;
                if (oldObj != null) {
                    $(oldObj).removeClass("DataListDownGreen");
                    $(oldObj).removeClass("DataListUpGreen");
                    $(oldObj).addClass("DataListDownGray");
                }
                Analysis(encodeURIComponent($("#txtCompanyName").val()), $("#ProvinceAndCityAndAreaList1_drpCity").val(), $("#drpAreaID").val(), orderIndex, $("#StartAndEndDate1_dpkStart").val(), $("#StartAndEndDate1_dpkEnd").val());
            });

            $("#imgSituation").click(function() {
                Situation($("#StartAndEndDate2_dpkStart").val(), $("#StartAndEndDate2_dpkEnd").val());
                $("#flashIframe").attr("src", "FlashPage.aspx?startTime=" + $("#StartAndEndDate2_dpkStart").val() + "&endTime=" + $("#StartAndEndDate2_dpkEnd").val());
            });
            //��ʼ��
            DataLoad();


            $("#txtCompanyName").keydown(function(event) {
                if (event.keyCode == 13) {
                    $("#imgSearch").click();
                    return false;
                }
            });

        });

        function DataLoad() {
            //ȡ���¶������
            Situation("<%=fristDate%>", "<%=lastDate%>");
            //ȡ���²�Ʒ�����б�
            Analysis("", 0, 0, 0, "", "");
            $("#flashIframe").attr("src", "FlashPage.aspx?startTime=<%=fristDate%>&endTime=<%=lastDate%>");
        }
        //�������
        function Situation(sTime, eTime) {
            var params = { startTime: sTime, endTime: eTime };
            var str = $.param(params);
            LoadingImg.stringPort = '<%=EyouSoft.Common.Domain.ServerComponents %>';
            LoadingImg.ShowLoading("divLeft");
            $.ajax({
                type: "GET",
                url: "AjaxLineOrder.aspx",
                data: str,
                cache: false,
                success: function(result) {
                    $("#divLeft").html(result);
                },
                error: function() {
                    $("#divLeft").html("δ�ܳɹ���ȡ��Ӧ�����");
                }
            });
        }

        //��Ʒ����
        function Analysis(cName, cId, aId, oIndex, sTime, eTime) {
            var params = { companyName: cName, cityId: cId, areaId: aId, orderIndex: oIndex, startTime: sTime, endTime: eTime, Page: pageIndex };

            var str = $.param(params);
            LoadingImg.stringPort = '<%=EyouSoft.Common.Domain.ServerComponents %>';
            LoadingImg.ShowLoading("divDataList");

            $.ajax({
                type: "GET",
                url: "AjaxLineCompanyList.aspx",
                data: str,
                cache: false,
                success: function(result) {
                    $("#divDataList").html(result);
                    $("#div_AjaxLineCompanyList a").click(function() {
                        var str = $(this).attr("href").match(/&[^&]+$/);
                        pageIndex = str.toString().replace("&Page=", "");
                        Analysis(encodeURIComponent($("#txtCompanyName").val()), $("#ProvinceAndCityAndAreaList1_drpCity").val(), $("#drpAreaID").val(), orderIndex, $("#StartAndEndDate1_dpkStart").val(), $("#StartAndEndDate1_dpkEnd").val());
                        return false;
                    });

                    $("#div_AjaxLineCompanyList select").change(function() {
                        pageIndex = $(this).val();
                        Analysis(encodeURIComponent($("#txtCompanyName").val()), $("#ProvinceAndCityAndAreaList1_drpCity").val(), $("#drpAreaID").val(), orderIndex, $("#StartAndEndDate1_dpkStart").val(), $("#StartAndEndDate1_dpkEnd").val());
                        return false;
                    });
                },
                error: function() {
                    $("#divDataList").html("δ�ܳɹ���ȡ��Ӧ�����");
                }

            });
        }

        function OpenDialog(strurl, strtitle, strwidth, strheight, strdate) {
            Boxy.iframeDialog({ title: strtitle, iframeUrl: strurl, width: strwidth, height: strheight, draggable: true, data: strdate,fixed:false });
        }

        //�б�����Ʒ����
        function OpenProPage(url, title, companyId, areaId) {
            var startTime = $("#StartAndEndDate1_dpkStart").val();
            var endTime = $("#StartAndEndDate1_dpkEnd").val();
            var strdate = "companyId=" + companyId;
            if (areaId == "d") {
                areaId = $("#drpAreaID").val();
            }
            if (areaId != "") {
                strdate += "&areaId=" + areaId;
            }
            if (startTime != "") {
                strdate += "&startTime=" + startTime;
            }
            if (endTime != "") {
                strdate += "&endTime=" + endTime;
            }
            OpenDialog(url, title, 780, 400, strdate);
        }
        //���ݷ���
        function OpenProPageTwo(url, title, companyId, areaId) {
            var startTime = $("#StartAndEndDate1_dpkStart").val();
            var endTime = $("#StartAndEndDate1_dpkEnd").val();
            var strdate = "CompanyId=" + companyId;
            if (areaId == "d") {
                areaId = $("#drpAreaID").val();
            }
            if (areaId != "") {
                strdate += "&AreaId=" + areaId;
            }
            if (startTime != "") {
                strdate += "&BeginTime=" + startTime;
            }
            if (endTime != "") {
                strdate += "&EndTime=" + endTime;
            }
            OpenDialog(url, title, 780, 400, strdate);
        }

        function OpenOrderPage(orderType, type, companyId) {
            var startTime = "";
            var endTime = "";
            if (type == "1") {
                startTime = $("#StartAndEndDate2_dpkStart").val();
                endTime = $("#StartAndEndDate2_dpkEnd").val();
            } else {
                startTime = $("#StartAndEndDate1_dpkStart").val();
                endTime = $("#StartAndEndDate1_dpkEnd").val();
            }


            var strdate = "orderIndex=2&type=1&orderType=" + orderType;
            if (startTime == "") {
                strdate += "&startTime=" + '';
            } else {
                strdate += "&startTime=" + startTime;
            }

            if (companyId != "") {
                strdate += "&companyId=" + companyId;
            }


            if (endTime == "") {
                strdate += "&endTime=" + '';
            } else {
                strdate += "&endTime=" + endTime;
            }
            switch (orderType) {
                case "1": OpenDialog("LineOrderDetailsList.aspx", "�ɽ�����", 780, 400, strdate); break;
                case "2": OpenDialog("LineOrderDetailsList.aspx", "��λ���ڶ���", 780, 400, strdate); break;
                case "3": OpenDialog("LineOrderDetailsList.aspx", "��Ч����", 780, 400, strdate); break;
                case "4": OpenDialog("LineOrderDetailsList.aspx", "����λ����", 780, 400, strdate); break;
            }

        }
        
        //Flash �ڵ��ʱ�򿪶�ӳ�ĵ���
        function OpenOrderPageByFlash(orderType, startTime, endTime) {
            var strdate = "orderIndex=2&type=1&orderType=" + orderType + "&startTime=" + startTime + "&endTime=" + endTime;
            switch (orderType) {
                case "1": OpenDialog("LineOrderDetailsList.aspx", "�ɽ�����", 780, 400, strdate); break;
                case "2": OpenDialog("LineOrderDetailsList.aspx", "��λ���ڶ���", 780, 400, strdate); break;
                case "3": OpenDialog("LineOrderDetailsList.aspx", "��Ч����", 780, 400, strdate); break;
                case "4": OpenDialog("LineOrderDetailsList.aspx", "����λ����", 780, 400, strdate); break;
            }
        }

        //���б��������
        var oldObj = null;
        var orderIndex = 0;
        function DataSort(obj) {
            var cssName = $(obj).attr("class");
            pageIndex = 1;

            if (oldObj != null && oldObj != obj) {
                $(oldObj).removeClass("DataListDownGreen");
                $(oldObj).removeClass("DataListUpGreen");
                $(oldObj).addClass("DataListDownGray");
            }
            switch (cssName) {
                case "DataListDownGray": orderIndex = $(obj).attr("rel").split("|")[1];
                    $(obj).removeClass("DataListDownGray");
                    $(obj).addClass("DataListDownGreen"); break;
                case "DataListDownGreen": orderIndex = $(obj).attr("rel").split("|")[0];
                    $(obj).removeClass("DataListDownGreen");
                    $(obj).addClass("DataListUpGreen"); break;
                case "DataListUpGreen": orderIndex = $(obj).attr("rel").split("|")[1];
                    $(obj).removeClass("DataListUpGreen");
                    $(obj).addClass("DataListDownGreen"); break;
            }
            oldObj = obj;
            Analysis(encodeURIComponent($("#txtCompanyName").val()), $("#ProvinceAndCityAndAreaList1_drpCity").val(), $("#drpAreaID").val(), orderIndex, $("#StartAndEndDate1_dpkStart").val(), $("#StartAndEndDate1_dpkEnd").val());
        }
        
        //�򿪴�Falsh
        function OpenBigFlash() {
            window.open("FlashPage.aspx?startTime=" + $("#StartAndEndDate2_dpkStart").val() + "&endTime=" + $("#StartAndEndDate2_dpkEnd").val() + "&type=1");
            return false;
        }   

    </script>

    </form>
</body>
</html>

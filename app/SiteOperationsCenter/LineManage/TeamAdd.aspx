<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamAdd.aspx.cs" Inherits="SiteOperationsCenter.LineManage.TeamAdd" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��·����-�ŶӼƻ�-���</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <script type="text/javascript" src="/DatePicker/WdatePicker.js"></script>

    <style type="text/css">
        #div_DateTime table
        {
            border: solid 1px #addaf8;
            border-collapse: collapse;
            margin-bottom: 5px;
        }
        #div_DateTime td
        {
            border: solid 1px #addaf8;
            border-collapse: collapse;
            height: 30px;
        }
        #div_DateTime th
        {
            background-color: #d9eefc;
            border: solid 1px #addaf8;
            border-collapse: collapse;
            height: 30px;
        }
        .weektitle
        {
            background-color: #f0dc82;
        }
        #divMonthPreNext
        {
            width: 100%;
            height: 30px;
            border: solid 1px #addaf8;
            background-color: #d9eefc;
            margin: 2px 0px;
            line-height: 30px;
        }
        #linkPreMonth
        {
            float: left;
            margin-left: 15px;
        }
        #linkNextMonth
        {
            float: right;
            margin-right: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="HidCalender" Value='2012-3-1|2011-3-2|2011-3-3'>
    </asp:HiddenField>
    <asp:HiddenField runat="server" ID="hidChildLeaveDateList" Value='2012-3-1|2012-3-2|2012-3-3'>
    </asp:HiddenField>
    <asp:HiddenField runat="server" ID="hidChildTourCodeList" Value='2010-1-1|2010-1-2|2010-1-3'>
    </asp:HiddenField>
    <input type="hidden" id="hd_routeid" runat="server" />
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" class="caozuo_bg">
                <a href="#">̩�����¾���</a>
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" class="search_bg">
                <span class="search">&nbsp;</span>�źţ�
                <input name="TeamLineId" id="TeamLineId" runat="server" size="15" />
                �������ڣ�
                <input type="text" id="txtStartDate" name="StartDate" runat="server" class="size55"
                    style="width: 85px;" onfocus="WdatePicker();" />��<input type="text" id="txtEndDate"
                        name="EndDate" runat="server" style="width: 85px;" class="size55" onfocus="WdatePicker();" />
                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/chaxun.gif" width="62" height="21"
                    onclick="TeamplanManage.OnSearch()" />
            </td>
        </tr>
    </table>
    <div id="divTeamLineList" align="center">
    </div>
    <div class="hr_10">
    </div>
    <table id="tab_Save" border="0" cellspacing="0" cellpadding="4" style="width: 99%;
        margin-top: 10px;">
        <tr>
            <td align="left" class="ff0000">
                ���Ŷ��г�������Ϣ�����ż���ʱ�䣬�����ϵ��ʽ�����ɵ����޸ģ�һ���ڳ���ǰ��ר���̵����޸����ڴ�ӡ���ŵ�
            </td>
        </tr>
        <tr>
            <td align="center">
                <table width="88%" border="1" cellpadding="2" cellspacing="0" bordercolor="#9DC4DC">
                    <tr bgcolor="#C8E6F7">
                        <td colspan="2" align="left">
                            <b>�������ͬһ�۸��ŶӼƻ�</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%" align="left" valign="top">
                            <div id="divMonthPreNext">
                            </div>
                            <div id="div_DateTime">
                            </div>
                            <div id="hide_div_DateTime" style="display: none;">
                            </div>
                            <div id="divTourCodeHTML">
                            </div>
                        </td>
                        <td width="50%" valign="top">
                            <table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#addaf8">
                                <tr>
                                    <td width="25%" align="right" nowrap="nowrap">
                                        <span class="ff0000">*</span>�Ŷ�������
                                    </td>
                                    <td width="75%" align="left">
                                        <input type="text" size="10" id="txt_tourNum" runat="server" />
                                        <input type="checkbox" id="chk_isLimit" runat="server" />
                                        �����Ʊ�����
                                    </td>
                                </tr>
                                <tr id="tr_moreThan">
                                    <td align="right">
                                        ��λ��
                                    </td>
                                    <td align="left">
                                        <input type="text" size="10" id="txt_moreThan" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <span class="ff0000">*</span>���ˣ���/�ᣩ
                                    </td>
                                    <td align="left">
                                        <input type="text" size="10" id="txt_retailAdultPrice" runat="server" />
                                        <input type="text" size="10" id="txt_settlementAudltPrice" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        ��ͯ����/�ᣩ
                                    </td>
                                    <td align="left">
                                        <input type="text" size="10" id="txt_retailChildrenPrice" runat="server" />
                                        <input type="text" size="10" id="txt_settlementChildrenPrice" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        �����
                                    </td>
                                    <td align="left">
                                        <input type="text" size="10" id="txt_marketPrice" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        ����˵����
                                    </td>
                                    <td align="left">
                                        <input id="txt_setDec" type="text" size="25" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        �������ʱ�䣺
                                    </td>
                                    <td align="left">
                                        <input id="txt_startDate" type="text" size="25" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        ���ذ��ʱ�䣺
                                    </td>
                                    <td align="left">
                                        <input id="txt_endDate" type="text" size="25" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        ��·���۱�ע��
                                    </td>
                                    <td align="left">
                                        <input id="txt_tourNotes" type="text" size="25" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        ���ȫ��˵����
                                    </td>
                                    <td align="left">
                                        <textarea id="txt_teamLeaderDec" cols="45" rows="4" runat="server"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="button" name="AddSave" id="AddSave" onclick="TeamplanManage.AddSave()"
                                            value="���" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <a href="javascript:void(0);" onclick="Boxy.iframeDialog({ title: '�����źŹ���', iframeUrl: '/LineManage/SetTourNo.aspx?RouteId=<%=RouteId %>&AreaId=<%=AreaId %>&CompanyId=<%=CompanyId %>&rnd='+ Math.random(), height: 500, width: 400, draggable: false });return false;">
                                            �Զ����ź�����ǰ׺</a>
                                    </td>
                                </tr>
                            </table>
                            <p align="left" style="padding: 5px;">
                                ���Ǳ���������ں��ڣ�����ǰ�����޸�<br />
                                ��Ϊ�˷����޸ĳ��ŵ���ÿ���Ŷӵ��г��Ƕ����ģ������Ҫͳһ�޸��г̣��������ѡ��Ҫ�޸ĵ��Ŷӣ�һ���޸��г̡�</p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("groupdate") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>

    <script type="text/javascript">

        var type=null;
        //��ȡѡ��
        function IsSelectAdv() {
            var num = 0;
            var id = "";
            $("input[name='checkboxLine']").each(function() {
                if ($(this).attr("checked")) {
                    num++;
                    id += $(this).val()+"$";
                }
            });
            if (num == 0) {
                return 0;
            }
            else {
                return id;
            }
        }
    
        
    
        //TeamLineIdΪ�ź� 
        var Parms = { RouteId:'<%=RouteId %>',TeamLineId: "", startDate: "",endDate:"", Page: 1 };
        var TeamplanManage = {
            GetTourIds: function() {
                var form = $("#tab_Tlist");
                var tourIds = "";
                form.find(".chk_select:checked").each(function() {
                    tourIds += $(this).val() + "|";
                })
                return tourIds.substring(0, tourIds.length - 1);
            },
            
            //�ŶӼƻ��б�
            GetTeamplanList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                LoadingImg.ShowLoading("divTeamLineList");
                if (LoadingImg.IsLoadAddDataToDiv("divTeamLineList")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "AjaxTeamLineList.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            $("#divTeamLineList").html(html);
                        }
                    });
                }
            },

           ckAllCompany: function(obj) {//ȫѡ
                $("#tbCompanyList").find("input[type='checkbox']").attr("checked", $(obj).attr("checked"));
            },
            
            
            LoadData: function(obj) {//��ҳ
                var Page = exporpage.getgotopage(obj);
                Parms.Page = Page;
                this.GetTeamplanList();
            },
            OnSearch: function() {//��ѯ
                Parms.TeamLineId = $("#<%=TeamLineId.ClientID%>").val();
                Parms.startDate = $("#<%=txtStartDate.ClientID%>").val();
                Parms.endDate = $("#<%=txtEndDate.ClientID%>").val();
                Parms.Page = 1;
                TeamplanManage.GetTeamplanList();
            },//��������
            LoadInitCalendar: function() {
                QGD.initCalendar({
                    containerId: "hide_div_DateTime",
                    currentDate: <%=CurrentDate %>,
                    firstMonthDate: <%=CurrentDate %>,
                    nextMonthDate: <%=NextDate %>,
                    areatype: <%= GetAreaType() %>,
                    listcontainer: "divTourCodeHTML",
                    parentContainerID: "<%=form1 %>"
                });
            },
            ChangeCalender: function() {
                var form = $("#AddSave").closest("form");
                var divFristHtml = form.find("#thisMonthCalendar");
                var divSecondHtml = form.find("#nextMonthCalendar");
                var preMonth = form.find("#linkPreMonth");
                var nextMonth = form.find("#linkNextMonth");
                form.find("#hide_div_DateTime").html("");
                form.find("#div_DateTime").append(divFristHtml);
                form.find("#div_DateTime").append(divSecondHtml);
                form.find("#divMonthPreNext").append(preMonth);
                form.find("#divMonthPreNext").append(nextMonth);
                QGD.updateCalendar(this.option);
            },
            LableToTxt: function(obj) {
                $(obj).hide();
                var inp = $(obj).closest("div").find("input").length > 0 ?
                $(obj).closest("div").find("input")
                :
                $(obj).closest("div").find(".sel_PowderTourStatus");
                inp.show();
                $(obj).closest("div").find(".sel_PowderTourStatus option[text='"+$.trim($(obj).text())+"']").attr("selected", true);
            },
           Delect: function(tourIds) {
                var Key = $("#tab_Tlist");
                if (tourIds.length > 0) {
                    if(confirm("ȷ��ɾ���ƻ���"))
                    {
                        $.ajax(
	                       {
	                           url: '/LineManage/TeamAdd.aspx?Operating=Delect&RouteId=<%=RouteId %>&tourIds=' + tourIds,
	                           dataType: "html",
	                           cache: false,
	                           type: "get",
	                           success: function(result) {
	                               if (result == "1") {
	                                   alert("ɾ���ɹ���")
	                                   TeamplanManage.OnSearch();
	                               }
	                               else
	                               {
	                                    alert("ɾ��ʧ�ܣ�")
	                                   TeamplanManage.OnSearch();
	                               }
	                           },
	                           error: function() {
	                               alert("����ʧ��!");
	                           }
	                       });
                        }
                    }
                else {
                    alert("��ѡ��ƻ�");
                    return false;
                }
            },
            BtnOption: function(statue) {
                var Key = $("#tab_Tlist");
                var tourIds=TeamplanManage.GetTourIds();
                if (tourIds.length > 0) {
                    $.ajax(
	                   {
	                       url: '/LineManage/TeamAdd.aspx?Operating=BtnOption&TourStatus='+statue+'&tourIds=' + tourIds,
	                       dataType: "html",
	                       cache: false,
	                       type: "get",
	                       success: function(result) {
	                           if (result) {
	                               alert("���óɹ���")
	                               TeamplanManage.OnSearch();
	                           }
	                       },
	                       error: function() {
	                           alert("����ʧ��!");
	                       }
	                   });
                }
                else {
                    alert("��ѡ��ƻ�");
                    return false;
                }
            },
            AddSave: function() {
                var Key = $("#form1");
                var data = {
                    RouteId: "", //��·Id
                    leaveDate: "", //����ʱ��
                    txt_tourNum: "", //�Ŷ�����
                    hd_isLimit: "", //�Ƿ���ʾ��������
                    txt_moreThan: "", //��λ
                    txt_retailAdultPrice: "", //�����г���
                    txt_settlementChildrenPrice: "", //���˽����
                    txt_retailChildrenPrice: "", //��ͯ�г���
                    txt_settlementChildrenPrice: "", //��ͯ�����
                    txt_marketPrice: "", //������
                    txt_setDec: "", //����˵��
                    txt_startDate: "", //�������ʱ��
                    txt_endDate: "", //���ذ��ʱ��
                    txt_tourNotes: "", //��ע
                    txt_teamLeaderDec: ""//���ȫ��˵��
                };
                Key.find("#div_DateTime input[value!='on']:enabled:checked").each(function() {
                    data.leaveDate += $(this).attr("value") + ",";
                });
                var msg = "";
                data.leaveDate = data.leaveDate.substring(0, data.leaveDate.length - 1); //��������
                if (data.leaveDate.length <= 0) {
                    msg += "-��ѡ���������-\n";
                }
                data.RouteId = Key.find("#<%=hd_routeid.ClientID %>").val(); //��·id
                data.txt_tourNum = Key.find("#txt_tourNum").val(); //�Ŷ�����
                if (data.txt_tourNum.length <= 0) {
                    msg += "-�������Ŷ�����-\n";
                }
                data.hd_isLimit = $("#<%=chk_isLimit.ClientID %>").attr("checked") ? 0 : 1; //�Ƿ���ʾ��������
                data.txt_moreThan = Key.find("#txt_moreThan").val(); //��λ
                data.txt_retailAdultPrice = Key.find("#txt_retailAdultPrice").val(); //�����г���
                data.txt_settlementAudltPrice = Key.find("#txt_settlementAudltPrice").val(); //���˽����
                data.txt_retailChildrenPrice = Key.find("#txt_retailChildrenPrice").val(); //��ͯ�г���
                data.txt_settlementChildrenPrice = Key.find("#txt_settlementChildrenPrice").val(); //��ͯ�����
                if (data.txt_retailAdultPrice.length <= 0) {
                    msg += "-����������г���-\n";
                }
                if (data.txt_settlementAudltPrice.length <= 0) {
                    msg += "-��������˽����-\n";
                }                
//                if (data.txt_retailChildrenPrice.length <= 0) {
//                    msg += "-�������ͯ�г���-\n";
//                }                
//                if (data.txt_settlementChildrenPrice.length <= 0) {
//                    msg += "-�������ͯ�����-\n";
//                }
                data.txt_marketPrice = Key.find("#txt_marketPrice").val(); //������
                data.txt_setDec = Key.find("#txt_setDec").val(); //����˵��
                data.txt_startDate = Key.find("#txt_startDate").val(); //�������ʱ��
                data.txt_endDate = Key.find("#txt_endDate").val(); //���ذ��ʱ��
                data.txt_tourNotes = Key.find("#txt_tourNotes").val(); //��ע
                data.txt_teamLeaderDec = Key.find("#txt_teamLeaderDec").val(); //���ȫ��˵��
                if(msg.length<=0)
                {
                    $.ajax(
                       {
                           url: 'TeamAdd.aspx?Operating=AddSave&CompanyId=<%=CompanyId %>&RouteId=<%=RouteId %>',
                           data: data,
                           dataType: "html",
                           cache: false,
                           type: "post",
                           success: function(result) {
                               if (result) {
                                   alert("��ӳɹ���")
                                   TeamplanManage.OnSearch();
                               }
                           },
                           error: function() {
                               alert("����ʧ��!");
                           }
	              });
               }
               else
               {
                    alert(msg);
               }
            },
            
            AddSave1:function(){
                $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "TeamAdd.aspx?Operating=AddSave&RouteId=<%=RouteId %>",
                        cache: false,
                        success: function(html) {
                            if(html=="true")
                            {
                                alert("��ӳɹ�");
                            }
                            else
                                alert("���ʧ��");
                        }
               })               
                
            }
     }
     
     

     

        $(function() {
            TeamplanManage.LoadInitCalendar();
            setTimeout(function() {
                TeamplanManage.ChangeCalender();
                $("#div_DateTime :checkbox").click(function(i){
                    var datatimenow=new Date();  
                    var resultbool=false;
                    var datatimenow2=datatimenow.getFullYear().toString()+"-"+(datatimenow.getMonth()+1)+"-"+datatimenow.getDate().toString();
                    if(datatimenow2==$(this).val())
                    {
                        alert("���ܷ�������ƻ�");
                        $(this).attr("checked","");
                        $(this).attr("disabled","disabled");
                        return false;

                    }
                    //��֤�Ƿ��Ѿ��е���ļƻ�
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "TeamAdd.aspx?datavalue="+$(this).val()+"&Operating=CheckExcitDate&RouteId=<%=RouteId %>",
                        cache: false,
                        async:false,
                        success: function(html) {
                            if(html=="True")
                            {
                                resultbool=true;
                                alert("�����Ѿ����˵ļƻ�");
                            }
                        },
                        error: function() {
                               alert("�����쳣������ϵ����Ա!");
                        }
                    })  
                    if(resultbool)
                    {
                        $(this).attr("checked","");
                        $(this).attr("disabled","disabled");
                        return false;
                    }
                })
            }, 500);           
            
            var FormObj = $("#<%=form1.ClientID%>");
            
            
            


            //�س���ѯ
            FormObj.keydown(function(event) {
                if (event.keyCode == 13) {
                    TeamplanManage.OnSearch();
                    return false;
                }
            });
            TeamplanManage.OnSearch();
            
            $("#<%=chk_isLimit.ClientID %>").click(function(){
                 if($(this).attr("checked"))
                 {
                    $("#tr_moreThan").css("display","none");
                 }else
                 {
                    $("#tr_moreThan").css("display","");
                 }
            })
        });
    
    </script>

    </form>
</body>
</html>

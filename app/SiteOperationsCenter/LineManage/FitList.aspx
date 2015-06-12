<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FitList.aspx.cs" Inherits="SiteOperationsCenter.LineManage.FitList" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����б�</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="/DatePicker/WdatePicker.js"></script>

    <%@ import namespace="EyouSoft.Common" %>
</head>
<body>
    <form id="form1" runat="server">
    <!----����״̬---->
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" class="zhtai_bg">
                <span class="guestmenu">����״̬</span>
                <%=BindOrderStatus()%>
            </td>
        </tr>
        <tr>
            <td align="left" class="zhtai_bg">
                <span class="guestmenu">֧��״̬</span>
                <%=BindPaymentStatus()%>
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 1px;">
        <tr>
            <td align="left" class="zhtai_bg">
                <%--class="font_f00"--%>
                ����<a href="#" onclick="FitManage.sortBytime(this,1)">������ʱ������</a> <a href="#" onclick="FitManage.sortBytime(this,2)">
                    ���µ�ʱ������</a> <a href="#" onclick="FitManage.sortBytime(this,3)">������״̬����</a>
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="search_bg">
                �ؼ���
                <input name="txt_Search" runat="server" style="color: #999; width: 265px;" id="txt_Search"
                    type="text" value="�����š���·����ר���̡������硢�ο�" size="30" onfocus="$(this).css('color', 'black');if(this.value == '�����š���·����ר���̡������硢�ο�') {this.value = '';}"
                    onblur="if (this.value == '') {$(this).css('color', '#999');this.value = '�����š���·����ר���̡������硢�ο�';}" />
                ����ʱ��
                <input type="text" id="txtStartDate" name="StartDate" class="size55" style="width: 85px;"
                    onfocus="WdatePicker();" />��<input type="text" id="txtEndDate" name="EndDate" style="width: 85px;"
                        class="size55" onfocus="WdatePicker();" />
            </td>
        </tr>
        <tr>
            <td class="search_bg">
                ��·����
                <asp:DropDownList ID="DropSearchLineType" runat="server" onchange="OnchangeWord(this.value,'GetLineByType')">
                </asp:DropDownList>
                ר�ߣ�
                <asp:DropDownList ID="DropSearchLineId" runat="server" onchange="OnchangeWord(this.value,'GetCompanyByLine')">
                    <asp:ListItem Value="0">ר��</asp:ListItem>
                </asp:DropDownList>
                ר���̣�
                <asp:DropDownList ID="dropBusinessLineId" runat="server">
                    <asp:ListItem Value="0">ר����</asp:ListItem>
                </asp:DropDownList>
                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/chaxun.gif" width="62" height="21"
                    onclick="FitManage.OnSearch()" />
            </td>
        </tr>
    </table>
    <!--��ҳ-->
    <div id="divFitList" align="center">
    </div>
    <table width="99%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" align="right">
            </td>
        </tr>
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>

    <script type="text/javascript">
    
     var type=null;
        //��ȡѡ��
        function IsSelectAdv() {
            var num = 0;
            var id = "";
            $("input[name='checkboxFit']").each(function() {
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
    
        //Line1Ϊר�ߣ����ڣ����⣬�ܱߣ� line2Ϊ����ѡר������ BusinessLineר���� DepartureΪ������
        //OrderStatusΪ����״̬ PaymentStatusΪ֧��״̬ ʱ������0ΪĬ��ֵ��1Ϊ������ʱ������ 2Ϊ���µ�ʱ������ 3Ϊ������״̬����
        var Parms = { SearchKeyword: "", Line1: -1,Line2:0,BusinessLine: 0,tourid:"",StartDate:"",EndDate:"",OrderStatus:-1,PaymentStatus:0,Sort:1,Page: 1 };
        var FitManage = {//�����б�
            GetFitList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                LoadingImg.ShowLoading("divFitList");
                if (LoadingImg.IsLoadAddDataToDiv("divFitList")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "AjaxFitList.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            
                            $("#divFitList").html(html);
                        }
                    });
                }
            },
            
            
            //���ݶ���״̬��ѯ
            OrderStatus:function(obj,v){
                $(obj).closest("td").find("a").each(function(){
                    if($(this).css("color")=="red")
                    {
                        $(this).css("color","");
                    }                
                })
                $(obj).css("color","red");
                Parms.OrderStatus=v;
                FitManage.OnSearch();
            },
            
            
            //����֧��״̬��ѯ
            //1δ֧�� 2��֧�� 3֧������ 4֧��ȫ�� 5���� 6�˿�
            PaymentStatus:function(obj,v){
                $(obj).closest("td").find("a").each(function(){
                    if($(this).css("color")=="red")
                    {
                        $(this).css("color","");
                    }                
                })
                $(obj).css("color","red");
                Parms.PaymentStatus=v;
                FitManage.OnSearch();
            },
            
            //����ʱ������
            //ʱ������0ΪĬ��ֵ��1Ϊ������ʱ������ 2Ϊ���µ�ʱ������ 3Ϊ������״̬����
           sortBytime:function(obj,v){
                $(obj).closest("td").find("a").each(function(){
                    if($(this).css("color")=="red")
                    {
                        $(this).css("color","");
                    }                
                })
                $(obj).css("color","red");
                Parms.Sort=v;
                FitManage.OnSearch();
           },
           
           

           ckAllCompany: function(obj) {//ȫѡ
                $("#tbCompanyList").find("input[type='checkbox']").attr("checked", $(obj).attr("checked"));
            },
            
            
            LoadData: function(obj) {//��ҳ
                var Page = exporpage.getgotopage(obj);
                Parms.Page = Page;
                this.GetFitList();
            },
            OnSearch: function() {//��ѯ
                if($("#<%=txt_Search.ClientID%>").val()!="�����š���·����ר���̡������硢�ο�")
                    Parms.SearchKeyword = $("#<%=txt_Search.ClientID%>").val();
                Parms.Line1 = $("#<%=DropSearchLineType.ClientID%>").val();
                if('<%=Areaid%>'!="")
                {
                    Parms.Line2='<%=Areaid%>';
                    $("#DropSearchLineType").val('<%=AreaType%>');
                }
                else 
                    Parms.Line2=$("#<%=DropSearchLineId.ClientID%>").val();                
                Parms.BusinessLine=$("#<%=dropBusinessLineId.ClientID%>").val();
                if('<%=tourid %>'!="")
                        Parms.tourid='<%=tourid %>';
                Parms.StartDate = $.trim($("#txtStartDate").val());
                Parms.EndDate = $.trim($("#txtEndDate").val());
                Parms.Page = 1;
                FitManage.GetFitList();
            }
     }
        $(document).ready(function() {
            var FormObj = $("#<%=form1.ClientID%>");

            //�س���ѯ
            FormObj.keydown(function(event) {
                if (event.keyCode == 13) {
                    FitManage.OnSearch();
                    return false;
                }
            });
            FitManage.OnSearch();
        });        
    
    
    </script>

    <script type="text/javascript">
    
     //ר�����ͣ����ڹ����ܱߵȵȣ�
        function OnchangeWord(v,t)
        {
             $.ajax({
                 url: "FitList.aspx?action="+t+"&argument="+v,
                 cache: false,
                 type:"POST",
                 dataType:"json",
                 success: function(result) {
                     if(t=="GetLineByType"){
                         $("#<%=DropSearchLineId.ClientID %>").html("");
                         $("#<%=DropSearchLineId.ClientID %>").append("<option value=\"0\">ר��</option>"); 
                         var list = result.tolist;
                         for(var i=0;i<list.length;i++)
                         {
                             $("#<%=DropSearchLineId.ClientID %>").append("<option value=\""+list[i].AreaId+"\">"+list[i].AreaName+"</option>"); 
                         }
                     }
                     else if(t=="GetCompanyByLine")
                     {
                         $("#<%=dropBusinessLineId.ClientID %>").html("");
                         $("#<%=dropBusinessLineId.ClientID %>").append("<option value=\"0\">ר����</option>"); 
                         var listBusinessLineId = result.tolist;
                         for(var j=0;j<listBusinessLineId.length;j++)
                         {
                             $("#<%=dropBusinessLineId.ClientID %>").append("<option value=\""+listBusinessLineId[j].ID+"\">"+listBusinessLineId[j].CompanyName+"</option>"); 
                         }
                     }
                 },
                 error: function() {
                     alert("����ʧ��!");
                 }
             });
        }
        
    </script>

    </form>
</body>
</html>

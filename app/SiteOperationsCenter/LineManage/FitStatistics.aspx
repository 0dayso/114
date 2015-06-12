<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FitStatistics.aspx.cs"
    Inherits="SiteOperationsCenter.LineManage.FitStatistics" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ޱ����ĵ�</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="/DatePicker/WdatePicker.js"></script>

    <script language="JavaScript">
 
  function mouseovertr(o) {
	  o.style.backgroundColor="#FFF9E7";
      //o.style.cursor="hand";
  }
  function mouseouttr(o) {
	  o.style.backgroundColor=""
  }

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" class="search_bg">
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
            </td>
        </tr>
        <tr>
            <td align="left" class="search_bg">
                ����ʱ�䣺
                <input type="text" id="txtStartDate" name="StartDate" class="size55" style="width: 85px;"
                    onfocus="WdatePicker();" />��<input type="text" id="txtEndDate" name="EndDate" style="width: 85px;"
                        class="size55" onfocus="WdatePicker();" />
                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/chaxun.gif" width="62" height="21" onclick="FitStatistics.OnSearch()" />
            </td>
        </tr>
    </table>
    <div id="divFitStatistics" align="center">
    </div>
    <table width="98%" border="0" align="center">
        <tr>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>

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
        var Parms = {Line1: -1,Line2:0,BusinessLine: 0,StartDate:"",EndDate:"",Page: 1 };
        var FitStatistics = {//�б�
            GetFitStatisticsList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                LoadingImg.ShowLoading("divFitStatistics");
                if (LoadingImg.IsLoadAddDataToDiv("divFitStatistics")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "AjaxFitStatistics.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            $("#divFitStatistics").html(html);
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
                this.GetFitStatisticsList();
            },
            OnSearch: function() {//��ѯ
                Parms.Line1 = $("#<%=DropSearchLineType.ClientID%>").val();
                Parms.Line2=$("#<%=DropSearchLineId.ClientID%>").val();
                Parms.BusinessLine=$("#<%=dropBusinessLineId.ClientID%>").val();
                Parms.StartDate = $.trim($("#txtStartDate").val());
                Parms.EndDate = $.trim($("#txtEndDate").val());
                Parms.Page = 1;
                FitStatistics.GetFitStatisticsList();
            }
     }
        $(document).ready(function() {
            var FormObj = $("#<%=form1.ClientID%>");

            //�س���ѯFitStatistics.OnSearch();   
            FormObj.keydown(function(event) {
                if (event.keyCode == 13) {
                    FitStatistics.OnSearch();
                    return false;
                }
            });
            FitStatistics.OnSearch();
        });        
    
    
    </script>

   

    <script type="text/javascript">
    
     //ר�����ͣ����ڹ����ܱߵȵȣ�
        function OnchangeWord(v,t)
        {
             $.ajax({
                 url: "FitStatistics.aspx?action="+t+"&argument="+v,
                 cache: false,
                 type:"POST",
                 dataType:"json",
                 success: function(result) {
                     if(t=="GetLineByType"){
                         $("#<%=DropSearchLineId.ClientID %>").html("");
                         $("#<%=DropSearchLineId.ClientID %>").append("<option value=\"0\">ר��</option>"); 
                         
                         var lista = result.tolist;               
                         for(var i=0;i<lista.length;i++)
                         {
                             $("#<%=DropSearchLineId.ClientID %>").append("<option value=\""+lista[i].AreaId+"\">"+lista[i].AreaName+"</option>"); 
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

</body>
</html>

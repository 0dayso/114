<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LineList.aspx.cs" Inherits="SiteOperationsCenter.LineManage.LineList" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../usercontrol/ProvinceAndCityList.ascx" TagName="ProvinceAndCityList" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��·����</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />

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

    <script type="text/javascript">
    
    function UrlAddLine()
    {
        var dropline=$("#<%=dropLine.ClientID %>").val();
        var dropline1=$("#<%=dropLine1.ClientID %>").val();
        window.location="AddLine.aspx?dropLineType="+dropline+"&dropLine="+dropline1+"";
    }
    
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="search_bg">
                ��·����
                <asp:DropDownList ID="dropLine" runat="server" onchange="OnchangeWordAdd(this.value,'GetLineByType')">
                </asp:DropDownList>
                <asp:DropDownList ID="dropLine1" runat="server">
                </asp:DropDownList>
                <a href="javascript:void(0)" onclick="UrlAddLine();return false;" class="add_btn">��
                    ��</a> &nbsp;
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="search_bg">
                �ؼ���
                <input name="txt_Search" id="txt_Search" runat="server" style="color: #999; width: 130px"
                    type="text" value="��·���⡢��·��ɫ" size="16" onfocus="$(this).css('color', 'black');if(this.value == '��·���⡢��·��ɫ') {this.value = '';}"
                    onblur="if (this.value == '') {$(this).css('color', '#999');this.value = '��·���⡢��·��ɫ';}" />
                ������
                <input name="txt_Departure" id="txt_Departure" type="text" size="12" runat="server" />
                �Ƽ�
                <asp:DropDownList ID="dropRecommendType" runat="server">
                </asp:DropDownList>
                 <uc1:ProvinceAndCityList ID="ProvinceAndCity1" IsShowRequired="false"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="search_bg">
                ��·����
                <asp:DropDownList ID="DropSearchLine" runat="server" onchange="OnchangeWord(this.value,'GetLineByType')">
                </asp:DropDownList>
                ר��
                <asp:DropDownList ID="DropSearchLineId" runat="server" onchange="OnchangeWord(this.value,'GetCompanyByLine')">
                    <asp:ListItem Value="0">ר��</asp:ListItem>
                </asp:DropDownList>
                ר���̣�
                <asp:DropDownList ID="dropBusinessLineId" runat="server">
                    <asp:ListItem Value="0">ר����</asp:ListItem>
                </asp:DropDownList>
                <img onclick="LineManage.OnSearch()" src="<%=ImageManage.GetImagerServerUrl(1)%>/images/chaxun.gif"
                    width="62" height="21" />
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr style="background: url(<%=ImageManage.GetImagerServerUrl(1)%>/images/lmnavm.gif);
            height: 32px;">
            <td width="1%" align="left">
                &nbsp;
            </td>
            <td width="99%" align="left">
                <span class="guestmenu">��·״̬</span> <a href="javascript:void(0);" class="shangjia"
                    onclick="LineManage.setRouteStatus(1);return false;">���ϼ�</a> <a href="javascript:void(0);"
                        class="xiajia" onclick="LineManage.setRouteStatus(2);return false;">���¼�</a>
                <span class="guestmenu guestmenu02">�� ��</span>
                <%=GetTourMarkerNote()%>
            </td>
        </tr>
    </table>
    <div id="divLineList" align="center">
    </div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
            </td>
        </tr>
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

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
    
        
    
        //Line1Ϊר�ߣ����ڣ����⣬�ܱߣ� line2Ϊ����ѡר������ BusinessLineר���� DepartureΪ������
        var Parms = { SearchKeyword: "",RecommendType:"", Line1: -1,Line2:0,BusinessLine: "",Departure:"",ProvinceId:0,CityId:0, Page: 1 };
        var LineManage = {//�����б�
            GetLineList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                LoadingImg.ShowLoading("divLineList");
                if (LoadingImg.IsLoadAddDataToDiv("divLineList")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "AjaxLineList.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            $("#divLineList").html(html);
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
                this.GetLineList();
            },
            OnSearch: function() {//��ѯ
                if($("#<%=txt_Search.ClientID%>").val()=="��·���⡢��·��ɫ")
                    Parms.SearchKeyword="";
                else
                    Parms.SearchKeyword = $("#<%=txt_Search.ClientID%>").val();
                Parms.RecommendType=$("#<%=dropRecommendType.ClientID%>").val();
                Parms.Line1 = $("#<%=DropSearchLine.ClientID%>").val();
                Parms.Line2=$("#<%=DropSearchLineId.ClientID%>").val();
                Parms.BusinessLine=$("#<%=dropBusinessLineId.ClientID%>").val();
                Parms.Departure = $.trim($("#txt_Departure").val());
                var ProvinceId=$("#ProvinceAndCity1_ddl_ProvinceList").val();
                var CityId=$("#ProvinceAndCity1_ddl_CityList").val();
                if(ProvinceId!="")
                    Parms.ProvinceId = ProvinceId;
                if(CityId!="")
                    Parms.CityId = CityId;
                Parms.Page = 1;
                LineManage.GetLineList();
            },
        
        

           setTourMarkerNote: function(typeLine){//��·��������
                if('<%=IsGrantUpdate %>'!="True"){
                  alert("�Բ�����Ŀǰ���ʺ�û�и�Ȩ�ޣ�");
                  return;
                }
                var selecedchk=IsSelectAdv();
                var thispage=$("#hidAjaxNotStartingTeamsPage").val();
                if(selecedchk==0)
                {
                     alert("��ѡ��һ��");
                     return false;
                }
                else{
                    $.ajax({
                          cache:false,
                          url:"LineList.aspx?action=setTourMarkerNote&rd="+Math.random(),
                          data:{TemplateTourID:selecedchk,TourMarkerNote:typeLine,Page:thispage},
                          success:function(html){
                              if(html=="1"){
                                  Parms.Page=thispage;
                                  LineManage.OnSearch();
                                  alert("�����ɹ���")
                              }else{
                                  alert("����ʧ�ܣ�")
                              }
                          }
                      })
                    return false;
                }
            },
            
            
            DeleteLine:function(id){
                var thispage=$("#hidAjaxNotStartingTeamsPage").val();
                if (!confirm("��ȷ��Ҫɾ������������")) {
                        return false;
                }
                $.ajax({
                          cache:false,
                          url:"LineList.aspx?action=DeleteLine&lineId="+id+"&rd="+Math.random(),
                          success:function(html){
                              if(html=="1"){
                                  Parms.Page=thispage;
                                  LineManage.OnSearch();
                                  alert("ɾ���ɹ���")
                              }else{
                                  alert("ɾ��ʧ�ܣ�")
                              }
                          }
                      })
                    return false;
            
            },
            
            
            setRouteStatus:function(status)
            {
                var selecedchk=IsSelectAdv();
                if(selecedchk==0)
                {
                     alert("��ѡ��һ��");
                     return false;
                }
                else
                {
                     if('<%=IsGrantUpdate %>'!="True"){
                         alert("�Բ�����Ŀǰ���ʺ�û���޸�Ȩ�ޣ�");
                         return;
                     }
                     $.ajax({
                            url: "LineList.aspx?action=setRouteStatus&RouteStatus="+status+"&arg=" + selecedchk,
                            cache: false,
                            type:"POST",
                            dataType:"json",
                            success: function(msg) {
                                    if(msg[0].isSuccess)
                                    {
                                        LineManage.OnSearch();
                                        alert(msg[0].ErrorMessage);
                                    }
                                    else{
                                        alert(msg[0].ErrorMessage);
                                    }
                            },
                            error: function() {
                                alert("����ʧ��");
                            }
                        });
                     return false;
                 }
            
            }
     }
        $(document).ready(function() {
            var FormObj = $("#<%=form1.ClientID%>");

            //�س���ѯ
            FormObj.keydown(function(event) {
                if (event.keyCode == 13) {
                    LineManage.OnSearch();
                    return false;
                }
            });
            LineManage.OnSearch();            
        });        
    
    </script>

    <script type="text/javascript">
    
     //ר�����ͣ����ڹ����ܱߵȵȣ�
        function OnchangeWord(v,t) {
             $.ajax({
                 url: "LineList.aspx?action="+t+"&argument="+v,
                 cache: false,
                 type:"GET",
                 dataType:"json",
                 success: function(result) {
                     if(t=="GetLineByType"){//����ר�����ͻ�ȡר��
                         $("#<%=DropSearchLineId.ClientID %>").html("");
                         $("#<%=DropSearchLineId.ClientID %>").append("<option value=\"0\">-��ѡ��-</option>"); 
                         //var list = eval(result.tolist);
                         var list =result.tolist;             
                         for(var i=0;i<list.length;i++)
                         {
                             $("#<%=DropSearchLineId.ClientID %>").append("<option value=\""+list[i].AreaId+"\">"+list[i].AreaName+"</option>"); 
                         }
                     }
                     else if(t=="GetCompanyByLine")//����ר�߻�ȡר����
                     {
                         $("#<%=dropBusinessLineId.ClientID %>").html("");
                         $("#<%=dropBusinessLineId.ClientID %>").append("<option value=\"0\">-��ѡ��-</option>"); 
                         var listCompany = result.tolist;
                         //var listCompany = eval(result);
                         for(var j=0;j<listCompany.length;j++)
                         {
                             $("#<%=dropBusinessLineId.ClientID %>").append("<option value=\""+listCompany[j].ID+"\">"+listCompany[j].CompanyName+"</option>"); 
                         }
                     }                    
                 },
                 error: function() {
                     alert("����ʧ��!");
                 }    
             });
        }
             //ר�����ͣ����ڹ����ܱߵȵȣ�
        function OnchangeWordAdd(v,t)
        {
             //��ѡ��
             if(v=="-1")
             {
                $("#<%=dropLine1.ClientID %>").html("");
                $("#<%=dropLine1.ClientID %>").append("<option value=\"0\">��ѡ��</option>"); 
                return false;
             }
             $.ajax({
                 url: "LineList.aspx?action="+t+"&argument="+v,
                 cache: false,
                 type:"GET",
                 dataType:"json",
                 success: function(result) {
                     if(t=="GetLineByType"){
                         $("#<%=dropLine1.ClientID %>").html("");
                         $("#<%=dropLine1.ClientID %>").append("<option value=\"0\">��ѡ��</option>"); 
                         //var list = eval(result);
                         for(var i=0;i<result.tolist.length;i++)
                         {
                             $("#<%=dropLine1.ClientID %>").append("<option value=\""+result.tolist[i].AreaId+"\">"+result.tolist[i].AreaName+"</option>"); 
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

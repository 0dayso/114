<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeamorderManage.aspx.cs"
    Inherits="SiteOperationsCenter.LineManage.TeamorderManage" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���Ŷ�������</title>
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

    <script type="text/javascript">

//���������//
function wsug(e, str){ 
	var oThis = arguments.callee;
	if(!str) {
		oThis.sug.style.visibility = 'hidden';
		document.onmousemove = null;
		return;
	}		
	if(!oThis.sug){
		var div = document.createElement('div'), css = 'top:0; left:-30px;text-align:left;color:#2C709F;position:absolute; z-index:100; visibility:hidden';
			div.style.cssText = css;
			div.setAttribute('style',css);
		var sug = document.createElement('div'), css= 'font:normal 12px/16px "����"; white-space:nowrap; color:#666; padding:3px; position:absolute; left:-30px; top:0; z-index:10; background:#f9fdfd; border:1px solid #629BC7;text-align:left;color:#2C709F;';
			sug.style.cssText = css;
			sug.setAttribute('style',css);
		var dr = document.createElement('div'), css = 'position:absolute; top:3px; left:-27px; background:#333; filter:alpha(opacity=30); opacity:0.3; z-index:9';
			dr.style.cssText = css;
			dr.setAttribute('style',css);
		var ifr = document.createElement('iframe'), css='position:absolute; left:0; top:-10; z-index:8; filter:alpha(opacity=0); opacity:0';
			ifr.style.cssText = css;
			ifr.setAttribute('style',css);
		div.appendChild(ifr);
		div.appendChild(dr);
		div.appendChild(sug);
		div.sug = sug;
		document.body.appendChild(div);
		oThis.sug = div;
		oThis.dr = dr;
		oThis.ifr = ifr;
		div = dr = ifr = sug = null;
	}
	var e = e || window.event, obj = oThis.sug, dr = oThis.dr, ifr = oThis.ifr;
	obj.sug.innerHTML = str;
	
	var w = obj.sug.offsetWidth, h = obj.sug.offsetHeight, dw = document.documentElement.clientWidth||document.body.clientWidth; dh = document.documentElement.clientHeight || document.body.clientHeight;
	var st = document.documentElement.scrollTop || document.body.scrollTop, sl = document.documentElement.scrollLeft || document.body.scrollLeft;
	var left = e.clientX +sl +17 + w < dw + sl && e.clientX + sl + 15 || e.clientX +sl-8 - w, top = e.clientY + st + 17;
	obj.style.left = left+ 10 + 'px';
	obj.style.top = top + 10 + 'px';
	dr.style.width = w + 'px';
	dr.style.height = h + 'px';
	ifr.style.width = w + 3 + 'px';
	ifr.style.height = h + 3 + 'px';
	obj.style.visibility = 'visible';
	document.onmousemove = function(e){
		var e = e || window.event, st = document.documentElement.scrollTop || document.body.scrollTop, sl = document.documentElement.scrollLeft || document.body.scrollLeft;
		var left = e.clientX +sl +17 + w < dw + sl && e.clientX + sl + 15 || e.clientX +sl-8 - w, top = e.clientY + st +17 + h < dh + st && e.clientY + st + 17 || e.clientY + st - 5 - h;
		obj.style.left = left + 'px';
		obj.style.top = top + 'px';
	}
}
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" class="zhtai_bg">
                <span class="guestmenu">����״̬</span>
                <%=str %>
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td style="background: #dce7f6; line-height: 26px; padding-left: 15px; padding-top: 3px;
                padding-bottom: 3px;">
                �ؼ���
                <input name="txt_Search" id="txt_Search" runat="server" style="color: #999" type="text"
                    value="��·���ơ������硢ר����" size="30" onfocus="$(this).css('color', 'black');if(this.value == '��·���ơ������硢ר����') {this.value = '';}"
                    onblur="if (this.value == '') {$(this).css('color', '#999');this.value = '��·���ơ������硢ר����';}" />
                ��������
                <input type="text" id="txtStartDate" name="StartDate" class="size55" style="width: 85px;"
                    onfocus="WdatePicker();" />��<input type="text" id="txtEndDate" name="EndDate" style="width: 85px;"
                        class="size55" onfocus="WdatePicker();" />
                ��·����
                <asp:DropDownList ID="DropSearchLineType" runat="server">
                    <%--onchange="OnchangeWord(this.value,'GetLineByType')"--%>
                </asp:DropDownList>
                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/chaxun.gif" width="62" height="21"
                    onclick="TeamorderManage.OnSearch()" />
            </td>
        </tr>
        <%--<tr>
            <td style="background: #dce7f6; line-height: 26px; padding-left: 15px; padding-top: 3px;
                padding-bottom: 3px;">
                ר�ߣ�
                <asp:DropDownList ID="DropSearchLineId" runat="server" onchange="OnchangeWord(this.value,'GetCompanyByLine')">
                    <asp:ListItem Value="0">ר��</asp:ListItem>
                </asp:DropDownList>
                ר���̣�
                <asp:DropDownList ID="dropBusinessLineId" runat="server">
                    <asp:ListItem Value="0">ר����</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>--%>
    </table>
    <div id="divTeamorderManageList" align="center">
    </div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="30" align="right">
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
        //OrderStatusΪ����״̬ 
        var Parms = { SearchKeyword: "", Line1: 0,Line2:0,BusinessLine: 0,StartDate:"",EndDate:"",OrderStatus:-1,Page: 1 };
        var TeamorderManage = {//�Ŷ��б�
            GetTeamorderList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                LoadingImg.ShowLoading("divTeamorderManageList");
                if (LoadingImg.IsLoadAddDataToDiv("divTeamorderManageList")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "AjaxTeamorderManage.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            $("#divTeamorderManageList").html(html);
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
                TeamorderManage.OnSearch();
            },
           
           ckAllCompany: function(obj) {//ȫѡ
                $("#tbCompanyList").find("input[type='checkbox']").attr("checked", $(obj).attr("checked"));
            },
            
            
            LoadData: function(obj) {//��ҳ
                var Page = exporpage.getgotopage(obj);
                Parms.Page = Page;
                this.GetTeamorderList();
            },
            OnSearch: function() {//��ѯ
                if($("#<%=txt_Search.ClientID%>").val()!="��·���ơ������硢ר����")
                    Parms.SearchKeyword = $.trim($("#<%=txt_Search.ClientID%>").val());
                Parms.Line1 = $("#<%=DropSearchLineType.ClientID%>").val();
                Parms.StartDate = $.trim($("#txtStartDate").val());
                Parms.EndDate = $.trim($("#txtEndDate").val());
                Parms.Page = 1;
                TeamorderManage.GetTeamorderList();
            }
     }
        $(document).ready(function() {
            var FormObj = $("#<%=form1.ClientID%>");

            //�س���ѯ
            FormObj.keydown(function(event) {
                if (event.keyCode == 13) {
                    TeamorderManage.OnSearch();
                    return false;
                }
            });
            TeamorderManage.OnSearch();            
        });        
    
    
    </script>

    <%--<script type="text/javascript">
    
     //ר�����ͣ����ڹ����ܱߵȵȣ�
        function OnchangeWord(v,t)
        {
             $.ajax({
                 url: "TeamorderManage.aspx?action="+t+"&argument="+v,
                 cache: false,
                 type: "POST",
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
                         var list1 = result.tolist;
                         for(var j=0;j<list1.length;j++)
                         {
                             $("#<%=dropBusinessLineId.ClientID %>").append("<option value=\""+list1[j].ID+"\">"+list1[j].CompanyName+"</option>"); 
                         }
                     }
                 },
                 error: function() {
                     alert("����ʧ��!");
                 }
             });
        }
        
    </script>--%>
</body>
</html>

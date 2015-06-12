<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessMemeberList.aspx.cs"
    Inherits="SiteOperationsCenter.CompanyManage.BusinessMemeberList" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../usercontrol/ProvinceAndCityAndCounty.ascx" TagName="ProvinceAndCityAndCounty"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�̼һ�Ա����</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("GetCityList") %>" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("MouseFollow") %>"></script>

    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

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
            <td class="search_bg">
                �ؼ���:
                <input name="txtBusinessMemName" id="txtBusinessMemName" runat="server" style="color: #999;
                    width: 190px;" value="��˾������ַ����ơ�Ʒ��" onfocus="$(this).css('color', 'black');if(this.value == '��˾������ַ����ơ�Ʒ��') {this.value = '';}"
                    onblur="if (this.value == '') {$(this).css('color', '#999');this.value = '��˾������ַ����ơ�Ʒ��';}" />
                <uc1:ProvinceAndCityAndCounty ID="ProvinceAndCityAndCounty1" runat="server" />
                ��λ����:
                <asp:DropDownList ID="dropCompanyType" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="search_bg">
                ��˾�ȼ�:
                <asp:DropDownList ID="dropCompanyLev" runat="server">
                </asp:DropDownList>
                B2B:
                <asp:DropDownList ID="dropB2B" runat="server">
                </asp:DropDownList>
                B2C:
                <asp:DropDownList ID="dropB2C" runat="server">
                </asp:DropDownList>
                ��·����:<asp:DropDownList ID="dropLine" runat="server" onchange="OnchangeWordAdd(this.value,'GetLineByType')">
                </asp:DropDownList>
                ר��:<asp:DropDownList ID="dropLine1" runat="server">
                </asp:DropDownList>
                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/chaxun.gif" width="62"
                    height="21" style="margin-bottom: -3px;" onclick="BusinessMemManage.OnSearch();" />
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" class="caozuo_bg">
                <table width="14%" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="10%" align="right">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/ge_da.gif" width="3"
                                height="20" />
                        </td>
                        <%--<td width="29%">
                            <a href="AddBusinessMemeber.aspx">
                                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/xinzeng.gif" width="50"
                                    height="25" border="0" /></a>
                        </td>                       <td width="2%">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/ge_hang.gif" width="2"
                                height="25" />
                        </td>--%>
                        <td width="36%">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/shanchu.gif" width="51"
                                height="25" onclick="BusinessMemManage.DelBusinessMem()" />
                        </td>
                        <td width="23%">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/ge_d.gif" width="11"
                                height="25" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id="divBusinessMemberList" align="center">
    </div>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
            </td>
        </tr>
    </table>

    <script type="text/javascript" language="javascript">
    
    
        //��ȡѡ��
        function IsSelectAdv() {
            var num = 0;
            var id = "";
            $("input[type='checkbox']").each(function() {
                if ($(this).attr("checked")) {
                    num++;
                    id += $(this).val()+"$";
                }
            });
            if (num >= 1) {
                return id;
            }
            else {
                return -1;
            }
        }
        
    
        var Parms = { ProvinceId: 0, CityId: 0,CountyId:0,BusinessMemName: "",ManagementStatus:"",CompanyLev:"",B2B:"",B2C:"",Lineid:"", Page: 1 };
        var BusinessMemManage = {//�̼һ�Ա�б�
            GetBusinessList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                LoadingImg.ShowLoading("divBusinessMemberList");
                if (LoadingImg.IsLoadAddDataToDiv("divBusinessMemberList")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "AjaxBusinessMemeberList.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            $("#divBusinessMemberList").html(html);
                        }
                    });
                }
            },

           ckAllCompany: function(obj) {//ȫѡ
                $("#tbCompanyList").find("input[type='checkbox']").attr("checked", $(obj).attr("checked"));
            },
            
            //ɾ���̼һ�Ա
           DelBusinessMem:function(){
                var advid = IsSelectAdv();
                if (advid != -1) {
                    if (!confirm("��ȷ��Ҫɾ������������")) {
                        return false;
                    }
                    $.ajax
                    ({
                        url: "BusinessMemeberList.aspx?type=DeleteBusinessMem&arg=" + advid,
                        cache: false,
                        async: false,
                        success: function(msg) {
                                if(msg=="1"){
                                    alert("ɾ���ɹ���");
                                    BusinessMemManage.OnSearch();
                                    }
                                else if(msg=="0")
                                    alert("ɾ��ʧ��");
                                    
                            
                        },
                        error: function() {
                            alert("����ʧ��");
                        }
                    });
                } else {
                    alert("��ѡ��һ�");
                    return false;
                }
            },
    
    
            
            LoadData: function(obj) {//��ҳ
                var Page = exporpage.getgotopage(obj);
                Parms.Page = Page;
                this.GetBusinessList();
            },
            OnSearch: function() {//��ѯ
            
                Parms.ProvinceId = $(("#" + provinceAndCityUserControl["<%=ProvinceAndCityAndCounty1.ClientID%>"].provinceId)).val();
                Parms.CityId = $(("#" + provinceAndCityUserControl["<%=ProvinceAndCityAndCounty1.ClientID%>"].cityId)).val();
                Parms.CountyId=$(("#" + provinceAndCityUserControl["<%=ProvinceAndCityAndCounty1.ClientID%>"].countyId)).val();
                Parms.BusinessMemName = $.trim($("#txtBusinessMemName").val());
                Parms.Page = 1;
                //��λ����
                if($("#dropCompanyType").val()=="-1")
                Parms.CompanyType="";else Parms.CompanyType=$("#dropCompanyType").val();
                //��˾�ȼ�
                if($("#dropCompanyLev").val()=="-1")
                Parms.CompanyLev="";else Parms.CompanyLev=$("#dropCompanyLev").val();
                
                if($("#dropB2B").val()=="-1")
                Parms.B2B="";else Parms.B2B=$("#dropB2B").val();
                
                if($("#dropB2C").val()=="-1")
                Parms.B2C="";else Parms.B2C=$("#dropB2C").val();
                
                //ר��
                if($("#dropLine1").val()=="0")
                Parms.Lineid="";Parms.Lineid=$("#dropLine1").val();
                
                
                BusinessMemManage.GetBusinessList();
            },
            openDialog: function(strurl, strtitle, strwidth, strheight, strdate) {
                Boxy.iframeDialog({ title: strtitle, iframeUrl: strurl, width: strwidth, height: strheight, draggable: true, data: strdate });
            },
            
            LookCompanySaleCity: function(CompanyId) { //�鿴���۳���
                BusinessMemManage.openDialog("CompanySaleCity.aspx", "���۳���", "400", "300", "CompanyId=" + CompanyId + "&rad=" + new Date().getTime());
            },
            LookCompanyTourArea: function(CompanyId) {//�鿴��Ӫ��·����
                BusinessMemManage.openDialog("CompanyTourArea.aspx", "��Ӫ��·����", "500", "300", "CompanyId=" + CompanyId + "&rad=" + new Date().getTime());
            }
        }
        
        $(document).ready(function() {
            $("#<%=txtBusinessMemName.ClientID %>").keydown(function(event) {
                if (event.keyCode == 13) {
                  
                    BusinessMemManage.OnSearch();
                    return false;
                }
            });
            BusinessMemManage.OnSearch();
        });
        
    </script>

    <script type="text/javascript">
    
        //ר�����ͣ����ڹ����ܱߵȵȣ�
        function OnchangeWordAdd(v,t)
        {
             $.ajax({
                 url: "BusinessMemeberList.aspx?action="+t+"&argument="+v,
                 cache: false,
                 type:"POST",
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

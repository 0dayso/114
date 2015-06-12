<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalMemberList.aspx.cs"
    Inherits="SiteOperationsCenter.CompanyManage.PersonalMemberList" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../usercontrol/ProvinceAndCityAndCounty.ascx" TagName="ProvinceAndCityAndCounty"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���˻�Ա����</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("GetCityList") %>" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("MouseFollow") %>"></script>

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

    <style type="text/css">
        #txtCompanyName
        {
            width: 186px;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="search_bg">
                �ؼ���
                <input name="txtPersonalMemName" id="txtPersonalMemName" runat="server" style="color: #999;
                    width: 190px" value="��λ������ַ����ϵ�ˣ��˻�" size="16" onfocus="$(this).css('color', 'black');if(this.value == '��λ������ַ����ϵ�ˣ��˻�') {this.value = '';}"
                    onblur="if (this.value == '') {$(this).css('color', '#999');this.value = '��λ������ַ����ϵ�ˣ��˻�';}" />
                <uc1:ProvinceAndCityAndCounty ID="ProvinceAndCityAndCounty1" runat="server" />
                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/chaxun.gif" width="62"
                    height="21" style="margin-bottom: -3px;" onclick="CompanyUserManage.OnSearch();" />
            </td>
        </tr>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="13%" class="caozuo_bg">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="4%" align="right">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/ge_da.gif" width="3"
                                height="20" />
                        </td>
                        <%--                        <td width="23%">
                            <a href="AddPersonalMember.aspx">
                                <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/xinzeng.gif" width="50"
                                    height="25" border="0" /></a>
                        </td>
                        <td width="4%">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/ge_hang.gif" width="2"
                                height="25" />
                        </td>--%>
                        <td width="23%">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/shanchu.gif" width="51"
                                height="25" onclick="DelPersonalMem()" />
                        </td>
                        <td width="17%">
                            <img src="<%=ImageManage.GetImagerServerUrl(1)%>/images/yunying/ge_d.gif" width="11"
                                height="25" />
                        </td>
                    </tr>
                </table>
            </td>
            <td width="87%" class="caozuo_bg">
                <a href="#" onclick="GetListbyTime(1)">��ע��ʱ�併��</a> <a href="#" onclick="GetListbyTime(2)">
                    ��ע��ʱ������</a> <a href="#" onclick="GetListbyTime(3)">����¼ʱ�併��</a> <a href="#" onclick="GetListbyTime(4)">
                        ����¼ʱ������</a>
            </td>
        </tr>
    </table>
    <div id="divPersonalMemberList" align="center">
    </div>

    <script type="text/javascript" language="javascript">
        //��ȡѡ��
        function IsSelectAdv() {
            var num = 0;
            var id = "";
            $("input[name='checkbox']").each(function() {
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
        
    
        
        //ɾ�����˻�Ա
        function DelPersonalMem()
        {
            var advid = IsSelectAdv();
            if (advid != -1) {
                if (!confirm("��ȷ��Ҫɾ������������")) {
                    return false;
                }
                $.ajax
                ({
                    url: "PersonalMemberList.aspx?type=DeletePersonalMem&arg=" + advid,
                    cache: false,
                    async: false,
                    success: function(msg) {
                            if(msg=="1"){
                                alert("ɾ���ɹ���");
                                CompanyUserManage.OnSearch();
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
        }
    
    </script>

    <script type="text/javascript" language="javascript">
    
        var Sort=-1;
        //Sort=0����ע��ʱ������Sort=1���յ�¼ʱ������ Sort=-1Ϊԭʼ����
        var Parms = { ProvinceId: 0, CityId: 0,CountyId:0,PersonalMemName: "",Sort:-1,Companyid:"", Page: 1 };
        var CompanyUserManage = {//�����б�
            GetPersonalList: function() {
                 if(<%=currentPage %> >0 ){
                     Parms.Page=<%=currentPage %>;
                 }
                 //alert($("#form1").find("table:eq(2)").after().html())
                LoadingImg.ShowLoading("divPersonalMemberList");
                if (LoadingImg.IsLoadAddDataToDiv("divPersonalMemberList")) {
                    $.ajax({
                        type: "GET",
                        dataType: 'html',
                        url: "AjaxPersonalMemberList.aspx",
                        data: Parms,
                        cache: false,
                        success: function(html) {
                            $("#divPersonalMemberList").html(html);
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
                this.GetPersonalList();
            },
            OnSearch: function() {//��ѯ
                Parms.ProvinceId = $(("#" + provinceAndCityUserControl["<%=ProvinceAndCityAndCounty1.ClientID%>"].provinceId)).val();
                Parms.CityId = $(("#" + provinceAndCityUserControl["<%=ProvinceAndCityAndCounty1.ClientID%>"].cityId)).val();
                Parms.CountyId=$(("#" + provinceAndCityUserControl["<%=ProvinceAndCityAndCounty1.ClientID%>"].countyId)).val();
                Parms.PersonalMemName = $.trim($("#txtPersonalMemName").val());
                Parms.Sort=Sort;
                Parms.Page = 1;
                CompanyUserManage.GetPersonalList();
            }
        }
        
        $(document).ready(function() {
            var FormObj = $("#<%=form1.ClientID%>");

            //�س���ѯ
            FormObj.keydown(function(event) {
                if (event.keyCode == 13) {
                    CompanyUserManage.OnSearch();
                    return false;
                }
            });
            if('<%=Companyid %>'!="")
            {
                Parms.Companyid='<%=Companyid %>';
            }
            CompanyUserManage.OnSearch();
        });
        
        
        //��ʱ������1:��ע��ʱ�併��,2��ע��ʱ������,3����¼ʱ�併��,4����¼ʱ������
        function GetListbyTime(s)
        {
            Sort=s;
            CompanyUserManage.OnSearch();
        }  
    </script>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddScenic.aspx.cs" Inherits="SiteOperationsCenter.ScenicManage.AddScenic"
    EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Assembly="FCKeditor.Net_2.6.3" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�������</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("json2.js") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <style type="text/css">
        #txt_CnAddress
        {
            width: 365px;
        }
        #txt_EnAddress
        {
            width: 365px;
        }
        #txt_CompanyId
        {
            width: 266px;
        }
        #txt_ScenicName
        {
            width: 361px;
        }
        #txt_EnName
        {
            width: 361px;
        }
        #txt_Telephone
        {
            width: 361px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="80%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC"
        class="lr_hangbg table_basic">
        <tr>
            <td width="16%" align="right">
                <span class="unnamed1">*</span>��˾��ţ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_CompanyId" id="txt_CompanyId" runat="server" valid="required"
                    errmsg="�����빫˾��ţ�" />
                <span id="errMsg_txt_CompanyId" class="errmsg"></span>
                <input id="BindScenicContact" runat="server" type="button" value="��ȡ������ϵ��" onclick="BindScenicContactf();" />
                <span class="unnamed1">*</span>������ϵ�ˣ�<asp:DropDownList ID="ScenicContact" runat="server">
                </asp:DropDownList>
                <input id="hid_Operator" type="hidden" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="16%" align="right">
                <span class="unnamed1">*</span>�������ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_ScenicName" id="txt_ScenicName" runat="server" valid="required"
                    errmsg="�����뾰�����ֳ�����1-28��" />
                <span id="errMsg_txt_ScenicName" class="errmsg"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                Ӣ�����ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_EnName" id="txt_EnName" runat="server" errmsg="�����뾰��Ӣ�����Ƴ�����1-100��"
                    onblur="this.value=ignoreSpaces(this.value);" />
                <%--<span id="errMsg_txt_EnName" class="errmsg"></span>--%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ͼ��Ϣ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                (<label id="X" runat="server"></label>,<label id="Y" runat="server"></label>)
                <input type="button" name="Setmap" id="Setmap" value="��ͼѡ��" />
                <asp:HiddenField runat="server" ID="jingdu" />
                <asp:HiddenField runat="server" ID="weidu" />
            </td>
        </tr>
        <%--        <tr>
            <td align="right">
                ��ϵ�ˣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_ContactOperator" id="txt_ContactOperator" runat="server"
                    errmsg="��������ϵ�ˣ�" valid="required" />
                <span id="errMsg_txt_ContactOperator" class="errmsg"></span>
            </td>
        </tr>--%>
        <tr>
            <td align="right">
                �ͷ��绰��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_Telephone" id="txt_Telephone" runat="server" />
                <%--<span id="errMsg_txt_Telephone" class="errmsg"></span>
                <span id="error_txt_Telephone"  class="errmsg" style="display: none">��������ȷ�Ŀͷ��绰</span>--%>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���Ҵ��룺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input id="ProvinceText" type="hidden" runat="server" />
                <input id="CityText" type="hidden" runat="server" />
                <input id="CountryText" type="hidden" runat="server" />
                <input id="ProvinceId" type="hidden" runat="server" />
                <input id="CityId" type="hidden" runat="server" />
                <input id="CountryId" type="hidden" runat="server" />
                <span class="unnamed1" id="ProvinceRequired" style="display: none">*</span>ʡ�ݣ�<asp:DropDownList
                    ID="ddl_ProvinceList" runat="server">
                </asp:DropDownList>
                <span class="unnamed1" id="CityRequired" style="display: none">*</span>���У�<asp:DropDownList
                    ID="ddl_CityList" runat="server">
                </asp:DropDownList>
                <span class="unnamed1" id="CountyRequired" style="display: none">*</span>������<asp:DropDownList
                    ID="ddl_CountyList" runat="server">
                </asp:DropDownList>
                <span id="errMsg_Province" style="display: none" class="unnamed1">��ѡ��ʡ��-����-����</span>
                <span id="errMsg_City" style="display: none" class="unnamed1">��ѡ�����</span> <span
                    id="errMsg_CountyList" style="display: none" class="unnamed1">��ѡ������</span>
            </td>
        </tr>
        <tr>
            <td align="right">
                �ر�����
            </td>
            <td width="84%" align="left" bgcolor="#FFFFFF" id="Td_ChbLankId">
                <asp:Repeater ID="ChbLankId" runat="server">
                    <ItemTemplate>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���ĵ�ַ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_CnAddress" id="txt_CnAddress" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                Ӣ�ĵ�ַ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_EnAddress" id="txt_EnAddress" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="unnamed1">*</span>���⣺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=strchb%>
                <span id="errMsg_ThemeId" style="display: none; color: Red;">������ѡ��һ�����������ѡ��3��</span>
                <%--                <asp:Repeater ID="chbThemeId" runat="server">
                    <ItemTemplate>
                        <label for="labThemeId_<%#Eval("ThemeId") %>">
                            <%# Eval("ThemeName") %><input type="checkbox" name="chbTheme" id="chbThemeId_<%#Eval("ThemeId") %>"
                                value="<%#Eval("ThemeId") %>" /></label>
                    </ItemTemplate>
                </asp:Repeater>--%>
            </td>
        </tr>
        <tr>
            <td align="right">
                �����ȼ���
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="DdlHotelStar" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                ������ݣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input name="txt_SetYear" id="txt_SetYear" type="text" size="6" runat="server" />
                ��
            </td>
        </tr>
        <tr>
            <td align="right">
                �ճ�����ʱ�䣺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_OpenTime" id="txt_OpenTime" cols="50" rows="3" runat="server"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                ������ϸ���ܣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <FCKeditorV2:FCKeditor ID="txt_Description" ToolbarSet="Default" Height="420px" runat="server">
                </FCKeditorV2:FCKeditor>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��ͨ˵����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Traffic" id="txt_Traffic" cols="50" rows="5" runat="server" onclick="return txt_Traffic_onclick()"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                �ܱ���ʩ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Facilities" id="txt_Facilities" cols="50" rows="5" runat="server"></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">
                B2B��ʾ���ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="DdlB2B" runat="server" errmsg="��ѡ��" valid="required">
                </asp:DropDownList>
                <span class="unnamed1">*</span>
                <input id="txt_B2BOrder" name="txt_B2BOrder" type="text" runat="server" value="50" />
                ��1~50����������Ĭ��50����ŵ����Ա���ƣ�
            </td>
        </tr>
        <tr>
            <td align="right">
                B2C��ʾ���ƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="DdlB2C" runat="server">
                </asp:DropDownList>
                <span class="unnamed1">*</span>
                <input id="txt_B2COrder" size="10" name="txt_B2COrder" runat="server" type="text"
                    value="50" />
                ��1~50����������Ĭ��50����ŵ����Ա���ƣ�
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="unnamed1">*</span>��ˣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="DdlStatus" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td height="50" colspan="2" align="center" bgcolor="#FFFFFF">
                <asp:Button ID="btnSave" class="baocun_an" runat="server" Text="�� ��" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>
    </form>
    <br />

    <script type="text/javascript">
    
    
    
    //���ù�˾��γ��
    $("#Setmap").click(function() {
   
            var Y=$("#weidu").val();
            var X=$("#jingdu").val();
            var url = "SetGoogleMap.aspx?weidu="+Y+"&jindu="+X+"";
            var title = "���õ�ͼ";
            Boxy.iframeDialog({ title: title, iframeUrl: url, height: 800, width: 900, draggable: false })
            return false;
    });
    
    //�󶨵ر�����
    function BinLankId()
    {
        $("#Td_ChbLankId").html("");
        var v=$("#ddl_CityList option:selected").val();
        $.ajax({
             url: "AjaxAll.ashx?type=BinLankId&arg="+v,
             cache: false,
             type: "post",
             success: function(result) {
                 if(result=="error")
                 {
                 }
                 else if(result=="NoLogin")
                 {
                    alert("�㻹δ��¼");
                 }
                 else{
                     var list = eval(result);
                     
                     for(var i=0;i<list.length;i++)
                     {
                         $("#Td_ChbLankId").append("<input type=\"checkbox\" name=\"chkboxLankid\" value=\""+list[i].Id+"\" id=\"cbxl_"+i+"\" /><label for=\"cbxl_"+i+"\">"+list[i].Por+"</label>"); 
                         if(i%5==0&&i>0)
                         {
                            $("#Td_ChbLankId").append("<br>");
                         }
                    }
                }
             },
             error: function() {
                 alert("����ʧ��!");
             }    
        });
    }
    
    function SetProvince(ProvinceId) {
        $("#<%=ddl_ProvinceList.ClientID %>").attr("value", ProvinceId);
    }
    function SetCity(CityId) {
        $("#<%=ddl_CityList.ClientID %>").attr("value", CityId);
    }
    function SetCounty(CountyId) {
        $("#<%=ddl_CountyList.ClientID %>").attr("value", CountyId);
    }
    
    
    function BindScenicContactf()
    {
        $("#ScenicContact").html("");
        $("#BindScenicContact").val("���ڻ�ȡ....");
        $("#BindScenicContact").attr("disabled","disabled");
        $("#<%=btnSave.ClientID %>").attr("disabled","disabled");
        var companyid=$("#txt_CompanyId").val();
        $.ajax({
             url: "AjaxAll.ashx?type=BindContact&arg="+companyid,
             cache: false,
             type: "post",
             success: function(result) {
             if(result=="error")
             {
                alert("û�иù�˾��ŵĳ�Ա�����鹫˾����Ƿ�����");
             }
             else if(result=="NoLogin")
             {
                alert("�㻹δ��¼");
             }
             else
             {
                  var argumentlist=result.toString().split('$');
                  $("#hid_Operator").val(argumentlist[1]);
                  var list = eval(argumentlist[0]);
                  for(var i=0;i<list.length;i++)
                  {
                    $("#ScenicContact").append("<option value='"+list[i].UserId+"'>"+list[i].UserName+"</option>"); 
                  }

             }
                  $("#BindScenicContact").val("��ȡ������ϵ��");
                  $("#BindScenicContact").attr("disabled","");
                  $("#<%=btnSave.ClientID %>").attr("disabled","");
               
             },
             error: function() {
                 alert("����ʧ��!");
                 $("#BindScenicContact").val("��ȡ������ϵ��");
                 $("#BindScenicContact").attr("disabled","");
                 $("#<%=btnSave.ClientID %>").attr("disabled","");
             }    
        });
    
    }
    
    //�޸�״̬�� �󶨾�����ϵ��
   $(function(){
          if('<%=ScenicIdAndComId %>'!=null)
          {
            if('<%=ScenicIdAndComId[0] %>'!="")
                BindScenicContactf();
          }  
    });
   

    
    var isSubmit = false; //���ְ�ť�Ƿ��ύ��
    //ģ��һ���ύ��ť�¼�    
    function doSubmit(){
         isSubmit = true;
         $("#<%=btnSave.ClientID%>").click();
    }
    
    $(function(){
        $("#<%=btnSave.ClientID%>").click(function(){
            if(isSubmit){
            //�����ť�Ѿ��ύ��һ����֤���򷵻�ִ�б������
                return true;
            }
            //��֤��
//            var isValidator = ValiDatorForm.validator($("#form1").get(0), "span");
//            if(!isValidator)
//                return false;
            //��֤����绰
            if($("#<%=ScenicContact.UniqueID %>").val()==null)
            {
                alert("���ȡ������ϵ��");
                return false;
            }
            
            var scenicname=$("#txt_ScenicName").val();
            if(scenicname.length>28&&scenicname.length>0){
                alert("�����뾰�����Ƴ�����1-28");
                $("#txt_ScenicName").focus();
                return false;
            }
            
//            var EnName=$("#txt_EnName").val();
//            if(EnName.length>100&&EnName.length>0){
//                alert("������Ӣ�����Ƴ�����1-100");
//                $("#txt_EnName").focus();
//                return false;
//            }

            
//            var pattern = new RegExp("[^ ' "\!@#\$%^&\*~ ',\. "]");
//            var EnName=$("#txt_EnName").val();
//            alert(EnName);
//            if(!pattern.test(EnName))
//            {
//                alert("Ӣ�������к��������ַ�");
//                $("#txt_EnName").focus();
//                return false;
//            }
            
            var Telephone=$("#txt_Telephone").val();
            if(Telephone.length>50&&Telephone.length>0){
                alert("������ͷ��绰������1-50");
                $("#txt_Telephone").focus();
                return false;
            }
            
            
            
            var CnAddress=$("#txt_CnAddress").val();
            if(CnAddress.length>60&&CnAddress.length>0){
                alert("���������ĵ�ַ������1-60");
                $("#txt_CnAddress").focus();
                return false;
            }
            
//            var EnAddress=$("#txt_EnAddress").val();
//            if(EnAddress.length>200&&EnAddress.length>0){
//                alert("������Ӣ�ĵ�ַ������1-200");
//                $("#txt_EnAddress").focus();
//                return false;
//            }
            
            
            
            //ʡ��-����-����
//            if($("#<%=ddl_ProvinceList.UniqueID %>").val()=="0"||$("#<%=ddl_CityList.UniqueID %>").val()=="0"||$("#<%=ddl_CountyList.UniqueID %>").val()=="0")
//            {
//                $("#errMsg_Province").show();
//                return false;
//            }
//            else
//                $("#errMsg_Province").hide();
            
            
            var OpenTime=$("#txt_OpenTime").val();
            if(OpenTime.length>200&&OpenTime.length>0){
                alert("�������ճ�����ʱ�䳤����1-200");
                $("#txt_OpenTime").focus();
                return false;
            }
            
            
            
            
//            var tel=$("#txt_Telephone").val();
//            var IstelNumber=/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/; 
//            if(!IstelNumber.test(tel))
//            {
//                $("#error_txt_Telephone").show();
//                return false;
//            }

            //��֤����            
            var arr=$("input[type=checkbox][name='chbTheme']:checked").length
            if (arr == 0||arr>3) {
                $("#errMsg_ThemeId").show();
                return false;
            } else {
                $("#errMsg_ThemeId").hide();
            } 
            //��֤�������
//            var DdlHotelStar=$("#<%=DdlHotelStar.UniqueID %>").val();
//            if(DdlHotelStar=="0")
//            {
//                $("#errMsg_DdlHotelStar").show();
//                return false;
//            }
//            else
//            $("#errMsg_DdlHotelStar").hide();
            
            var SetyearToInt=parseInt($("#txt_SetYear").val());
            var dat=new Date().getFullYear();
            if($("#txt_SetYear").val()!=""){
            if(!(/^[0-9]+$/.test($("#txt_SetYear").val()))||SetyearToInt>dat)
            {
                alert("��������ȷ�ĳ������");
                return false;
            }}
            //��֤B2BandB2C
            var B2BOrderToInt=parseInt($("#txt_B2BOrder").val());
            var B2COrderToInt=parseInt($("#txt_B2COrder").val());
            if(B2BOrderToInt>99||B2BOrderToInt<1||$("#txt_B2BOrder").val()=="")
            {
                alert("B2B������1-99֮�������");
                return false;
            }
            if(B2COrderToInt>99||B2COrderToInt<1||$("#txt_B2COrder").val()=="")
            {
                alert("B2C������1-99֮�������");
                return false;
            }
            
            if($("#<%=DdlStatus.UniqueID %>").val()=="0")
            {
                $("#errMsg_DdlStatus").show();
                return false;
            }
        });
	    FV_onBlur.initValid($("#form1").get(0));
    });
    function txt_Traffic_onclick() {

    }

    </script>

</body>
</html>

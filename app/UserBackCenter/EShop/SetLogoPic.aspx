<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetLogoPic.aspx.cs" Inherits="UserBackCenter.EShop.SetLogoPic" %>

<%@ Register Src="~/usercontrol/SingleFileUpload.ascx" TagName="SingleFileUpload"
    TagPrefix="uc1" %>
<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ϴ�logoͼƬ</title>
    <link href="<%=CssManage.GetCssFilePath("swfupload") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("backalertbody") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("swfupload") %>"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div runat="server" id="divOldTemplate">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr style="height: 150px;">
                <td width="22%" class="left1">
                    �ϴ��������ƣ�
                </td>
                <td width="78%" class="right1" align="left">
                    <uc1:SingleFileUpload ID="sfulogo" runat="server" ImageWidth="960" ImageHight="147"
                        IsUploadSwf="true" />
                    (ͼƬ��С960*147����)&nbsp;&nbsp;
                    <asp:Literal ID="ltr_logo" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <asp:Button ID="btnsubmitlogo" runat="server" Text="�ύ" Style="height: 22px; width: 60px;"
                        OnClick="btnsubmitlogo_Click" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdfAgoImgPath" runat="server" />

        <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>

        <script type="text/javascript">
        var sfu1,isSubmit=false;
    $(function(){
        sfu1 = <%=sfulogo.ClientID %>;
        $("#<%=btnsubmitlogo.ClientID %>").click(function(){
            if(isSubmit){
                return true;
            }
            if(sfu1.getStats().files_queued<=0)
            {
                alert("��ѡ���ļ��ϴ���");
                return false;
            }
            sfu1.customSettings.UploadSucessCallback = doSubmit;
            sfu1.startUpload();                
            return false;
        });
    });
    function doSubmit()
    {
        isSubmit = true;
        $("#<%=btnsubmitlogo.ClientID %>").click();
    }
    
        </script>

    </div>
    <div runat="server" id="divNewTemplate">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="45%" height="30" align="center">
                    <input id="ckbDefault" name="ckbModel" runat="server" onclick="ShowFileUp('d')" type="radio" /><label
                        for="ckbDefault">��ͨģʽ</label>
                    <input id="ckbCustom" type="radio" runat="server" name="ckbModel" onclick="ShowFileUp('c')" /><label
                        for="ckbCustom">����ģʽ</label>
                </td>
                <td width="55%">
                    &nbsp;
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="5" id="tblCompanyLog">
            <tr>
                <td width="22%" class="left1">
                    �ϴ�LOGO��
                </td>
                <td width="78%" class="right1">
                    <uc1:SingleFileUpload ID="sfuCompanyLog" runat="server" ImageWidth="150" ImageHight="60"
                        IsUploadSwf="false" />
                    (ͼƬ��С150px*60px)&nbsp;&nbsp;
                    <asp:Literal ID="ltrCompanyLog" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="left1">
                    �ϴ�����ͼƬ��
                </td>
                <td class="right1">
                    <uc1:SingleFileUpload ID="sfuBackImg" runat="server" ImageWidth="960" ImageHight="120"
                        IsUploadSwf="false" />
                    (ͼƬ��С960px*120px)&nbsp;&nbsp;
                    <asp:Literal ID="ltrBackImg" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="5" id="tblCustomImg">
            <tr>
                <td width="22%" class="left1">
                    �ϴ��������ƣ�
                </td>
                <td width="78%" class="right1">
                    <uc1:SingleFileUpload ID="sfuCustomImg" runat="server" ImageWidth="960" ImageHight="120"
                        IsUploadSwf="true" />
                    ��ͼƬ��С960px*120px��<br />
                    ������ģʽ������ʽ�ḻ��banner���򲻾������и�ʽ�����Զ�������κ����֡�ͼƬ���ݣ�֧��.gif.jpg.swf��ʽ��<br />
                    <asp:Literal ID="ltrCustomImg" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <asp:Button runat="server" ID="btnSaveNew" Text="�ύ" Style="height: 22px; width: 60px;"
                        OnClick="btnSaveNew_Click" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hidCompanyLog" runat="server" />
        <asp:HiddenField ID="hidBackImg" runat="server" />
        <asp:HiddenField ID="hidCustomImg" runat="server" />

        <script type="text/javascript">

            var sfuLog;
            var sfuImg;
            var sfuCustomImg;
            var isNewSubmit = false;

            $(function() {
                sfuLog = <%= sfuCompanyLog.ClientID %>;
                sfuImg = <%= sfuBackImg.ClientID %>;
                sfuCustomImg = <%= sfuCustomImg.ClientID %>;
                $("#<%= btnSaveNew.ClientID %>").click(function() {
                    $("#<%= btnSaveNew.ClientID %>").attr("disabled","disabled");
                    if (isNewSubmit) {
                        <%= this.Page.GetPostBackEventReference(this.btnSaveNew) %>
                        //return true;
                    }
                    else {
                        var strErr = "";
                        if ($("#<%= ckbDefault.ClientID %>").attr("checked")) {
                            if ($("#<%= hidCompanyLog.ClientID %>").val() == "") {  //ԭ����ͼƬ�����ϴ�ͼƬ��֤
                                if (sfuLog.getStats().files_queued <= 0)
                                    strErr += "���ϴ�Logo��\n";
                            }
                            if ($("#<%= hidBackImg.ClientID %>").val() == "") {
                                if (sfuImg.getStats().files_queued <= 0)
                                    strErr += "���ϴ�����ͼƬ��\n";
                            }
                        }
                        else if ($("#<%= ckbCustom.ClientID %>").attr("checked")) {
                            if ($("#<%= hidCustomImg.ClientID %>").val() == "") {
                                if (sfuCustomImg.getStats().files_queued <= 0)
                                    strErr += "���ϴ��������ƣ�\n";
                            }
                        }
                        else
                            strErr += "��ѡ��ģʽ��\n";

                        if (strErr != "") {
                            alert(strErr);
                            return false;
                        }
                        if ($("#<%= ckbDefault.ClientID %>").attr("checked"))
                            UpdateCompanyLog();
                        else if ($("#<%= ckbCustom.ClientID %>").attr("checked"))
                            UpdateCustomImg();

                        return false;
                    }
                });
            });

            //�ϴ���˾Log
            function UpdateCompanyLog() {
                if (sfuLog.getStats().files_queued > 0) {
                    sfuLog.customSettings.UploadSucessCallback = UpdateCompanyImg;
                    sfuLog.startUpload();
                }
                else {
                    UpdateCompanyImg();
                }
            }

            //�ϴ���˾����ͼƬ
            function UpdateCompanyImg() {
                if (sfuImg.getStats().files_queued > 0) {
                    sfuImg.customSettings.UploadSucessCallback = doNewSubmit;
                    sfuImg.startUpload();
                }
                else {
                    doNewSubmit();
                }
            }

            //�ϴ�����ͼƬ
            function UpdateCustomImg() {
                if (sfuCustomImg.getStats().files_queued > 0) {
                    sfuCustomImg.customSettings.UploadSucessCallback = doNewSubmit;
                    sfuCustomImg.startUpload();
                }
                else {
                    doNewSubmit();
                }
            }

            function doNewSubmit() {
                isNewSubmit = true;
                $("#<%= btnSaveNew.ClientID %>").click();
            }

            function ShowFileUp(type) {
                isNewSubmit = false;
                if (type == "d") {
                    $("#tblCompanyLog").show();
                    $("#tblCustomImg").hide();
                }
                else if (type == "c") {
                    $("#tblCompanyLog").hide();
                    $("#tblCustomImg").show();
                }
            }
        </script>

    </div>
    </form>
</body>
</html>

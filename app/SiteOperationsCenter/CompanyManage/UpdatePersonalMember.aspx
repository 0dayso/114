<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePersonalMember.aspx.cs"
    Inherits="SiteOperationsCenter.CompanyManage.UpdatePersonalMember" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���˻�Ա����-�޸�</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

</head>
<body>
    <form id="form1" runat="server">
    <table width="80%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#cccccc"
        class="lr_hangbg table_basic">
        <tr>
            <td width="19%" align="right">
                <span class="unnamed1">*</span>�û�����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_UserName" runat="server" id="txt_UserName" disabled="disabled" />
                <span id="errMsg_txt_UserName" class="unnamed1" style="display: none;">�����볤��Ϊ16����ĸ���û���</span>
            </td>
        </tr>
        <tr>
            <td align="right">
                MQ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_MQ" runat="server" id="txt_MQ" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right">
                MQ�ǳƣ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_MQNickname" runat="server" id="txt_MQNickname" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="unnamed1">*</span>��ʵ������
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_RealName" id="txt_RealName" runat="server" />
                <span id="errMsg_txt_RealName" class="unnamed1" style="display: none;">��������ʵ����</span>
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="unnamed1">*</span>���룺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_Password" id="txt_Password" runat="server" />
                <span id="errMsg_txt_Password" class="unnamed1" style="display: none;">����������</span>
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="unnamed1">*</span>�ظ����룺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" id="txt_RePassword" runat="server" name="txt_RePassword" />
                <span id="errMsg_txt_RePassword" class="unnamed1" style="display: none;">�������ظ�������Ӧ��������ͬ</span>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��˾ְ��
            </td>
            <td width="81%" align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_Post" id="txt_Post" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                �Ա�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="dropSex" runat="server">
                    <asp:ListItem Value="-1">��ѡ��</asp:ListItem>
                    <asp:ListItem Value="1">��</asp:ListItem>
                    <asp:ListItem Value="0">Ů</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                �绰��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_tel" id="txt_tel" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                �ֻ���
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_Mobile" id="txt_Mobile" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                ���棺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_Fax" id="txt_Fax" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                QQ��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_QQ" id="txt_QQ" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                MSN��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_MSN" id="txt_MSN" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right">
                <span class="unnamed1">*</span>Email��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <input type="text" name="txt_Email" id="txt_Email" runat="server" val />
                <span id="errMsg_txt_Email" class="unnamed1" style="display: none;">������email���߸�ʽ����</span>
            </td>
        </tr>
        <%--<tr>
            <td align="right">
                ����ǩ����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <textarea name="txt_Signature" id="txt_Signature" runat="server" cols="50" rows="3"></textarea>
                ��MQǩ����
            </td>
        </tr>--%>
        <tr>
            <td align="right">
                ��Ӫ����
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <%=strArea %>
            </td>
        </tr>
        <tr>
            <td align="right">
                Ȩ�޲鿴��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="dropPermissions" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                ���ţ�
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:DropDownList ID="dropDepartment" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                �Ƿ����˻���
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:Literal ID="IsAdmin" runat="server">
                </asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right">
                ��¼������
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:Literal ID="txt_LoginTime" runat="server">
                </asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right">
                ע��ʱ�䣺
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:Literal ID="txt_RegiserTime" runat="server">
                </asp:Literal>
            </td>
        </tr>
        <tr>
            <td align="right">
                �����¼��
            </td>
            <td align="left" bgcolor="#FFFFFF">
                <asp:Literal ID="txt_LastLogin" runat="server">
                </asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" bgcolor="#FFFFFF">
                <asp:Button ID="btnUpdate" runat="server" Text="�� ��" Style="height: 27px;" OnClick="btnUpdate_Click" />
                &nbsp;
                <asp:Button ID="btnClosed" runat="server" Text="�� ��" Style="height: 27px;" OnClick="btnClosed_Click" />
            </td>
        </tr>
    </table>
    </form>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>

    <script type="text/javascript">
    
        var isSubmit = false; //���ְ�ť�Ƿ��ύ��
        //ģ��һ���ύ��ť�¼�    
        function doSubmit(){
             isSubmit = true;
             $("#<%=btnUpdate.ClientID%>").click();
        }
    
        $(function(){
            $("#<%=btnUpdate.ClientID%>").click(function(){
                if(isSubmit){
                //�����ť�Ѿ��ύ��һ����֤���򷵻�ִ�б������
                    return true;
                }
                
                
                //��֤�û���
                var username=$.trim($("#<%=txt_UserName.UniqueID %>").val());
                if(username.length<1||username.length>32)
                {
                    $("#errMsg_txt_UserName").show();
                    $("#txt_UserName").focus();
                    return false;
                }else
                {
                    $("#errMsg_txt_UserName").hide();
                }
                
                /*��֤�û����Ƿ����
//                var returnval=0;
//                $.ajax({
//                     url: "UpdatePersonalMember.aspx?type=IsUserName&argument="+username,
//                     cache: false,
//                     type: "post",
//                     async:false,   
//                     success: function(result) {
//                            if(result=="true")
//                            {
//                                returnval=1;
//                                alert("���û����Ѿ�����");
//                            }
//                     },
//                     error: function() {
//                         alert("����ʧ��!");
//                     }    
//                 });
//                 if(returnval==1)
//                 {
//                    $("#txt_UserName").focus();
//                    return false;
//                }
*/
                //��֤��ʵ����
                var realName=$("#<%=txt_RealName.UniqueID %>").val();
                if(realName=="")
                {
                    $("#errMsg_txt_RealName").show();
                    $("#txt_UserName").focus();
                    return false;
                }
                else
                {
                    $("#errMsg_txt_Password").hide();
                }
                
                
                //��֤����
                var Password=$("#<%=txt_Password.UniqueID %>").val();
                var RePassword=$("#<%=txt_RePassword.UniqueID %>").val();
                if(Password!="")
                {
                    if(RePassword!=Password)
                    {
                        $("#errMsg_txt_RePassword").show();
                        $("#txt_RePassword").focus();
                        return false;
                    }
                }
                
                //��֤email
                var email=$("#<%=txt_Email.UniqueID%>").val();
                if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
                {
                    $("errMsg_txt_Email").hide();
                }
                else
                {
                    $("#errMsg_txt_Email").show();
                    $("#txt_Email").focus();
                    return false;
                }
                
            });
	        FV_onBlur.initValid($("#form1").get(0));
        });
    
    </script>

</body>
</html>

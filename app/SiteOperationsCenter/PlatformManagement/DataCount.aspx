<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataCount.aspx.cs" Inherits="SiteOperationsCenter.PlatformManagement.DataCount" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>����ͳ��ά��</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="95%" border="1" align="center" cellpadding="5" cellspacing="0" bordercolor="#C8E0EB">
        <tr>
            <td width="15%" height="22" align="right">
                ������������
            </td>
            <td width="85%" align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblJourneyCount" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtFactJourCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                </strong>
            </td>
        </tr>
        <tr>
            <td height="22" align="right">
                �Ƶ�������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblHotelCount" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtFactHotelCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                ��������˾������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblSightCount" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtFactSightCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                ����������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblCarCount" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtFactCarCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                �����������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblShopCount" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtFactShopCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                �û�������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblUserCount" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtUserCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                ����������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblIntemediCount" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtIntemediCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                MQ������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblMQ_Count" runat="server"></asp:Label>
                    &nbsp;��
                    <asp:TextBox ID="txtMQCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                ƽ̨��Ч��·������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblRouteCount" runat="server"></asp:Label>
                    �� ����
                    <asp:TextBox ID="txtCityCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;ȫ��
                    <asp:TextBox ID="txtWorldCount" runat="server" MaxLength="6" Width="64px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
		<tr>
            <td height="18" align="right">
                ƽ̨�˼�������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblFeightCount" runat="server"></asp:Label>
                    �� 
                    <asp:TextBox ID="txtFeightCount" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                �ɹ���������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblBuyers" runat="server"></asp:Label>
                    �� 
                    <asp:TextBox ID="txtBuyersVirtual" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                ��Ӧ��������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblSuppliers" runat="server"></asp:Label>
                    �� 
                    <asp:TextBox ID="txtSuppliersVirtual" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                ��30�칩��������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblSupplyInfos" runat="server"></asp:Label>
                    �� 
                    <asp:TextBox ID="txtSupplyInfosVirtual" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                ����������
            </td>
            <td align="left">
                ʵ�ʣ�<strong><asp:Label ID="lblScenic" runat="server"></asp:Label>
                    �� 
                    <asp:TextBox ID="txtScenicVirtual" runat="server" MaxLength="6" Width="65px"></asp:TextBox>
                    &nbsp;</strong>
            </td>
        </tr>
        <tr>
            <td height="18" align="right">
                &nbsp;
            </td>
            <td align="left">
                <asp:Button ID="btn_Save" runat="server" Text="�ύ" OnClick="btn_Save_Click" />
                <input type="button" id="btnCancel" name="btnCancel"  value="ȡ��" />
            </td>
        </tr>
    </table>
    </form>
    
    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            if ("<%=isManageGrant %>" == "False") {
                $("#btnCancel").hide();
            }
            $("#btnCancel").click(function() {
                $("#<%=txtFactJourCount.ClientID %>").val("");
                $("#<%=txtFactHotelCount.ClientID %>").val("");
                $("#<%=txtFactSightCount.ClientID %>").val("");
                $("#<%=txtFactCarCount.ClientID %>").val("");
                $("#<%=txtFactShopCount.ClientID %>").val("");
                $("#<%=txtCityCount.ClientID %>").val("");
                $("#<%=txtWorldCount.ClientID %>").val("");
                $("#<%=txtUserCount.ClientID %>").val("");
                $("#<%=txtIntemediCount.ClientID %>").val("");
            })
        })
    </script>
    
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScenicPhotos.aspx.cs" Inherits="SiteOperationsCenter.ScenicManage.ScenicPhotos" %>

<%@ Register Src="../usercontrol/SingleFileUpload.ascx" TagName="SingleFileUpload"
    TagPrefix="uc1" %>
<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��������-��Ƭ</title>
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("swfupload") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("swfupload") %>"></script>

    <style>
        #divPicList ul
        {
            width: 100%;
            float: left;
            list-style: none;
            margin: 0;
        }
        #divPicList li
        {
            padding: 3px 7px 3px 7px;
            width: 132px;
            line-height: 25px;
            float: left;
            height: 160px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="98%" border="0" align="center" cellpadding="1" cellspacing="0" class="table_basic">
        <tr>
            <td align="left" valign="top">
                <strong>����ͼƬ�ϴ�</strong>
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                Ϊ�˸���ֱ�۵İѹ�Ƶ���ָ����ˣ����ϴ�������ۡ��Ƶ����ơ����ü��������͵�ͼƬ����������ʩͼƬ���ڡ�������ѡ�����ϴ���
                <br />
                ͼƬҪ�󣺷ֱ��������800��600��500��������������㣩������5M���ڡ�
                <br />
                ͼƬ��ʽ����Ϊjpg��ʽ<br />
                �����ṩ������Ч��ͼ
                <br />
                ͼƬ�ϲ�Ҫ��ˮӡ���ı����ֵ�����
            </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#cccccc"
                    class="lr_hangbg table_basic">
                    <tr>
                        <td width="16%" align="right">
                            ����������
                        </td>
                        <td colspan="2" bgcolor="#FFFFFF">
                            <asp:DropDownList ID="DpScenicArea" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DpScenicArea_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            ����������Ƭ��
                        </td>
                        <td width="63%" bgcolor="#FFFFFF">
                            <table>
                                <tr>
                                    <td>
                                        <uc1:SingleFileUpload ID="SfpScenicimage" runat="server" IsGenerateThumbnail="true" />
                                        <span id="errMsgsfuPhotoImg" class="errmsg"></span>
                                    </td>
                                    <td>
                                        ͼƬ˵��:
                                        <input id="Scenicimagedes" runat="server" type="text" readonly="readonly" />
                                        <asp:Button ID="Btn_Scenicimage" runat="server" Text="�� ��" OnClick="Btn_Scenicimage_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="21%" bgcolor="#FFFFFF">
                            <% if (modelScenicImg1.Address != null)
                               { %>
                            <a href="<%=Utils.GetNewImgUrl(modelScenicImg1.Address,3) %>" target="_blank">
                                <img src="<%=Utils.GetNewImgUrl(modelScenicImg1.Address,3) %>" onerror="this.src='<%=Utils.GetNewImgUrl("",2)%>';"
                                    width="120" height="120" alt="" class="jq_pic" /></a>
                            <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            �������ε�ͼ��
                        </td>
                        <td width="63%" bgcolor="#FFFFFF">
                            <table>
                                <tr>
                                    <td>
                                        <uc1:SingleFileUpload ID="SfpScenicview" runat="server" IsGenerateThumbnail="true" />
                                        <span id="errScenicview" class="errmsg"></span>
                                    </td>
                                    <td>
                                        ͼƬ˵��:
                                        <input id="Scenicviewdes" runat="server" type="text" readonly="readonly" />
                                        <asp:Button ID="Btn_Scenicview" runat="server" Text="�� ��" OnClick="Btn_Scenicview_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="21%" bgcolor="#FFFFFF">
                            <% if (modelScenicImg2.Address != null)
                               { %>
                            <a href="<%=Utils.GetNewImgUrl(modelScenicImg2.Address,3) %>" target="_blank">
                                <img src="<%=Utils.GetNewImgUrl(modelScenicImg2.Address,3) %>" onerror="this.src='<%=Utils.GetNewImgUrl("",2)%>';"
                                    width="120" height="120" alt="" class="jq_pic" /></a>
                            <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2" align="right">
                            ����ͼƬ��
                        </td>
                        <td colspan="2" bgcolor="#FFFFFF">
                            <table>
                                <tr>
                                    <td>
                                        <uc1:SingleFileUpload ID="SfpScenicimages" runat="server"  IsGenerateThumbnail="true" />
                                        <span id="errScenicimages" class="errmsg"></span>
                                    </td>
                                    <td>
                                        ͼƬ˵��:
                                        <input type="text" name="txtDescription" id="txtDescription" runat="server" />
                                        <asp:Button ID="Btn_Scenicimages" runat="server" Text="�� ��" OnClick="Btn_Scenicimages_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" bgcolor="#FFFFFF">
                            <div id="divPicList" style="width: 100%;">
                                <ul>
                                    <asp:Repeater ID="RephotoList" runat="server">
                                        <ItemTemplate>
                                            <li id="li<%# Eval("ImgId") %>" title="<%#Eval("Description") %>"><a href="<%# Utils.GetNewImgUrl(Eval("Address").ToString().Split('|')[0],3) %>"
                                                target="_blank">
                                                <img width="12" height="120" src="<%# Utils.GetNewImgUrl(Eval("Address").ToString().Split('|')[0],3) %>"
                                                    onerror="this.src='<%=Utils.GetNewImgUrl("",2)%>';" class="hotel_pic" /></a>
                                                <div style='width: 130px; text-align: center; height: 20px; line-height: 25px; margin-top: -10px'
                                                    title="<%#Eval("Description") %>">
                                                    <%# Utils.GetText2(Eval("Description").ToString(),7,true) %>
                                                    &nbsp;&nbsp;<a onclick="DelImage('<%# Eval("ImgId") %>')" href="javascript:void(0)">ɾ��</a>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <li></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <%--        <tr>
            <td colspan="2" bgcolor="#FFFFFF" id="<%# Eval("ImgId")  %>">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <asp:Repeater ID="RephotoList" runat="server">
                            <ItemTemplate>
                                <td>
                                    <table border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <img src="<%=Domain.FileSystem%><%# Eval("Address") %>" width="120" height="120"
                                                    alt="" class="jq_pic" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <%#Eval("Description")%>
                                                <a href="#" onclick="DelImage('<%# Eval("ImgId") %>')">ɾ��</a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tr>
                </table>
            </td>
        </tr>--%>
                </table>
            </td>
        </tr>
    </table>
    </form>

    <script type="text/javascript">
        var sfu1 = <%=SfpScenicimage.ClientID %>;//����������Ƭ
        var sfu2 = <%=SfpScenicview.ClientID %>;//������ͼ
        var sfu3 = <%=SfpScenicimages.ClientID %>;//����ͼƬ
        var isSubmit = false;

        $(function() {
        
            //����������Ƭ
            $("#<%=Btn_Scenicimage.ClientID %>").click(function() {
                if (!isSubmit) {
                    if (sfu1.getStats().files_queued <= 0) {
                        $("#errMsgsfuPhotoImg").html("��ѡ��һ��ͼƬ");
                        return false;                        
                    }

                    if (sfu1.getStats().files_queued > 0) {//��ͼƬ
                        sfu1.customSettings.UploadSucessCallback = FormSubmit;
                        sfu1.startUpload();
                        return false;
                    }
                } else {
                    return true;
                }
            });
        });
        
        
        
      $(function(){
            //������ͼ
            $("#<%=Btn_Scenicview.ClientID %>").click(function() {
                if (!isSubmit) {
                    if (sfu2.getStats().files_queued <= 0) {
                        var img = $("#imgpath").attr("href");
                        if (img == undefined || img == "") {
                            $("#errScenicview").html("��ѡ��һ��ͼƬ");
                            return false;
                        }
                    }

                    if (sfu2.getStats().files_queued > 0) {//��ͼƬ
                        sfu2.customSettings.UploadSucessCallback = FormSubmit1;
                        sfu2.startUpload();
                        return false;
                    }
                } else {
                    return true;
                }
            });
        
        })
        
        //��ʼ��ͼƬ˵��
        $(function(){
           $("#Scenicimagedes").val('<%=scenicname %>'+"_����������Ƭ");
           $("#Scenicviewdes").val('<%=scenicname %>'+"_�������ε�ͼ");
        })
        
        
        $(function(){
            //����ͼƬ
            $("#<%=Btn_Scenicimages.ClientID %>").click(function() {
                if (!isSubmit) {
                    if (sfu3.getStats().files_queued <= 0) {
                        var img = $("#imgpath").attr("href");
                        if (img == undefined || img == "") {
                            $("#errScenicimages").html("��ѡ��һ��ͼƬ");
                            return false;
                        }
                    }

                    if (sfu3.getStats().files_queued > 0) {//��ͼƬ
                        sfu3.customSettings.UploadSucessCallback = FormSubmit2;
                        sfu3.startUpload();
                        return false;//����ʹ�첽�������ݣ�ʹform��������ֵ
                    }
                } else {
                    return true;
                }
            });
        
        });

        
        function FormSubmit() {
            isSubmit = true;
            $("#<%=Btn_Scenicimage.ClientID %>").click();
        }
        function FormSubmit1() {
            isSubmit = true;
            $("#<%=Btn_Scenicview.ClientID %>").click();
        }
        function FormSubmit2() {
            isSubmit = true;
            $("#<%=Btn_Scenicimages.ClientID %>").click();
        }
        
        
        //ɾ��ͼƬ
        function DelImage(id)
        {
            if (!confirm("��ȷ��Ҫɾ������������")) {
               return false;
            }
            $.ajax({
             url: "AjaxAll.ashx?type=DelImage&arg="+id,
             cache: false,
             type: "post",
             success: function(result) {
                 if(result=="error")
                 {
                    alert("ɾ��ʧ��");
                 }
                 else{
                    $("#li"+id).html("");
                    alert("ɾ���ɹ�");
                    window.location.reload(true);
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

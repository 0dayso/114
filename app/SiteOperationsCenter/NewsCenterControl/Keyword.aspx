<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Keyword.aspx.cs" Inherits="SiteOperationsCenter.NewsCenterControl.Keyword" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExportPageSet" TagPrefix="cc2" %>
<%@ Import Namespace="EyouSoft.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="<%=CssManage.GetCssFilePath("manager") %>" rel="stylesheet" type="text/css" />
<title>�ؼ��������</title>

</head>

<body>
<form runat="server">
<table width="100%" border="1" cellspacing="0" cellpadding="0" style="border:1px solid #ccc;">
    <tr style="background:#fff; height:24px; text-align:center;">
    <td colspan="6">
        �ؼ��֣�<asp:TextBox ID="txtKeywordName" runat="server"></asp:TextBox>
        URL��<asp:TextBox ID="txtUrlName" runat="server"></asp:TextBox>
      <input type="button" value="����" onclick="serach()" /></td>
  </tr>
  <tr style="background:#C0DEF3; height:28px; text-align:center; font-weight:bold;">
    <td width="19%">���</td>
    <td width="41%">�ؼ�����</td>
    <td width="20%">����</td>
    <td width="20%">����</td>
  </tr>
    <asp:Repeater ID="repList" runat="server" onitemcommand="repList_ItemCommand">
        <ItemTemplate>
            <tr style="background:#fff; height:24px; text-align:center;" class="modifytd"  tid="<%# Eval("ID") %>">
                <td><%# Container.ItemIndex+1 %></td> 
                <td align="center" class="modifytd" c='<%# Eval("ItemUrl") %>' t="k"><%# Eval("ItemName") %></td>
                <td class="modifytd" c='<%# Eval("ItemName") %>' t="u"><%# Eval("ItemUrl") %></td>
                <td>
                <%--<a href="<%# string.Format("javascript:window.location.href='Keyword.aspx?key={0}&url={1}&type=edit&id={2}'",Eval("ItemName"),Eval("ItemUrl"),Eval("ID")) %>">�༭</a>--%>
                <asp:LinkButton ID="lbEdit" CommandName="Edit" CommandArgument='<%# Eval("ID") %>' runat="server">�༭</asp:LinkButton>
                <asp:LinkButton ID="lbDel" CommandName="Del" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('ȷ��Ҫɾ���ùؼ�����?')" runat="server">ɾ��</asp:LinkButton></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr style="background:#fff; height:24px; text-align:center;">
    <td></td>
    <td><asp:TextBox ID="txtKeyword" runat="server" MaxLength="255"></asp:TextBox></td>
    <td><asp:TextBox ID="txtUrl" ImeMode="" runat="server" MaxLength="255"></asp:TextBox></td>
    <td><asp:Button ID="btnAdd" runat="server" Text="����" OnClientClick="return valid()" onclick="btnAdd_Click" /></td>
  </tr>
  <table width="99%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" align="right">
                <cc2:ExportPageInfo ID="ExportPageInfo2" runat="server" />
            </td>
        </tr>
    </table>
</table>
<asp:HiddenField ID="hfID" runat="server" />
</form>
    
</body>
</html>

<script type="text/javascript" src="<%= JsManage.GetJsFilePath("jquery") %>"></script>
<script type="text/javascript" language="javascript">
    function valid(){
        var key = $("#<%= txtKeyword.ClientID %>").val();
        if(key == ""){
            alert("����Ϊ��");
            return false;
        }else{
        return true;
        }
    }
    function serach(){
        var key = $("#txtKeywordName").val();
        var url = $("#txtUrlName").val();
        window.location.href = "Keyword.aspx?key1="+encodeURIComponent(key)+"&url1="+url;
    }
    function GetQueryString(name) {

       var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");

       var r = window.location.search.substr(1).match(reg);

       if (r!=null) return decodeURIComponent((r[2])); return null;
    }
    if(GetQueryString("key1") != null && GetQueryString("key1") != "")
        $("#txtKeywordName").val(GetQueryString("key1"));
    if(GetQueryString("url1") != null && GetQueryString("url1") != "")
        $("#txtUrlName").val(GetQueryString("url1"));
     //�൱����ҳ���е�body��ǩ����onload�¼�  
 $(function(){  
     //�ҵ����е�td�ڵ�  
     var tds=$("td.modifytd");  
     var itemName,itemUrl;
     //�����е�td��ӵ���¼�  
     tds.click(function(){  
         //��õ�ǰ����Ķ���  
         var td=$(this);
         //ȡ����ǰtd���ı����ݱ�������  
         var oldText=td.text();  
         //����һ���ı��������ı����ֵΪ�����ֵ     
         var input=$("<input type='text' class='modifyinput' value='"+oldText+"'/>");   
         //����ǰtd������������Ϊinput  
         td.html(input);  
         //�����ı���ĵ���¼�ʧЧ  
         input.click(function(){  
             return false;  
         });  
         //�����ı������ʽ  
         input.css("border-width","1");                
         input.css("font-size","16px");  
         input.css("text-align","center");  
         //�����ı����ȵ���td�Ŀ��  
         input.width(td.width());  
         //���ı���õ�����ʱ����ȫѡ�¼�    
         input.trigger("focus").trigger("select");   
         //���ı���ʧȥ����ʱ���±�Ϊ�ı�  
         input.blur(function(){  
             var input_blur=$(this);  
             var newText=input_blur.val();   
             var that = $(this);
             var tid = that.parent().parent().attr("tid");
             if(td.attr("t") =="k"){
                itemName = newText;
                itemUrl = td.attr("c");
             }else if(td.attr("t")=="u"){
                itemName = td.attr("c");
                itemUrl = newText;
             }
             $.ajax({
                type: "POST",
                url: "Keyword.aspx?type=upsta",
                data: {tid:tid,k:itemName,u:itemUrl},
                dataType: "json",
                success: function(d) {
                    if(d.msg=="true"){
                        td.html(newText); 
                    }else if(d.msg == "false"){
                        td.html(oldText); 
                        alert("�ؼ����Ѿ�����");
                    }else{
                        td.html(oldText); 
                        alert("����ʧ��");
                    }
                }
             });
             return false;
         });   
//         //��Ӧ�����¼�  
//         input.keyup(function(event){  
//             // ��ȡ��ֵ  
//             var keyEvent=event || window.event;  
//             var key=keyEvent.keyCode;  
//             //��õ�ǰ����  
//             var input_blur=$(this);  
//             switch(key)  
//             {  
//                 case 13://���»س��������浱ǰ�ı��������  
//                     var newText=input_blur.val();   
//                     td.html(newText);   
//                    alert("�س�");
//                 break;  
//                   
//                 case 27://����esc����ȡ���޸ģ����ı������ı�  
//                     td.html(oldText);   
//                 break;  
//             }  
//             alert(newText);
//         });  
     });  
 });  

    
    
</script>   
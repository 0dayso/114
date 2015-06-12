<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentOrderList.aspx.cs" Inherits="UserPublicCenter.AirTickets.OrderManage.CurrentOrderList" MasterPageFile="~/MasterPage/AirTicket.Master"%>


<%@ MasterType VirtualPath="~/MasterPage/AirTicket.Master" %>
<%@ Import Namespace="EyouSoft.Common" %>
<asp:Content ContentPlaceHolderID="c1" ID="cntOrderManage" runat="server">
<style type="text/css">
/*FENYE*/
DIV.digg {	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; MARGIN: 3px; margin-top:10px; PADDING-TOP: 3px; TEXT-ALIGN: center
}
DIV.digg A {	BORDER: #54A11C 1px solid; PADDING-RIGHT: 5px;PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px;  COLOR: #54A11C; PADDING-TOP: 2px;TEXT-DECORATION: none
}
DIV.digg A:hover {	BORDER: #54A11C 1px solid; background:#54A11C; COLOR: #fff;}
DIV.digg A:active {	BORDER: #54A11C 1px solid;  COLOR: #000; }
DIV.digg SPAN.current {	BORDER: #54A11C 1px solid; PADDING-RIGHT: 5px;PADDING-LEFT: 5px; FONT-WEIGHT: bold; PADDING-BOTTOM: 2px; MARGIN: 2px; COLOR: #fff; PADDING-TOP: 2px; BACKGROUND-COLOR: #54A11C}
DIV.digg SPAN.disabled {	BORDER: #eee 1px solid; PADDING-RIGHT: 5px;  PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; MARGIN: 2px;  COLOR: #ddd; PADDING-TOP: 2px;}/*end*/
</style>
    <script type="text/javascript" src="/DatePicker/WdatePicker.js"></script>    
    <div class="sidebar02_con">
	<!--sidebar02_con_table01 start-->
   	  <div class="sidebar02_con_table01">

<table cellspacing="0" cellpadding="0" border="0" bgcolor="#fafafa" width="100%" style="border: 1px solid rgb(204, 204, 204);">
  <tbody><tr>
                <td height="5" align="left" colspan="5"></td>
          </tr>
              <tr>
                <td height="30" align="left" colspan="4" id="tdSelct1"><strong>ѡ���ѯ���ͣ�</strong>
                  <input name="rdoSelectType" id="rdoPnr" value="1" checked="checked" type="radio"/>
                    <strong><label for="rdoPnr">PNR��¼���</label> </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                  <input name="rdoSelectType" id="rdoPassengerName" value="2" type="radio"/>
                    <strong><label for="rdoPassengerName">�˿�����</label> </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="rdoSelectType" id="rdoOrderNum" value="3" type="radio"/>
                    <strong><label for="rdoOrderNum">������� </label> </strong>
                    </td>
                      <td align="left" width="24%"  rowspan="3" ><font color="#ff0000">
                           ��ע��<%=NowDate %>ǰ��ѯ���������ʷ������ѯ   ��������ϵ�ͷ�����С��  ��ϵ�绰��0571-56893761 MQ:27440 ������ϵ�绰:15356126700</font></td>
              </tr>
              <tr>
                <td height="40" align="left" width="10%"><b> <label id="lblSelectText">PNR���:</label></b></td>
                <td align="left" width="20%"><input name="txtContent" id="txtContent" type="text" /></td>
                <td align="left" width="10%"><b>ѡ�����ڣ�</b></td>
                <td align="left" width="20%"><input name="DatePicker1" id="DatePicker1" type="text" onfocus="WdatePicker()"/>
                      <img alt="" style="position: relative; left: -24px; top: 3px;" src="<%=ImageServerPath %>/images/jipiao/time.gif" width="16" height="13" onclick="javascript:$('#DatePicker1').focus()" /></td>
              
              </tr>
              <tr>
                <td height="30" align="left" colspan="2"><strong>����״̬��</strong>
                <select name="sltOrderState" id="sltOrderState" runat="server" onchange="CurrentOrderList.OrdChangTypeControl()">
                      </select>
                      <select name="sltOrdChangetype" id="sltOrdChangetype" runat="server" >
                      </select>
                      <input type="hidden" id="hidchangeType"  runat="server"/>
					  <a href="/PlaneInfo/PlaneListPage.aspx?url=/Order/CS_airQuery.asp?ftype=today" target=_blank><img alt="ɢ�Ͷ�����ѯ" style="cursor:pointer" src="<%=ImageServerPath %>/images/jipiao/btnsanke.jpg"/></a>
                </td>
                <td align="left" width="20%" colspan="2" ><img alt="��ѯ" id="imgSelectByDate" style="cursor:pointer" src="<%=ImageServerPath %>/images/jipiao/btntuandui.jpg"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="HistoryOrder.aspx"><img alt="��ʷ������ѯ" style="cursor:pointer" src="<%=ImageServerPath %>/images/jipiao/btnistory.jpg"/></a></td>
              </tr>
              <tr>
                <td height="10" colspan="5"></td>
              </tr>
  	    </tbody></table>
   
      </div>
      <!--sidebar02_con_table01 end-->
      <!--sidebar02_con_table02 start-->
      <div class="sidebar02_con_table02" id="divOrderList">      		
      </div>
      <!--sidebar02_con_table02 end-->
       </div>       
    <!-- sidebar02_con end-->
<script type="text/javascript" src="<%=JsManage.GetJsFilePath("Load") %>"></script>  
<script type="text/javascript">
var parms={TypeName:"",Content:"",Date:"",State:"",ChangeState:"",Page:1};
CurrentOrderList={
     GetOrderList:function(){  //��ȡ�б�
        LoadingImg.stringPort = "<%=EyouSoft.Common.Domain.ServerComponents %>";
        LoadingImg.ShowLoading("divOrderList");
        if(LoadingImg.IsLoadAddDataToDiv("divOrderList")) {
           $.ajax({
                type: "GET",
                dataType: 'html',
                url:"/AirTickets/OrderManage/AjaxCurrentOrderList.aspx",
                data:parms,
                cache: false,
                success:function(html)
                {
                    $("#divOrderList").html(html);
                },
                error:function()
                {
                    $("#divOrderList").html("δ�ܳɹ���ȡ��Ӧ���");
                }
           });
        }
    },
    LoadData: function(obj) {//��ҳ
        var Page = exporpage.getgotopage(obj);
        parms.Page = Page;
        this.GetOrderList();
    },
    CancelOrder:function(ordId){
        if( confirm("�Ƿ�ȡ��ȡ���ö�����"))
        {
            $.ajax({
                type:"get",
                async:false,
                dataType: "json",
                cache:false,
                url:"/AirTickets/OrderManage/CurrentOrderList.aspx?CancelOrder=true&OrderId="+ordId,
                success:function(msg){
                    if(msg.success=="1"){
                        alert (msg.message);
                        CurrentOrderList.GetOrderList();
                    }else{
                        alert(msg.message);
                    }
                },
                error:function(){
                    alert("����ʧ�ܣ�");
                }
            });
        }
    },
   OrdChangTypeControl:function(){      //���ݶ���״̬������ʾ�ؼ�
        var stateval= $("#<%=sltOrderState.ClientID %>").val();
        var arrtype;
        var changtype=$("#<%= hidchangeType.ClientID%>").val();
         if(changtype.indexOf(",")>0){
            arrtype= changtype.split(','); 
             for(var i=0;i<arrtype.length-1;i++){
                if(stateval==arrtype[i]){
                    $('select[id=<%=sltOrdChangetype.ClientID%>] option').each(function(){
                        if($(this).val()!="0"){
                            $(this).text(stateval+$(this).val()); 
                        }
                    });
                    $("#<%=sltOrdChangetype.ClientID %>").show();
                    break;
                }else{
                     $("#<%=sltOrdChangetype.ClientID %>").hide();
                     $("#<%=sltOrdChangetype.ClientID %>").val("0");
                }
             } 
         }
    }
}
$(document).ready(function() {
    CurrentOrderList.GetOrderList();           //��ȡ�б���Ϣ
    CurrentOrderList.OrdChangTypeControl();    //����״̬�ؼ�����
    $("#tdSelct1").find("input[type='radio'][name='rdoSelectType']").each(function() {
        $(this).bind("click", function() {
            var type = $(this).val();
            $("#txtContent").val("");
            if (type == 2) {         //�˿�����
                $("#lblSelectText").html("�˿�������");
            } else if (type == 3) {   //������Ų�ѯ
                $("#lblSelectText").html("������ţ�");
            } else {               //prn��ѯ
                $("#lblSelectText").html("PNR��ţ�");
            }
        });
    });
    $("#imgSelectByDate").click(function() {    //�������� ��ѯ
        //��ѯ
        var type;
        $("#tdSelct1").find("input[type='radio'][name='rdoSelectType']:checked").each(function() {
            type = $(this).val();
        });
        var orderdate = $("#DatePicker1").val();  //����
        var stateval = $("#<%=sltOrderState.ClientID %>").val();  //����״̬һ��        
        var arrtype;
        var changtype = $("#<%= hidchangeType.ClientID%>").val(); //����״̬����     
        if (stateval == "0") {
            parms.State = "";
            parms.ChangeState = "";
        } else {
            if (changtype.indexOf(",") > 0) {
                arrtype = changtype.split(',');
                parms.State = stateval;
                for (var i = 0; i < arrtype.length - 1; i++) {
                    if (stateval == arrtype[i] && $("#<%=sltOrdChangetype.ClientID%>").css("display") != "none") {
                        var changestate = $("#<%=sltOrdChangetype.ClientID%>").val();    //�������״̬
                        if (changestate == 0) {
                            alert("��ѡ�񶩵�״̬");
                            return;
                        }
                        parms.ChangeState = changestate;
                        break;
                    }
                }
            }
        }
        parms.Date = orderdate;
        parms.Page = 1;
        parms.TypeName = type;  //���ִ�������
        parms.Content = $.trim($("#txtContent").val());  //��ѡ��ť��ѯ����ֵ
        CurrentOrderList.GetOrderList();
    });
    $("#txtContent").bind("keypress", function(e) {
        if (e.keyCode == 13) {
            $("#imgSelectByType").click();
            return false;
        }
    });

});
</script>
</asp:Content>

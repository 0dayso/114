<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SeniorOnlineShop._Default"
    MasterPageFile="~/master/SeniorShop.Master" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Assembly="ControlLibrary" Namespace="ControlLibrary" TagPrefix="cc1" %>
<%@ MasterType VirtualPath="~/master/SeniorShop.Master" %>
<asp:Content ID="c1" runat="server" ContentPlaceHolderID="c1">
    <div class="fouse">

        <script type="text/javascript">
var pic_width=385; //ͼƬ���
var pic_height=170; //ͼƬ�߶�
var button_pos=4; //��Ťλ�� 1�� 2�� 3�� 4��
var stop_time=3000; //ͼƬͣ��ʱ��(1000Ϊ1����)
var show_text=1; //�Ƿ���ʾ���ֱ�ǩ 1��ʾ 0����ʾ
var txtcolor="000000"; //����ɫ
var bgcolor="DDDDDD"; //����ɫ

var imag=new Array();
var link=new Array();
var text=new Array();
<%=initFlashJs %>
//imag[1]="<%=ImageServerUrl %>/images/seniorshop/01.jpg";
//link[1]="http://www.lanrentuku.com/";
//text[1]="���� 1";
//imag[2]="<%=ImageServerUrl %>/images/seniorshop/02.jpg";
//link[2]="http://www.lanrentuku.com/";
//text[2]="���� 21";
//imag[3]="<%=ImageServerUrl %>/images/seniorshop/03.jpg";
//link[3]="http://www.lanrentuku.com/";
//text[3]="���� 3";
//imag[4]="<%=ImageServerUrl %>/images/seniorshop/04.jpg";
//link[4]="http://www.lanrentuku.com/";
//text[4]="���� 4";
//imag[5]="<%=ImageServerUrl %>/images/seniorshop/05.jpg";
//link[2]="http://www.lanrentuku.com/";
//text[5]="���� 5";
//�ɱ༭���ݽ���
var swf_height=show_text==1?pic_height+20:pic_height;
var pics="", links="", texts="";
for(var i=1; i<imag.length; i++){
	pics=pics+("|"+imag[i]);
	links=links+("|"+link[i]);
	texts=texts+("|"+text[i]);
}
pics=pics.substring(1);
links=links.substring(1);
texts=texts.substring(1);
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cabversion=6,0,0,0" width="'+ pic_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="<%=ImageServerUrl %>/images/seniorshop/focus.swf">');
document.write('<param name="quality" value="high"><param name="wmode" value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'">');
document.write('<embed src="<%=ImageServerUrl %>/images/seniorshop/focus.swf" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'" quality="high" width="'+ pic_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
document.write('</object>');
        </script>

    </div>
    <div class="newsleft">
        <div class="newsleftbar">
            <span>�������ζ�̬</span><a runat="server" id="linkNewsList" href="">����&gt;&gt;</a></div>
        <ul style="height: 148px;">
            <cc1:CustomRepeater ID="rptNewsList" runat="server" EmptyText="<li>�����������ζ�̬</li>"
                OnItemCreated="rptNewsList_ItemCreated">
                <ItemTemplate>
                    <li>��<a id="linkNew" runat="server" class="huizi"></a></li>
                </ItemTemplate>
            </cc1:CustomRepeater>
        </ul>
    </div>
    <div class="clear">
    </div>
    <div class="bar-line">
        <div class="bar-line-title">
            �ҵ�������·</div>
        <div class="bar-line-mid" style="padding-left: 10px;">
            <input type="radio" name="radlinkCity" value="0" />
            <a href="<%=EyouSoft.Common.Utils.GenerateShopPageUrl2("/TourList",Master.CompanyId) %>"
                style="color: Black">ȫ��</a>
            <asp:Repeater ID="rptCitys" runat="server" OnItemCreated="rptCitys_ItemCreated">
                <ItemTemplate>
                    <input type="radio" name="radlinkCity" id="City_<%# Eval("CityId") %>" value="<%# Eval("CityId") %>" />
                    <label for="City_<%# Eval("CityId") %>">
                        <a id="linkCity" runat="server" style="color: Black"></a>
                    </label>
                </ItemTemplate>
            </asp:Repeater>
            &nbsp
            <asp:DropDownList ID="ddlCitys" runat="server">
            </asp:DropDownList>
        </div>
        <div class="bar-line-more">
            <a href="<%=EyouSoft.Common.Utils.GenerateShopPageUrl2("/TourList",Master.CompanyId) %>">
                �鿴ȫ��������·</a></div>
    </div>
    <table class="liststyle" border="1" bordercolor="#e3e3e3" cellpadding="0" cellspacing="0"
        width="100%">
        <thead>
            <tr>
                <th width="10%" align="center">
                    ����
                </th>
                <th width="45%" align="center">
                    �Ŷӻ�����Ϣ
                </th>
                <th width="19%" align="center">
                    ���
                </th>
                <th width="19%" align="center">
                    �г���
                </th>
                <th width="9%" align="center">
                    ����
                </th>
            </tr>
        </thead>
        <tbody>
            <cc1:CustomRepeater ID="rptTourList" runat="server" OnItemCreated="rptTourListItemCreated">
                <ItemTemplate>
                    <tr class="odd">
                        <td align="center">
                            <asp:Literal ID="ltrDanFangCha" runat="server"></asp:Literal>
                        </td>
                        <td align="left">
                            <div class="listtitle">
                                <img src="<%=ImageServerUrl %>/images/seniorshop/ico.gif" height="11" width="11"
                                    alt="" />
                                <asp:Literal ID="ltrTuiGuang" runat="server"></asp:Literal>
                                <a id="linkTour" runat="server" target="_blank">
                                    <asp:Literal ID="LitRouteName" runat="server"></asp:Literal>
                                </a>
                            </div>
                        </td>
                        <td align="center">
                            <asp:Literal ID="ltrCurrentTour" runat="server"></asp:Literal>
                        </td>
                        <td align="center">
                            <asp:Literal ID="ltrPrices" runat="server"></asp:Literal>
                        </td>
                        <td align="center" width="80">
                            <%#GetOrderByRoute(Eval("RouteId").ToString(), Eval("RouteSource"))%><br />
                            <asp:Literal ID="linkMQ" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </ItemTemplate>
            </cc1:CustomRepeater>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="5" align="center" style="margin-top: 75px; margin-bottom: 75px">
                    <asp:Label ID="labShowMsg" runat="server"></asp:Label>
                </th>
            </tr>
        </tfoot>
    </table>
    <div class="mudidikuang">
        <div class="mudidi">
            <div class="mudizi">
                Ŀ�ĵ�ָ��</div>
        </div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 158px;">
            <tbody>
                <tr>
                    <td valign="top" width="33%">
                        <table class="maintop5" style="margin-left: 5px;" border="0" cellpadding="0" cellspacing="0"
                            width="100%">
                            <tbody>
                                <tr>
                                    <td class="muhang">
                                        <strong>�����������</strong><span><a id="linkMuDiDi1" runat="server">����&gt;&gt;</a></span>
                                    </td>
                                </tr>
                                <cc1:CustomRepeater ID="rptTrip1" runat="server" OnItemCreated="rptTrip1_ItemCreated">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Literal ID="ltrTrip" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </cc1:CustomRepeater>
                            </tbody>
                        </table>
                    </td>
                    <td valign="top" width="33%">
                        <table class="maintop5" style="margin-left: 5px;" border="0" cellpadding="0" cellspacing="0"
                            width="100%">
                            <tbody>
                                <tr>
                                    <td class="muhang">
                                        <strong>��ܰ����</strong><span><a id="linkMuDiDi2" runat="server">����&gt;&gt;</a></span>
                                    </td>
                                </tr>
                                <cc1:CustomRepeater ID="rptTrip2" runat="server" OnItemCreated="rptTrip1_ItemCreated">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Literal ID="ltrTrip" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </cc1:CustomRepeater>
                            </tbody>
                        </table>
                    </td>
                    <td valign="top" width="34%">
                        <table class="maintop5" style="margin-left: 5px;" border="0" cellpadding="0" cellspacing="0"
                            width="100%">
                            <tbody>
                                <tr>
                                    <td class="muhang">
                                        <strong>�ۺϽ���</strong><span><a id="linkMuDiDi3" runat="server">����&gt;&gt;</a></span>
                                    </td>
                                </tr>
                                <cc1:CustomRepeater ID="rptTrip3" runat="server" OnItemCreated="rptTrip3_ItemCreated">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                ��<a id="linkTrip" runat="server" class="huizi"></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </cc1:CustomRepeater>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="mudidikuang">
        <div class="mudidi">
            <div class="mudizi">
                ������Դ�Ƽ�</div>
            <span class="STYLE1" style="padding-left: 480px;"><a href="" id="linkZiYuans" runat="server"
                class="white">����&gt;&gt;</a></span></div>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 122px;">
            <tbody>
                <tr>
                    <cc1:CustomRepeater ID="rptziyuans" runat="server" EmptyText="<td align='center'>����������Դ�Ƽ�</td>"
                        OnItemCreated="rptziyuans_ItemCreated">
                        <ItemTemplate>
                            <td width="33%">
                                <table style="margin: 10px 5px;" border="0" cellpadding="0" cellspacing="0" width="125">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <a id="linkZiYuanShow1" runat="server"></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <a id="linkZiYuanShow2" runat="server"></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </ItemTemplate>
                    </cc1:CustomRepeater>
                </tr>
            </tbody>
        </table>
    </div>
    <%--������ѯ��ʼ--%>
    <div id="divZX" style="display: none; z-index: 99999;">
        <table height="140" cellspacing="0" cellpadding="0" border="0" background="<%= Domain.ServerComponents %>/images/seniorshop/zixunbg.gif"
            width="400">
            <tbody>
                <tr>
                    <td height="5" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td height="30" align="left" valign="top" colspan="2">
                        &nbsp;&nbsp;���ã�<asp:Label runat="server" ID="lbCompanyName"></asp:Label>�߳�Ϊ������
                    </td>
                </tr>
                <tr>
                    <td valign="middle" colspan="2">
                        <asp:Label runat="server" Text="��ӭ��,��ʲô���԰���������" ID="lbGuestInfo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <a href="/OlServer/Default.aspx?cid=<%= this.Master.CompanyId %>" target="blank">
                            <img border="0" src="<%= Domain.ServerComponents %>/images/seniorshop/jieshou.gif"></a>
                    </td>
                    <td align="left">
                        <a href="javascript:;" onclick="CloseLeft();">
                            <img border="0" src="<%= Domain.ServerComponents %>/images/seniorshop/hulue.gif"></a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <%--������ѯ����--%>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery.floating.js") %>"></script>

    <script type="text/javascript" src="<%=EyouSoft.Common.JsManage.GetJsFilePath("TourCalendar") %>"></script>

    <script type="text/javascript" src="<%=EyouSoft.Common.JsManage.GetJsFilePath("MouseFollow") %>"></script>

    <link href="<%=CssManage.GetCssFilePath("boxy") %>" rel="stylesheet" type="text/css" />
    <link href="<%= EyouSoft.Common.CssManage.GetCssFilePath("boxy2011") %>" rel="Stylesheet"
        type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <script type="text/javascript">
        //Ԥ����ť���õķ��� ģ����ID���������
        function ClickCalendar(TourId,obj,AreaType) {
            SingleCalendar.config.isLogin = "<%=IsLogin %>"; //�Ƿ��½
            SingleCalendar.config.stringPort ="<%= EyouSoft.Common.Domain.UserPublicCenter %>";//����
            SingleCalendar.initCalendar({
                currentDate:<%=thisDate %>,//��ʱ��
                firstMonthDate: <%=thisDate %>,//��ʱ��
                srcElement: obj,
                areatype:AreaType,//��ǰģ������·�������� 
                TourId:TourId,//ģ����ID
                AddOrder:AddOrder
            });
        }
        
        function AddOrder(TourId) {
            if ("<%=IsLogin %>" == "True") {
                var strParms = { TourId: TourId };
                Boxy.iframeDialog({ title: "Ԥ��", iframeUrl: "/seniorshop/RouteOrder.aspx", width: "800", height: GetAddOrderHeight(), draggable: true, data: strParms });
            } else {
                //��¼
                window.location.href = '<%= EyouSoft.Common.Domain.UserPublicCenter %>/Register/Login.aspx?isShow=1&CityId=<%=CityId %>&returnurl=' + escape('<%= EyouSoft.Common.Domain.SeniorOnlineShop %><%=Request.ServerVariables["SCRIPT_NAME"]%>?<%=Request.QueryString%>');
            }
        }

        function goTourListByCity(city) {
            window.location.href = '<%=EyouSoft.Common.Utils.GenerateShopPageUrl2("/TourList_' + city + '",Master.CompanyId) %>';
        }
        $(function() {
            $(".liststyle a[rel='calendar']").click(function() {
                var o = $(this);
                ClickCalendar(o.attr("pid"), this, parseInt(o.attr("areatype")));
                return false;
            });
            $("#<%=ddlCitys.ClientID %>").change(function() {
                goTourListByCity($(this).val());
            });
            $("#divZX").easydrag();
            $("#divZX").floating({ position: "left", top: 100, left: 10, width: 400 });

            $("input[type='radio'][name='radlinkCity']").bind("click", function() {
                $("input[type='radio'][name='radlinkCity']:checked").each(function() {
                    if ($(this).val() == "0") {
                        window.location.href = '<%=EyouSoft.Common.Utils.GenerateShopPageUrl2("/TourList",Master.CompanyId) %>';
                    }
                    else {
                        window.location.href = '<%=EyouSoft.Common.Utils.GenerateShopPageUrl2("/TourList_' + $(this).val() + '",Master.CompanyId) %>';
                    }
                });
            });

            $(".goumai0").click(function() {
                if ("<%=IsLogin %>" == "False") {
                    Boxy.iframeDialog({ title: "���ϵ�¼ͬҵ114", iframeUrl: "<%=GetLoginUrl() %>", width: "400px", height: "250px", modal: true });  
          return false;
                }
              
            });
        });
    </script>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/PublicCenterMasterPage.Master"
    AutoEventWireup="true" CodeBehind="NewScenicDetails.aspx.cs" Inherits="UserPublicCenter.ScenicManage.NewScenicDetails"
    EnableEventValidation="false" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../WebControl/ProvinceAndCityList.ascx" TagName="ProvinceAndCityList"
    TagPrefix="uc1" %>
<%@ Register Src="ViewRightControl.ascx" TagName="ViewRightControl" TagPrefix="uc2" %>
<%@ Register Src="TicketsControl.ascx" TagName="NewTicketsControl" TagPrefix="uc3" %>
<%@ Register Src="~/WebControl/CityAndMenu.ascx" TagName="CityAndMenu" TagPrefix="uc4" %>
<%@ Register Src="GoogleMapControl.ascx" TagName="GoogleMapControl" TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <style type="text/css">
        #map_canvas
        {
            width: 708px;
            height: 415px;
            border: 1px solid gray;
        }
    </style>
    <%--            width: 708px;
            height: 415px;--%>
    <link href="<%=CssManage.GetCssFilePath("head2011") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("gouwu") %>" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("toplist") %>"></script>

    <script language="javascript" type="text/javascript">
        function pucker_show(name, no, hiddenclassname, showclassname, count) {
            for (var i = 1; i < count + 1; i++) {
                document.getElementById(name + i).className = hiddenclassname;
            }
            document.getElementById(name + no).className = showclassname;
        }
        function pucker_show1(name, no, hiddenclassname, showclassname, count) {
            for (var i = 1; i < count + 1; i++) {
                document.getElementById(name + i).className = hiddenclassname;
            }
            document.getElementById(name + no).className = showclassname;
        }
        $(function() {
            $(".gouwucp_xin").hover(function() { $(this).addClass("hover") }, function() {
                $(this).removeClass("hover")
            });
        });
    </script>

    <script type="text/javascript">
/*ҳ��---Tabѡ�---Ч��*/
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con_"+name+"_"+i);
menu.className=i==cursel?"hover":"";
con.style.display=i==cursel?"block":"none";
}
}
    </script>

    <link href="<%=CssManage.GetCssFilePath("body") %>" rel="stylesheet" type="text/css" />
    <uc4:CityAndMenu ID="CityAndMenu1" runat="server" />
    <div class="boxbanner">
        <asp:Literal ID="litImgBoxBannerSecond" runat="server"></asp:Literal></div>
    <table width="970" border="0" align="center" cellpadding="0" cellspacing="0" class="maintop15">
        <tr>
            <td width="220" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" class="gwright_xin">
                            <div class="gwrhang_xin">
                                ��������</div>
                            <table width="204" border="0" cellspacing="0" cellpadding="0" style="margin-left: 8px;
                                margin-top: 5px;" id="searchTable">
                                <tr>
                                    <td width="62" height="25">
                                        �������֣�
                                    </td>
                                    <td width="142">
                                        <input name="txtScenicName" id="txtScenicName" type="text" style="height: 18px; width: 140px;
                                            color: #999; border: 1px solid #ccc;" value="������ؼ���" onfocus="$(this).css('color', 'black');if(this.value == '������ؼ���') {this.value = '';}"
                                            onblur="if (this.value == '') {$(this).css('color', '#999');this.value = '������ؼ���';}" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="25">
                                        ��������
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddl_ProvinceList" runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddl_CityList" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="30">
                                        &nbsp;
                                    </td>
                                    <td align="center" valign="middle">
                                        <img src="<%=ImageManage.GetImagerServerUrl(1) %>/images/UserPublicCenter/susoss_03.jpg"
                                            width="59" height="20" alt="" id="SearchImage" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="maintop10">
                    <tr>
                        <td class="gwright2">
                            <div class="gwrhang_xin">
                                �ؼ���Ʊ</div>
                            <uc3:NewTicketsControl ID="NewTicketsControl1" runat="server" />
                        </td>
                    </tr>
                </table>
                <uc2:ViewRightControl ID="ViewRightControl1" runat="server" />
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="maintop10" style="display:none;">
                    <tr>
                        <td align="left" class="gwright_xin">
                            <div class="gwrhang_xin">
                                �����Ƶ�</div>
                            <div class="gwrnei">
                                <ul>
                                    <li><a href="#">������Ұ���з羰��</a></li>
                                    <li><a href="#">�����ݰ���Դ�羰�����ο������޹�</a></li>
                                    <li><a href="#">����ˮ��걽�Ư�����޹�˾</a></li>
                                    <li><a href="#">������Ұ���з羰��</a></li>
                                    <li><a href="#">�����ݰ���Դ�羰�����ο������޹�</a></li>
                                    <li><a href="#">����ˮ��걽�Ư�����޹�˾</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="maintop10" style="display:none;">
                    <tr>
                        <td align="left" class="gwright_xin">
                            <div class="gwrhang_xin">
                                Ŀ�ĵ���·</div>
                            <div class="gwrnei">
                                <ul>
                                    <li><a href="#">������Ұ���з羰��</a></li>
                                    <li><a href="#">�����ݰ���Դ�羰�����ο������޹�</a></li>
                                    <li><a href="#">����ˮ��걽�Ư�����޹�˾</a></li>
                                    <li><a href="#">������Ұ���з羰��</a></li>
                                    <li><a href="#">�����ݰ���Դ�羰�����ο������޹�</a></li>
                                    <li><a href="#">����ˮ��걽�Ư�����޹�˾</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="15">
                &nbsp;
            </td>
            <td width="735" valign="top">
                <div class="content">
                    <div class="jieshao">
                        <div class="jieshaotop" title="<%=ScenicModel.ScenicName %>">
                            <%=Utils.GetText2(ScenicModel.ScenicName,20,true)%>
                        </div>
                        <div class="jieshaoimg">
                        <a href="<%=Utils.GetNewImgUrl(result!=""?result.Split('$')[1]:"",3) %>" target="_blank" title="<%=result!=""?result.Split('$')[2]:"����" %>">
                            <img src="<%=Utils.GetNewImgUrl(result!=""?result.Split('$')[0]:"",3) %>" width="250" height="190"  onerror="this.src='<%=Utils.GetNewImgUrl("",2)%>';"/>
                        </a>
                        </div>
                        <ul>
                            <li><span class="a3a3a">��������:</span><%=ScenicModel.ProvinceName %>
                                <%=ScenicModel.CityName %>
                                <%=ScenicModel.CountyName %></li>
                            <li title="<%= GetThemeName(ScenicModel.ThemeId)%>"><span class="a3a3a">�������:</span><span
                                class="zhutifl">
                                <%=Utils.GetText2(GetThemeName(ScenicModel.ThemeId),25,true)%>
                            </span></li>
                            <li title="<%=ScenicModel.Telephone+"  "+GetContactName(ScenicModel.ContactOperator)%>">
                                <span class="a3a3a">�ͷ��绰:</span><%=Utils.GetText2(ScenicModel.Telephone,13,true) %>
                                <%=Utils.GetText2(GetContactName(ScenicModel.ContactOperator),10,true)%></li>
                            <li><span class="a3a3a">����˾:</span>
                                <%=GetRe(ScenicModel.Company == null ? "" : ScenicModel.Company.ID)%></li>
                            <li title="<%=ScenicModel.CnAddress %>"><span class="a3a3a">������ַ:</span><%=Utils.GetText2(ScenicModel.CnAddress,20,true)%></li>
                            <li><span class="a3a3a">�����ȼ�:</span><%=ScenicModel.ScenicLevel!=0?Enum.Format(typeof(EyouSoft.Model.ScenicStructure.ScenicLevel), ScenicModel.ScenicLevel, "G"):"���޵ȼ�"%></li>
                            <li title="<%=ScenicModel.OpenTime %>"><span class="a3a3a">����ʱ��:</span><%=Utils.GetText2(ScenicModel.OpenTime,20,true)%></li>
                        </ul>
                    </div>
                    <div class="lianxi_biao">
                        <ul class="lianxi_di1">
                            <li>Ʊ��</li>
                            <li>Ʊ��ʱ��</li>
                            <li>���м�</li>
                        </ul>
                        <% if (ScenicModel.TicketsList != null)
                           {%>
                        <%foreach (var item in ScenicModel.TicketsList)
                          {%>
                        <ul class="lianxi_di2">
                            <li>
                                <%=item.TypeName %></li>
                            <li>
                                <%=GetGoodTime(item.StartTime,item.EndTime) %>
                                <%--<%=Convert.ToDateTime(item.StartTime).ToShortDateString() %>--<%=Convert.ToDateTime(item.EndTime).ToShortDateString()%>--%></li>
                            <li>
                                <%=string.Format("{0:C0}", item.RetailPrice)%></li>
                        </ul>
                        <%} %>
                        <%} %>
                    </div>
                    <div class="faq">
                        <div class="faq-title">
                            <ul class="clearfix">
                                <li><a class="hover" onclick="setTab('faq',1,4)" id="faq1">��������</a></li>
                                <li><a onclick="setTab('faq',2,4);initialize();" id="faq2">��ͼ��Ϣ</a></li>
                                <li><a onclick="setTab('faq',3,4)" id="faq3">��ͼ����</a></li>
                                <li><a onclick="setTab('faq',4,4)" id="faq4">�ܱ���ʩ</a></li>
                            </ul>
                        </div>
                        <div class="faq-main">
                            <div id="con_faq_1">
                                <%=ScenicModel.Description %>
                            </div>
                            <div id="con_faq_2" style="display: none;">
                                <div class="jqxxdz">
                                    <strong>������ϸ��ַ��</strong><%=ScenicModel.CnAddress %></div>
                                <div>
                                    <div id="map_canvas">
                                        load...
                                    </div>
                                    <%--<iframe src="ScenicMap.aspx?X=<%=ScenicModel.X %>&Y=<%=ScenicModel.Y %>&ScenicName=<%=ScenicModel.ScenicName %>"
                                        width="708px" height="415px" scrolling="no"></iframe>--%>
                                    <%-- <uc5:GoogleMapControl ID="GoogleMapControl1" runat="server"/>--%>
                                </div>
                            </div>
                            <div id="con_faq_3" style="display: none;">
                                <ul class="ScenicSpotPic">
                                    <% if (ScenicModel.Img != null)
                                       { %>
                                    <%for (int i = 0; i < ScenicModel.Img.Count; i++)
                                      { %>
                                    <% if (i < 11)
                                       {%>
                                    <li><a href="<%=Utils.GetNewImgUrl(ScenicModel.Img[i].Address,3) %>" target="_blank">
                                        <img src="<%=Utils.GetNewImgUrl(ScenicModel.Img[i].ThumbAddress,3) %>" onerror="this.src='<%=Utils.GetNewImgUrl("",2)%>';"
                                            width="186" height="140" /><br>
                                        <%=Utils.GetText2(ScenicModel.Img[i].Description, 15,true)%></a></li>
                                    <%} %><%} %>
                                    <%} %>
                                </ul>
                            </div>
                            <div id="con_faq_4" style="display: none; text-align: left;">
                                <%=ScenicModel.Facilities %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
            </td>
        </tr>
    </table>
    <div class="clear">
    </div>
    <div class="hr_10">
    </div>

    <script type="text/javascript" src="http://ditu.google.com/maps?file=api&amp;v=2&amp;key=<%=GoogleMapKey %>"></script>

    <script type="text/javascript">
    
    var IsLoad = false;
    /**
    * ������ͼ�ؼ�
    */
    function initialize() {
        if(IsLoad)
        {
            return;
        }
        if (GBrowserIsCompatible()) {
            document.getElementById('map_canvas').innerHTML="";
            map = new GMap2(document.getElementById('map_canvas'));
            // ����ͼ��λ����ǰ��γ��<%=_Longitude %>, <%=_Latitude %> ||<%=_Latitude %>,<%=_Longitude %>
            map.setCenter(new GLatLng(<%=_Latitude %>,<%=_Longitude %>), 13);

            var ico = new GIcon(G_DEFAULT_ICON, 'http://localhost:30001/scenicspots/T1/images/googleMapRed.png');
            var targetPt = new GLatLng(<%=_Latitude %>,<%=_Longitude %>);
            var marker = new GMarker(targetPt, { icon: new GIcon(ico) });
            if (true)
            {
                marker.openInfoWindow(createInfoWindow());
            }
            // ƽ�Ƽ����ſؼ������Ͻǣ�������ͼ�ؼ������½ǣ�
            if(true)
            {
                map.addControl(new GLargeMapControl());
            }
            if(true)
            {
                map.addControl(new GOverviewMapControl());
            }
            //�������������ŵ�ͼ
            map.enableScrollWheelZoom();
            // Ϊ��ע����¼���������������עʱҪ��ʾ���ݴ��� 
	        GEvent.addListener(marker, 'click', function() { 
			        marker.openInfoWindow(createInfoWindow()); 
	        } );
            map.addOverlay(marker);
            map.setZoom(8);
        }
        
        IsLoad = true;
    }

    /**
    * Ϊ������ʾ���ڴ��� DOM ����
    */
    function createInfoWindow() {
        // Ϊ������ʾ���ڴ�����̬ DOM �������������� DIV ��ǩ
        var div = document.createElement('div');
        div.innerHTML = '<div style="font-size: 9pt; width:300px;height:20px"><%=defaultname %></div>';

        // ���û��ر�����ʱ Google Map API ���Զ��ͷŸö���  
        return div;
    }
    
    </script>

    <script type="text/javascript">
    
        function SetProvince(ProvinceId) {
            $("#<%=ddl_ProvinceList.ClientID %>").attr("value", ProvinceId);
        }
        function SetCity(CityId) {
            $("#<%=ddl_CityList.ClientID %>").attr("value", CityId);
        }           

    </script>

    <script type="text/javascript" language="javascript">
        //����
        var Parms = { ProvinceId: 0, CityId: 0,CountyId:0, ScenicName: ""};
        $(function() {
            $("#searchTable").keydown(function(event) {
                if (event.keyCode == 13) {
                    $("#SearchImage").click();
                    event.returnValue = false;
                    return false;
                }
            });
            $("#SearchImage").click(function() {
                Parms.ProvinceId = $("#<%=ddl_ProvinceList.ClientID %>").val();
                Parms.CityId = $("#<%=ddl_CityList.ClientID %>").val();
                var searchVal = $.trim($("#txtScenicName").val());
                if (searchVal != "������ؼ���")
                    Parms.ScenicName = escape($.trim($("#txtScenicName").val()));
                window.location.href = "ScenicList.aspx?pid=" + Parms.ProvinceId + "&cid=" + Parms.CityId + "&searchVal=" + Parms.ScenicName + "";
            });
        })
    </script>

</asp:Content>

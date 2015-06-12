<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="oldTourList.aspx.cs" MasterPageFile="~/MasterPage/NewPublicCenter.Master"
    Inherits="UserPublicCenter.TourManage.oldTourList" %>

<%@ Register Assembly="ControlLibrary" Namespace="ControlLibrary" TagPrefix="cc1" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExporPageByBtn" TagPrefix="cc2" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExporPage" TagPrefix="cc3" %>

<%@ Register Src="../WebControl/InfomationControl/InfoFoot.ascx" TagName="FootMenu" TagPrefix="uc1" %>
<%@ Register Src="../WebControl/UCLineRight.ascx" TagName="UCLineRight" TagPrefix="uc2" %>
<%@ Register Src="../WebControl/TourSearchKeys.ascx" TagName="TourSearchKeys" TagPrefix="uc3" %>
<%@ Register Src="../WebControl/RouteList.ascx" TagName="RouteList" TagPrefix="uc4" %>
<%@ Register Src="../WebControl/InfomationControl/HotRouteRecommend.ascx" TagName="HotRouteRecommend" TagPrefix="uc5" %>
<%@ Register Src="../WebControl/InfomationControl/AllCountryTourInfo.ascx" TagName="AllCountryMenu" TagPrefix="uc6" %>

<%@ Import Namespace="EyouSoft.Common.URLREWRITE" %>
<%@ Import Namespace="EyouSoft.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="<%= EyouSoft.Common.CssManage.GetCssFilePath("news2011") %>" rel="Stylesheet" type="text/css" />
    <link href="<%= EyouSoft.Common.CssManage.GetCssFilePath("gongqiu2011") %>" rel="Stylesheet" type="text/css" />
    <link href="<%= EyouSoft.Common.CssManage.GetCssFilePath("boxy2011") %>" rel="Stylesheet" type="text/css" />
    <link href="<%= EyouSoft.Common.CssManage.GetCssFilePath("head2011") %>" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c1" runat="server">
    <script type="text/javascript">
        function mouseovertr(o) {
            o.style.backgroundColor = "#FFF6C7";
        }
        function mouseouttr(o) {
            o.style.backgroundColor = ""
        }
    </script>
    <div class="body" style=" overflow:hidden; margin-top:10px;">
        <div id="news-list-left">
        <!--�б� start-->
        <div class="box">
              <div class="box-c box-c-r">
                <h3>
                    <a href="<%=SubStation.CityUrlRewrite(CityId) %>" class="returnHome">������ҳ&gt;</a>
                    <%=strRourListName %>
                    <div id="xianluList">
                        <a href="#" id="aCategory" onmousemove="showFloatCategory('popDiv')" onmouseout="hideFloatCategory('popDiv')">�л�ר��</a> 
                        <div id="popDiv" onmousemove="showFloatCategory('popDiv')" onmouseout="hideFloatCategory('popDiv')">
                             <uc4:RouteList ID="RouteList1" runat="server" />
                        </div>
                    </div>
                </h3>                
            </div>
          <div class="box-main">
            <div class="box-content box-content-main-xianlu">
                <ul class="xianluul">
                 <uc3:TourSearchKeys ID="TourSearchKeys1" runat="server" />
                 <li class="xianimg">
                    <ul>
                       <%=FiveCompany %>
                    </ul>
                 </li>
                </ul>
            </div>
          </div>
           <!--tabs�л����� ��ʼ-->
        <div class="hr-10"></div>
        <div id="listContent">
            <div id="tags">
                <ul class="tagchg">
                  <li class="selectTag"><a href="/TourManage/oldTourList.aspx?CityId=<%=CityId %>&TourAreaId=<%=TourAreaId %>">������·</a></li>
                </ul>
            </div>
            <div id="tagContent" class="tagContentBoder">
              <div class="tagContent selectTag" id="tagContent1">
                 <ul class="xianlulistul">
                   <li class="title">
                     <div class="title1 title2"><b>�Ŷӻ�����Ϣ</b></div>
                     <div class="publish publish2"><b>���˼�/��ͯ��</b></div>
                   </li>
                   <!--��Ϣ�б�ѭ�����() start-->
                   
                   <cc1:CustomRepeater ID="repTourList" runat="server">
                        <ItemTemplate>
                            <li onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                               <div class="title1">
                                   <h3><a href="<%#EyouSoft.Common.URLREWRITE.Tour.GetTourPrintUrl(Eval("ID").ToString())%>" target="_blank" class="lan14">
                                            <%# Eval("RouteName")%>��<%#Eval("TourDays")%>�죩</a></h3>
                                    <%# GetCompanyInfo(Eval("CompanyID").ToString(), Eval("CompanyName").ToString())%>
                                   <p>���һ�ࣺ<span><%# GetLeaveInfo(Convert.ToDateTime(Eval("LeaveDate").ToString()))%></span>/
                                        <b>�ƻ�:<%# Eval("PlanPeopleCount")%>&nbsp;&nbsp;ʣ��:<%# Eval("RemnantNumber")%></b>
                                        <a href="javascript:void(0);" onclick="ClickCalendar('<%#Eval("ParentTourID") %>',this, <%# Convert.ToInt32(Eval("AreaType")) %>);return false;">
                                            <span class="huise">����<%#Eval("RecentLeaveCount")%>����������>></span></a> 
                                   </p>
                               </div>
                               <div class="price">
                                   <p class="state"><%# TourSpreadState(Eval("TourState").ToString(), Eval("TourSpreadStateName").ToString())%></p>
                                   <%# 
                                        "<p>���мۣ�<span class='br'>��" + Convert.ToDecimal(Eval("RetailAdultPrice").ToString()).ToString("F0") + "</span>/<span class='bb'>" + Convert.ToDecimal(Eval("RetailChildrenPrice").ToString()).ToString("F0") + "Ԫ��</span></p>"
                                    %>
                                </div>
                                <div class="publish">
                                    <a href="<%#EyouSoft.Common.URLREWRITE.Tour.GetTourToUrl(Eval("ID").ToString(),CityId )%>?ReturnUrl=<%=ReturnUrl %>"
                                            target="_blank"><img src='<%=ImageServerUrl +"/images/new2011/xianlu/png_bg_08.png" %>' alt="Ԥ��"/></a><br />
                                    <%# EyouSoft.Common.Utils.GetMQ(Eval("TourContacMQ").ToString())%>
                                </div>
                                <div style="clear:both;height:0;overflow:hidden;margin:0;padding:0;width:100%"></div>
                             </li>
                        </ItemTemplate>
                    </cc1:CustomRepeater>
                  <!--��Ϣ�б�ѭ����� end-->
                 </ul>
                      <!--��ҳ ��ʼ-->
                  <div class="digg">
                    <cc3:ExporPageInfoSelect ID="ExporPageInfoSelect1" runat="server" PageStyleType="NewButton" />
                  </div>
                 <!--��ҳ ����-->
              </div>
            </div>
        </div>
      </div>
        <!--�б� end-->
      </div>
        <!--�ұ� ��ʼ-->
      <uc2:UCLineRight ID="UCLineRight" runat="server" />
        <!--�ұ� ����-->
       <div class="hr-10"></div>
       <uc1:FootMenu ID="footMenu" runat="server" />
      <div class="hr-10"></div>
  <!--�б� start-->
      <uc6:AllCountryMenu ID="allCountryMenu" runat="server" />
  <!--�б� end-->
</div>
    <input id="hidRourName" type="hidden" runat="server" />
    
    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("groupdate") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("boxy") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("TourCalendar") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("MouseFollow") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("autocomplete") %>"></script>

    <link rel="stylesheet" type="text/css" href="<%=CssManage.GetCssFilePath("517autocomplete") %>" />

    <script type="text/javascript">
        var iFloat=null;
        function showFloatCategory(str) {
	        document.getElementById(str).style.display="block";
	        if(iFloat!=null)
		        clearInterval(iFloat);
        }
        function hideFloatCategory(str)
        {
	        obj = document.getElementById(str);
	        if(obj!=null)
		        iFloat = setInterval('document.getElementById("'+str+'").style.display="none"',300);
        }
 
        //Ԥ����ť���õķ��� ģ����ID���������
        function ClickCalendar(TourId,obj,AreaType) {
            SingleCalendar.config.isLogin = "<%=IsLogin %>"; //�Ƿ��½
            SingleCalendar.config.stringPort ="";//����
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
                Boxy.iframeDialog({ title: "Ԥ��", iframeUrl: "<%=EyouSoft.Common.Domain.UserBackCenter %>/TeamService/RouteOrder.aspx", width: "800", height:GetAddOrderHeight(), draggable: true, data: strParms });
            } else {
                var returnUrl=escape("<%=Request.ServerVariables["SCRIPT_NAME"]%>?TourId=<%=Request.QueryString["TourId"] %>&<%=Request.QueryString%>");
                //��¼
                window.location.href = "/Register/Login.aspx?isShow=1&CityId=<%=CityId %>&returnurl="+returnUrl;
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="c2" runat="server">
    
    <uc5:HotRouteRecommend ID="HotRouteRecommend1" runat="server" />
    
</asp:Content>





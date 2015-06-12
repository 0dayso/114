<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/PublicCenterMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserPublicCenter.MasterPage.Default" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../WebControl/CityAndMenu.ascx" TagName="CityAndMenu" TagPrefix="uc1" %>
<%@ Register Src="../WebControl/InfomationControl/HotRouteRecommend.ascx" TagName="HotRouteRecommend"
    TagPrefix="uc2" %>
<%@ Register Src="../HomeControl/FrindLinkList.ascx" TagName="FrindLinkList" TagPrefix="uc3" %>
<%@ Register src="../WebControl/InfomationControl/InfomationBanner.ascx" tagname="InfomationBanner" tagprefix="uc4" %>
<%@ Register Src="~/WebControl/InfomationControl/Default.ascx" TagName="InfoDefault" TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <uc1:CityAndMenu ID="CityAndMenu1" HeadMenuIndex="7" runat="server" />
    <link href="<%=CssManage.GetCssFilePath("InformationStyle") %>" rel="stylesheet"
        type="text/css" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("InformationJsflash") %>"></script>
    <div style=" height:7px;overflow:hidden;clear:both;"></div>
    <div class="clearBoth">
    </div>
     <uc4:InfomationBanner ID="InfomationBanner1" runat="server" />
     <div class="hr-7">
    </div>
    <div class="body" style="overflow: hidden; _margin-top: -8px;">
        <!--moduel one start-->
        
        <uc5:InfoDefault id="infoDefault1" runat="server" />
        <style type="text/css">
            .btmContent
            {
                _margin-top: 0px;
            }
            div.btmMain
            {
                height: auto;
            }
            ul.hotLine li
            {
                margin-bottom: 5px;
                padding-bottom: 5px;
                border-bottom: 1px dashed #CCC;
                line-height: 22px;
            }
            ul.hotLine li b
            {
                font-size: 14px;
            }
            .friendlink
            {
                margin-top: -30px; *+margin-top:0!important;_margin-top:-20px;}</style>
        <!--bottom nav ������· start-->
        <uc2:HotRouteRecommend ID="HotRouteRecommend1" runat="server" />
        <!--bottom nav ������· end-->
        <!--ͬҵ114��վ-->
        <div class="fenzhan">
            <h2>
                ͬҵ114��վ</h2>
            <div class="list">
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(19) %>">����ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(48) %>">����ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(362) %>">����ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(292) %>">�Ϻ�ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(192) %>">�Ͼ�ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(257) %>">����ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(367) %>">����ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(352) %>">����ͬҵ��</a>&nbsp;&nbsp;
                <a href="<%=EyouSoft.Common.URLREWRITE.SubStation.CityUrlRewrite(225) %>">����ͬҵ��</a>
            </div>
        </div>
        <!---->
        <!--��������-->
        <uc3:FrindLinkList ID="FrindLinkList1" runat="server" />
    <style>
    /* Firefox */
    @-moz-document url-prefix()
    {.spmm { border-left:1px solid #E2E5DE; border-right:1px solid #E2E5DE; height:235px; width:733px; overflow:hidden;}}
    </style>
    </div>
</asp:Content>

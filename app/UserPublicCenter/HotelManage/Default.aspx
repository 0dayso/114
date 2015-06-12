<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserPublicCenter.HotelManage.Default"
    MasterPageFile="~/MasterPage/PublicCenterMasterPage.Master" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="../WebControl/CityAndMenu.ascx" TagName="CityAndMenu" TagPrefix="uc1" %>
<%@ Register Src="../WebControl/HotelControl/NewJoinHotelControl.ascx" TagName="NewJoinHotelControl"
    TagPrefix="uc2" %>
<%@ Register Src="../WebControl/HotelControl/StarHotelControl.ascx" TagName="StarHotelControl"
    TagPrefix="uc3" %>
<%@ Register Src="../WebControl/HotelControl/PromoHotelControl.ascx" TagName="PromoHotelControl"
    TagPrefix="uc4" %>
<%@ Register Src="../WebControl/HotelControl/ImgFristControl.ascx" TagName="ImgFristControl"
    TagPrefix="uc5" %>
<%@ Register Src="../WebControl/HotelControl/ImgSecondControl.ascx" TagName="ImgSecondControl"
    TagPrefix="uc6" %>
<%@ Register Src="../WebControl/HotelControl/ImgBannerControl.ascx" TagName="ImgBannerControl"
    TagPrefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <link href="<%=CssManage.GetCssFilePath("HotelManage") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("tipsy") %>" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .slider
        {
            position: absolute;
        }
        .slider li
        {
            list-style: none;
            display: inline;
        }
        .slider img, .slider2 img
        {
            width: 419px;
            height: 258px;
            display: block;
        }
        .slider2 li
        {
            float: left;
        }
        .slider2
        {
            width: 3200px;
        }
        .num
        {
            position: absolute;
            right: 5px;
            bottom: 5px;
        }
        .num li
        {
            float: left;
            color: #FF7300;
            text-align: center;
            line-height: 16px;
            width: 16px;
            height: 16px;
            font-family: Arial;
            font-size: 12px;
            cursor: pointer;
            overflow: hidden;
            margin: 3px 1px;
            border: 1px solid #FF7300;
            background-color: #fff;
        }
        .num li.on
        {
            color: #fff;
            line-height: 21px;
            width: 21px;
            height: 21px;
            font-size: 16px;
            margin: 0 1px;
            border: 0;
            background-color: #FF7300;
            font-weight: bold;
        }
        .huandengtu
        {
            background: url(<%=ImageServerPath %>/images/hotel/huand_03.gif) bottom no-repeat;
            height: 257px;
            width: 418px;
        }
        .huandengtu th
        {
            font-size: 14px;
            background: url(<%=ImageServerPath %>/images/hotel/huand_01.gif) repeat-x;
            color: #FFFFFF;
        }
        .huandengtu td
        {
            font-size: 12px;
            height: 30px;
            line-height: 23px;
            background: url(<%=ImageServerPath %>/images/hotel/huand_02.gif) bottom repeat-x;
        }
        .huandengtu a
        {
            font-weight: bold;
            color: #FF4A03;
            text-decoration: none;
        }
        .huandengtu a:hover
        {
            text-decoration: underline;
        }
        .huandengtu .pand4
        {
            padding-left: 4px;
        }
        .sidebar02_2_content a
        {
            color: #000000;
        }
        .sidebar02_2_content a:hover
        {
            color: red;
        }
        .sidebar02_2_2 a:hover
        {
            color: red;
        }
        .imgRArea a
        {
            color: #074387;
        }
        .sidebar_2 ul li
        {
            border: solid 0px red; *height:21px;}</style>
    <uc1:CityAndMenu ID="CityAndMenu1" runat="server" />
    <div class="main">
        <uc7:ImgBannerControl ID="ImgBannerControl1" runat="server" />
        <!--content start-->
        <div class="content">
            <!--sidebar start-->
            <div class="sidebar">
                <!--sidebar_1-->
                <div class="sidebar_1" style="height: 260px; overflow: hidden;">
                    <h1 class="T" style="height: 33px;">
                        �Ƶ�����</h1>
                    <div class="search_box">
                        <div class="field" style="padding-top: 0px;">
                            <label style="*margin-left: -10px;">
                                <font class="C_red">*</font> ������У�</label><input name="txtCity" type="text" id="txtCity"
                                    size="7" autocomplete="off" style="width: 130px;" />
                        </div>
                        <div class="field field02" style="padding-left: 25px;">
                            <asp:DropDownList ID="ddl_City" runat="server" Width="200px">
                            </asp:DropDownList>
                        </div>
                        <div class="field" style=" height:22px;">
                            <label>
                                <font class="C_red">*</font>��ס���ڣ�</label><input name="txtInTime" type="text" id="txtInTime"
                                    size="12" onfocus="WdatePicker({minDate:'%y-%M-#{%d}',onpicked:function(){$('#txtLeaveTime').focus();}})"><img
                                        src="<%=ImageServerPath %>/images/hotel/time02.gif" class="timespic" onclick="javascript:$('#txtInTime').focus()">
                        </div>
                        <div class="field" style=" height:20px;">
                            <label>
                                <font class="C_red">*</font> ������ڣ�</label><input name="txtLeaveTime" type="text"
                                    id="txtLeaveTime" size="12" onfocus="WdatePicker({minDate:'%y-%M-#{%d}'});"><img
                                        src="<%=ImageServerPath %>/images/hotel/time02.gif" class="timespic" onclick="javascript:$('#txtLeaveTime').focus()"></div>
                        <div class="field">
                            <label>
                                �۸�Χ��</label><input name="txtPriceBegin" type="text" id="txtPriceBegin" size="7">
                            -
                            <input name="txtPriceEnd" type="text" id="txtPriceEnd" size="7">
                        </div>
                        <div class="field">
                            <label>
                                �Ƶ����ƣ�</label><input name="txtHotelName" type="text" size="17" id="txtHotelName">
                        </div>
                        <div class="field">
                            <label>
                                ����λ�ã�</label><asp:DropDownList ID="ddlGeography" runat="server" Width="165px">
                                    <asp:ListItem Value="" Text="--��ѡ��--"></asp:ListItem>
                                </asp:DropDownList>
                        </div>
                    </div>
                    <div class="submit">
                        <a href="javascript:void(0);" id="searchBtn" hidefocus="true">
                            <img src="<%=ImageServerPath %>/images/hotel/search_but.gif" /></a><a hidefocus="true"
                                href="/HotelManage/AdvanceSearch.aspx?CityId=<%=this.CityId %>">�߼�����>></a></div>
                </div>
                <div>
                    <uc5:ImgFristControl ID="ImgFristControl1" runat="server" />
                </div>
                <!-- sidebar_2-->
                <uc2:NewJoinHotelControl ID="NewJoinHotelControl1" runat="server" />
                <div style="margin-top: 10px;">
                    <uc6:ImgSecondControl ID="ImgSecondControl1" runat="server" />
                </div>
                <!-- sidebar_2-->
                <%=Utils.GetWebRequest("http://club.tongye114.com/forumblock/aggregationhotel.aspx")%>
            </div>
            <!--sidebar02 start-->
            <div class="sidebar02">
                <!--sidebar02_1-->
                <div class="sidebar02_1" style="height: 258px; overflow: hidden;">
                    <div class="flash_img" id="idTransformView" style="width: 416px; overflow: hidden;
                        position: relative; float: left; height: 258px;">
                        <ul class="slider slider2" id="idSlider" style="position: absolute; left: 0px; top: 0pt;">
                            <!--<li>
                                <div class="huandengtu">
                                    <table cellspacing="0" cellpadding="0" border="0" align="center" width="416">
                                        <tbody>
                                            <tr>
                                                <th height="29" align="center" width="111">
                                                    �Ƶ�����
                                                </th>
                                                <th height="29" align="center" width="41">
                                                    ����
                                                </th>
                                                <th height="29" align="center" width="42">
                                                    �Ǽ�
                                                </th>
                                                <th height="29" align="center" width="48">
                                                    Ӷ��
                                                </th>
                                                <th height="29" align="center" width="110">
                                                    �ر꼰�ܱ߾���
                                                </th>
                                                <th height="29" align="center" width="64">
                                                    �Ƽ���
                                                </th>
                                            </tr>
                                            <tr>
                                                <td class="pand4">
                                                    <a href="<%=EyouSoft.Common.URLREWRITE.Hotel.GetHotelDetailsUrl("SOHOTO10445",CityId)%>"
                                                        target="_blank" title="���඼�����Ƶ�(���������ŵ�)">���඼�����Ƶ�..</a>
                                                </td>
                                                <td align="center">
                                                    ����
                                                </td>
                                                <td align="center">
                                                    ׼2
                                                </td>
                                                <td align="center">
                                                    <strong><font color="#ff0000">15% </font></strong>
                                                </td>
                                                <td class="pand4">
                                                    <span title="��̳��԰����Ȼ����ݵȡ�ľ��԰">��̳��԰..</span>
                                                                   </td>
                                                <td>
                                                   <span title="�������ų�¥���£����ڱ����찲�ţ������������Ļ����ĵش���">������..</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="pand4">
                                                    <a href="<%=EyouSoft.Common.URLREWRITE.Hotel.GetHotelDetailsUrl("SOHOTO10511",CityId)%>"
                                                        target="_blank" title="�Ϻ��߱��Ͻ���8�Ƶ�">�Ϻ��߱��Ͻ���.. </a>
                                                </td>
                                                <td align="center">
                                                    �Ϻ�
                                                </td>
                                                <td align="center">
                                                    ׼2
                                                </td>
                                                <td align="center">
                                                    <strong><font color="#ff0000">15%</font></strong>
                                                </td>
                                                <td class="pand4">
                                                     <span title="�߱��Ͻֹ��С��һ���֡��߱�����������">�߱��Ͻֹ�..</span>
                                                </td>
                                                <td>
                                                   <span title="�Ƶ�ӵ�и�����ܰ���ʵĲ��Ļ�����ͷ����߱����">�Ƶ�ӵ..</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="pand4">
                                                    <a href="<%=EyouSoft.Common.URLREWRITE.Hotel.GetHotelDetailsUrl("SOHOTO9724",CityId)%>"
                                                        target="_blank" title="��ɽ����ϣ�������־Ƶ�">��ɽ����ϣ����..</a>
                                                </td>
                                                <td align="center">
                                                    ��ɽ
                                                </td>
                                                <td align="center">
                                                    ׼5
                                                </td>
                                                <td align="center">
                                                    <strong><font color="#ff0000">14% </font></strong>
                                                </td>
                                                <td class="pand4">
                                                   <span title="�Ϻ���������ݣ��Ϻ���������������Ϫ���� ">�Ϻ�������..</span>
                                                </td>
                                                <td>
                                                   <span title="�Ƶ������Ϻ����������ǣ��ٽ��Ϻ������������������ĵ���λ�ã�λ���Ϻ����뾰ɫ���˵Ľ���ʡ֮�䡣">�Ƶ���..</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="pand4">
                                                    <a href="<%=EyouSoft.Common.URLREWRITE.Hotel.GetHotelDetailsUrl("SOHOTO10353",CityId)%>"
                                                        target="_blank" title="�����׶�����ϣ���پƵ� ">�����׶�����ϣ..</a>
                                                </td>
                                                <td align="center">
                                                    ����
                                                </td>
                                                <td align="center">
                                                    5
                                                </td>
                                                <td align="center">
                                                    <strong><font color="#ff0000">14% </font></strong>
                                                </td>
                                                <td class="pand4">
                                                    <span title="����3�ź�վ¥">����3�ź�վ¥</span>
                                                </td>
                                                <td>
                                                     <span title="����3�ź�վ¥">����3..</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="pand4">
                                                    <a href="<%=EyouSoft.Common.URLREWRITE.Hotel.GetHotelDetailsUrl("SOHOTO1662",CityId)%>"
                                                        target="_blank" title="���ֺ�̩���ڶ��žƵ� ">���ֺ�̩���ڶ�..</a>
                                                </td>
                                                <td align="center">
                                                    ����
                                                </td>
                                                <td align="center">
                                                    3
                                                </td>
                                                <td align="center">
                                                    <strong><font color="#ff0000">15% </font></strong>
                                                </td>
                                                <td class="pand4">
                                                 <span title="�޺����ٽ����Ų��н�">�޺����ٽ�..</span></td>
                                                <td>
                                                    <span title="���޺��ڰ�10���ӳ���">���޺�..</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="pand4">
                                                    <a href="<%=EyouSoft.Common.URLREWRITE.Hotel.GetHotelDetailsUrl("SOHOTO9336",CityId)%>"
                                                        target="_blank" title="ƮHOME�����Ƶ꣨ǰ�ŵ꣩">ƮHOME����..</a>
                                                </td>
                                                <td align="center">
                                                    ����
                                                </td>
                                                <td align="center">
                                                    ׼2
                                                </td>
                                                <td align="center">
                                                    <strong><font color="#ff0000">15%</font></strong>
                                                </td>
                                                <td class="pand4">
                                                    <span title="������ǰ�����п�����ֺ��Һ�ͬ">������ǰ��..</span>
                                                </td>
                                                <td>
                                                <span title="�����Ǽ���᰹ʾӺͽ�����ׯ�����ڷ���԰��ׯ�������ڵ�������ͬΪ���������İ˴��ͬ��">������..</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </li>-->
                            <li><a>
                                <img src="<%=ImageServerPath %>/images/hotel/index_03.jpg" /></a></li>
                            <!--<li><a>
                                <img src="<%=ImageServerPath %>/images/hotel/index_02.jpg" /></a></li>-->
                        </ul>
                        <ul id="idNum" class="num">
                            <li>1</li>
                            <!--<li>2</li>-->
                        </ul>
                    </div>
                    <uc4:PromoHotelControl ID="PromoHotelControl1" runat="server" />
                    <div class="clear" style="height: 1px;">
                    </div>
                </div>
                <div class="sidebar02_2">
                    <!--sidebar02_2_1-->
                    <div class="sidebar02_2_1" name="sidebar02_2_1">
                        <ul class="add_menu">
                            <li style="text-align: center"><a class="default" id="a_PEK" href="Default.aspx?cityCode=PEK&CityId=<%=this.CityId %>"
                                hidefocus="true">����</a></li>
                            <li style="text-align: center"><a id="a_SHA" href="Default.aspx?cityCode=SHA&CityId=<%=this.CityId %>"
                                hidefocus="true">�Ϻ�</a></li>
                            <li style="text-align: center"><a id="a_CAN" href="Default.aspx?cityCode=CAN&CityId=<%=this.CityId %>"
                                hidefocus="true">����</a></li>
                            <li style="text-align: center"><a id="a_SZX" href="Default.aspx?cityCode=SZX&CityId=<%=this.CityId %>"
                                hidefocus="true">����</a></li>
                            <li style="text-align: center"><a id="a_HGH" href="Default.aspx?cityCode=HGH&CityId=<%=this.CityId %>"
                                hidefocus="true">����</a></li>
                            <li style="text-align: center"><a id="a_SYX" href="Default.aspx?cityCode=SYX&CityId=<%=this.CityId %>"
                                hidefocus="true">����</a></li>
                            <li style="text-align: center"><a id="a_CTU" href="Default.aspx?cityCode=CTU&CityId=<%=this.CityId %>"
                                hidefocus="true">�ɶ�</a></li>
                            <li style="text-align: center"><a id="a_NKG" href="Default.aspx?cityCode=NKG&CityId=<%=this.CityId %>"
                                hidefocus="true">�Ͼ�</a></li>
                            <li style="text-align: center"><a id="a_TAO" href="Default.aspx?cityCode=TAO&CityId=<%=this.CityId %>"
                                hidefocus="true">�ൺ</a></li>
                            <li style="text-align: center"><a id="a_XMN" href="Default.aspx?cityCode=XMN&CityId=<%=this.CityId %>"
                                hidefocus="true">����</a></li>
                            <li style="text-align: center"><a id="a_WUH" href="Default.aspx?cityCode=WUH&CityId=<%=this.CityId %>"
                                hidefocus="true">�人</a></li>
                            <li style="text-align: center"><a id="a_SHE" href="Default.aspx?cityCode=SHE&CityId=<%=this.CityId %>"
                                hidefocus="true">����</a></li>
                        </ul>
                        <div style="width: 682px; height: 295px;">
                            <div class="sidebar02_2_content">
                                <div id="sidebar_div_PEK" style="height: 295px; padding-left: 2px;">
                                    <div style='width: 100%; text-align: center;'>
                                        <img src='<%=EyouSoft.Common.Domain.ServerComponents %>/images/loadingnew.gif' border='0'
                                            align='absmiddle' />&nbsp;���ڼ���...&nbsp;</div>
                                </div>
                                <div id="sidebar_div_SHA" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_CAN" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_SZX" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_HGH" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_SYX" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_CTU" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_NKG" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_TAO" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_XMN" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_WUH" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                                <div id="sidebar_div_SHE" style="height: 295px; display: none; padding-left: 2px;">
                                </div>
                            </div>
                        </div>
                        <%-- ���--%>
                        <div style="margin-top: 10px;">
                            <a href="/HotelManage/HotelAdv/index.html">
                                <img width="682px" height="81px" src="<%=ImageServerPath%>/images/hotel/hotelqinggou.jpg"
                                    border="0"><a></div>
                        <uc3:StarHotelControl ID="StarHotelControl1" runat="server" />
                    </div>
                </div>
            </div>
            <!--sidebar02 end-->
        </div>
        <div class="clear">
        </div>
        <!--content end-->
        <input type="hidden" runat="server" id="hideCityCode" />
        <input type="hidden" id="hideGeography" runat="server" />
        <input type="hidden" id="hideCity" runat="server" />
        <input type="hidden" id="hideJSCity" runat="server" />
    </div>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("GetHotelCity") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("tipsy") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("HomeImages") %>"></script>

    <script type="text/javascript" src="/DatePicker/WdatePicker.js"></script>

    <script type="text/javascript">
        $(function() {
            //�ı���������ʾ
            $("#txtCity").tipsy({ fade: true, content: '�������ġ�ƴ����������ɸѡ', gravity: "s" });

            //��ѯ�¼�
            $("#searchBtn").click(function() {
                var cityCode = $("#<%=ddl_City.ClientID %>").val();
                var inTime = $("#txtInTime").val();
                var leaveTime = $("#txtLeaveTime").val();
                var priceBegin = $("#txtPriceBegin").val();
                var priceEnd = $("#txtPriceEnd").val();
                var hotelName = $("#txtHotelName").val();
                var landMark = $("#<%=ddlGeography.ClientID %>").val();
                var landMarkTxt = $("#<%=ddlGeography.ClientID %>  option:selected").text();
                if (landMark == "") { landMarkTxt = ""; }
                //��֤
                if (cityCode == "") {
                    alert("�������ѡ��һ������!");
                    return;
                }

                if (inTime == "") {
                    alert("��������ס����!");
                    return;
                }
                if (leaveTime == "") {
                    alert("�������������!");
                    return;
                }
                //����
                var para = { cityCode: "", inTime: "", leaveTime: "", priceBegin: "", priceEnd: "", hotelName: "", landMark: "", CityId: "", sort: "", landMarkTxt: "" };
                //��ֵ
                para.cityCode = cityCode;
                para.inTime = inTime;
                para.leaveTime = leaveTime;
                para.priceBegin = priceBegin;
                para.priceEnd = priceEnd;
                para.hotelName = hotelName;
                para.landMark = landMark;
                para.landMarkTxt = landMarkTxt;
                para.CityId = "<%=this.CityId %>";
                if (priceBegin == "" && priceEnd == "" && hotelName == "" && landMark == "") {
                    para.sort = "3";
                }
                window.location.href = "/HotelManage/HotelSearchList.aspx?" + $.param(para);
                return false;
            });

            //����������ѡ���¼�
            $("#<%=ddl_City.ClientID %>").change(function() {
                var cityCode = $(this).val();
                $("#txtCity").val("");
                DefaultPage.AddItemToGeography(cityCode);
            });
            //���س�������
            DefaultPage.AddItemToCity("Load");

            //�����ı��򰴼��¼�
            $("#txtCity").keyup(function() {
                if (SearchTimeOut != null) {
                    clearTimeout(SearchTimeOut);
                }
                SearchTimeOut = setTimeout(DefaultPage.TxtKeyUp, 200);
            });
            //ҳ����˵�ʱ��

            setTimeout(function() {
                if ($("#txtCity").val() != "") {

                    if (DefaultPage.AddItemToCity($("#txtCity").val())) {
                        var code = $("#<%=ddl_City.ClientID %>").val();
                        //��ӵ���λ�õ�������
                        DefaultPage.AddItemToGeography(code);
                    }
                }
            }, 1000)

            //�ֻ�����ʼ��
            HomeBigImages.init(420, 1);

            //���ƾƵ���е����ȡ�Ƶ��б�
            $(".add_menu a").click(function() {
                if ($(this).attr("class") == "default") {
                    return false;
                }
                var cityCode = $(this).attr("id").replace("a_", "");
                var isGet = DefaultPage.GetHotelHtmlByCode(cityCode);
                if (oldObj != null) {
                    $(oldObj).hide();
                }
                if (!isGet) {
                    DefaultPage.GetSpecialHotel(cityCode);
                    $("#sidebar_div_" + cityCode).fadeIn("slow");
                    //��ʾ���صȴ���ͼƬ
                    $("#sidebar_div_" + cityCode).html("<div style='width:100%; text-align:center;'><img src='<%=EyouSoft.Common.Domain.ServerComponents %>/images/loadingnew.gif' border='0' align='absmiddle'/>&nbsp;���ڼ���...&nbsp;</div>");
                } else {
                    $("#sidebar_div_" + cityCode).fadeIn("slow");
                }
                oldObj = $("#sidebar_div_" + cityCode);
                $(".add_menu a").removeClass("default");
                $(this).addClass("default");
                return false;
            });
            //���ر������ƾƵ�
            DefaultPage.GetSpecialHotel("PEK");
        });
        var SearchTimeOut = null;
        var SpecialHotel = new Array();
        var hotelModel = function() { this.cityCode = ""; this.isGet = false; };
        var oldObj = $("#sidebar_div_PEK");
        var DefaultPage = {
            GetHotelHtmlByCode: function(cityCode) {
                var isGet = false;
                if (SpecialHotel != null && SpecialHotel.length > 0) {
                    for (var i = 0; i < SpecialHotel.length; i++) {
                        var model = SpecialHotel[i];
                        if (model.cityCode == cityCode) {
                            isGet = model.isGet;
                        }
                    }
                }
                return isGet;
            },
            GetSpecialHotel: function(cityCode) {
                $.ajax({
                    type: "Get",
                    url: "/HotelManage/AjaxDefault.aspx?cityCode=" + cityCode + "&CityId=<%=this.CityId %>",
                    cache: false,
                    success: function(result) {
                        $("#sidebar_div_" + cityCode).html(result);
                        var model = new hotelModel();
                        model.cityCode = cityCode;
                        model.isGet = true;
                        SpecialHotel.push(model);
                    }
                });

            },
            //��ӵ���λ��
            AddItemToGeography: function(cityCode) {
                $("#<%=ddlGeography.ClientID %>").empty();
                $("<option value=''>--��ѡ��--</option>").appendTo($("#<%=ddlGeography.ClientID %>"));
                if (GeographyList.length > 0) {
                    for (var i = 0; i < GeographyList.length; i++) {
                        var id = GeographyList[i].ID;
                        var Code = GeographyList[i].C;
                        var por = GeographyList[i].P;
                        if (cityCode.toUpperCase() == Code.toUpperCase()) {
                            $("<option value='" + id + "'>" + por + "</option>").appendTo($("#<%=ddlGeography.ClientID %>"));
                        }
                    }
                }
            },
            //��ӳ���
            AddItemToCity: function(val) {
                var isThere = false;
                if (val == "Load") {
                    $("#<%=ddl_City.ClientID %>").empty();
                    $("<option value=''>--��ѡ��--</option>").appendTo($("#<%=ddl_City.ClientID %>"));
                    if (CityList.length > 0) {
                        for (var i = 0; i < CityList.length; i++) {
                            var Ping = CityList[i].P;
                            var Code = CityList[i].C;
                            var cityName = CityList[i].CN;
                            $("<option value='" + Code + "'>" + Ping + cityName + Code + "</option>").appendTo($("#<%=ddl_City.ClientID %>"));
                        }
                    }
                } else if ($.trim(val) != "") {
                    if (CityList.length > 0) {
                        for (var i = 0; i < CityList.length; i++) {
                            var Ping = CityList[i].P;
                            var Code = CityList[i].C;
                            var cityName = CityList[i].CN;
                            var indexVal = (Ping + cityName + Code).toUpperCase().indexOf(val.toUpperCase())
                            if (indexVal == 0) {
                                $("#<%=ddl_City.ClientID %>").val(Code);
                                return true;
                            }
                            if (indexVal > 0) {
                                $("#<%=ddl_City.ClientID %>").val(Code);
                                isThere = true;
                            }
                        }
                    }
                }
                return isThere;
            },
            //�����¼�
            TxtKeyUp: function() {
                var val = $("#txtCity").val();
                if ($.trim(val) != "") {
                    if (DefaultPage.AddItemToCity(val)) {
                        var code = $("#<%=ddl_City.ClientID %>").val();
                        //��ӵ���λ�õ�������
                        DefaultPage.AddItemToGeography(code);
                    }
                }
            }
        };
    </script>

    </a>
</asp:Content>

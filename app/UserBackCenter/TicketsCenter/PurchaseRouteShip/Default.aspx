﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UserBackCenter.TicketsCenter.PurchaseRouteShip.Default" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExportPageSet" TagPrefix="cc1" %>
<asp:content id="PurchaseRouteShip" runat="server" contentplaceholderid="ContentPlaceHolder1">


<ul class="sub_leftmenu">
    <li><a href="javascript:void(0);" class="book_default">常规购买</a></li>
    <li><a href="javascript:void(0);" onclick="topTab.url(topTab.activeTabIndex, '/TicketsCenter/PurchaseRouteShip/ComboBuy.aspx?type=2');return false;">
        套餐购买</a></li>
    <li><a href="javascript:void(0);" onclick="topTab.url(topTab.activeTabIndex, '/TicketsCenter/PurchaseRouteShip/ComboBuy.aspx?type=3');return false;">
        促销购买</a></li>
</ul>
<div class="clearboth">
</div>
<div class="contact_text">
    <span><font color="#FF0000">备注：</font>如果有个性化需求，可在每周一至周五9：00－17：30另行 <a href="javascript:void(0);" onclick="window.open('<%=Utils.GetMQLink("27440") %>')">联系我们</a>。<font
        color="#FF0000">供应商管理部：</font><a href="javascript:void(0);" onclick="window.open('<%=Utils.GetMQLink("27440") %>')">MQ</a> 以上所有活动按照自然月计算，本活动解释权归属同业114。</span>
</div>
<div id="con_three_1" style=" width:835px;">
    <table width="835px" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#7dabd8"
        class="admin_tablebox">
        <tr>
            <th width="75" height="30" align="center" bgcolor="#EEF7FF">
                套餐项目
            </th>
            <th width="70" align="center" bgcolor="#EEF7FF">
                类型
            </th>
           <%-- <th width="90" align="center" bgcolor="#EEF7FF">
                航空公司
            </th>--%>
            <th width="75" align="center" bgcolor="#EEF7FF">
                运价数(条)
            </th>
            <th width="65" align="center" bgcolor="#EEF7FF">
                一月价格(元/条)
            </th>
            <th width="65" align="center" bgcolor="#EEF7FF">
                一季价格(元/条)
            </th>
            <th width="65" align="center" bgcolor="#EEF7FF">
                半年价格(元/条)
            </th>
            <th width="75" align="center" bgcolor="#EEF7FF">
                小计(元)
            </th>
            <th width="75" align="center" bgcolor="#EEF7FF">
                开始时间
            </th>
            <th width="75" align="center" bgcolor="#EEF7FF">
                结束时间
            </th>
            <th width="75" align="center" bgcolor="#EEF7FF">
                购买
            </th>
        </tr>
        
           <asp:repeater runat="server" ID="rptList">
           <ItemTemplate>
        <tr>
            <td height="30" align="center">
               <%#Eval("PackageName") %>
               <input type="hidden" id="cg_hide_packageId_<%#Container.ItemIndex %>"  value='<%#Eval("id") %>'/>
            </td>
            <td align="center">
                <%#EyouSoft.Model.TicketStructure.RateType.团队散拼.ToString()%>
            </td>
           <%-- <td align="center">
                <%#Eval("FlightName")%>
            </td>--%>
            <td align="center">
                <select name="select" id="cg_select_<%#Container.ItemIndex %>" onchange="ThisDePage.SelectCountChange(this)">
                    <option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>

	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>

	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>

	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>
	<option value="22">22</option>
	<option value="23">23</option>

	<option value="24">24</option>
	<option value="25">25</option>
	<option value="26">26</option>
	<option value="27">27</option>
	<option value="28">28</option>
	<option value="29">29</option>

	<option value="30">30</option>
	<option value="31">31</option>
	<option value="32">32</option>
	<option value="33">33</option>
	<option value="34">34</option>
	<option value="35">35</option>

	<option value="36">36</option>
	<option value="37">37</option>
	<option value="38">38</option>
	<option value="39">39</option>
	<option value="40">40</option>
	<option value="41">41</option>

	<option value="42">42</option>
	<option value="43">43</option>
	<option value="44">44</option>
	<option value="45">45</option>
	<option value="46">46</option>
	<option value="47">47</option>

	<option value="48">48</option>
	<option value="49">49</option>
	<option value="50">50</option>

                </select>
            </td>
            <td align="center" bgcolor="#E9EDF4">
                <input type="radio" name="radio_<%#Container.ItemIndex %>"  value="<%#Convert.ToDecimal(Eval("MonthPrice")).ToString("0.00")%>" checked="checked" onclick="ThisDePage.RadioClick(this,'1')" />
                <%#Utils.GetMoney(Convert.ToDecimal(Eval("MonthPrice")))%>
                <input type="hidden" id="cg_hide_price<%#Container.ItemIndex %>" value="<%#Convert.ToDecimal(Eval("MonthPrice")).ToString("0.00")%>" rel="1"/>
            </td>
            <td align="center">
                <input type="radio" name="radio_<%#Container.ItemIndex %>"  value="<%#Convert.ToDecimal(Eval("QuarterPrice")).ToString("0.00")%>" onclick="ThisDePage.RadioClick(this,'2')"/>
                <%#Utils.GetMoney(Convert.ToDecimal(Eval("QuarterPrice")))%>
            </td>
            <td align="center">
                <input type="radio" name="radio_<%#Container.ItemIndex %>" value="<%#Convert.ToDecimal(Eval("HalfYearPrice")).ToString("0.00")%>" onclick="ThisDePage.RadioClick(this,'3')"/>
                <%#Utils.GetMoney(Convert.ToDecimal(Eval("HalfYearPrice")))%>
                
            </td>
            <td align="center">
                <span id="cg_spanAllPrice<%#Container.ItemIndex %>"><%#Utils.GetMoney(Convert.ToDecimal(Eval("MonthPrice")))%></span>
            </td>
            <td align="center">
                 <%#DateTime.Now.Year.ToString() %> 
                <select id="cg_selectMonth<%#Container.ItemIndex %>" onchange="ThisDePage.SelectMonthChange(this)">
                    <%#GetOptionByMonth() %>
                </select>
            </td>
            <td align="center">
                <span id="cg_span_Time<%#Container.ItemIndex %>"><%#DateTime.Now.Year.ToString() %>.<%#DateTime.Now.Month.ToString() %></span>
            </td>
            <td align="center">
                <input type="button" value="支付" ref="<%#Container.ItemIndex %>" onclick="ThisDePage.PayMoney(this)" />
            </td>
        </tr>
            </ItemTemplate>
        </asp:repeater>
        
    </table>
    <div id="cg_divPage" style=" height:20px; width:100%; text-align:center; margin-top:5px;">
        <asp:label runat="server" text="" ID="cg_lblMsg"></asp:label>
        <cc1:ExportPageInfo ID="ExportPageInfo1" runat="server" />
    </div>
</div>
<div class="clearboth">
</div>
    <script type="text/javascript">
        var ThisDePage = {
            RadioClick: function(obj, type) {
                var price = Number($(obj).val());
                var num = $(obj).attr("name").replace("radio_", "");
                var count = $("#cg_select_" + num + " option:selected").val();
                $("#cg_spanAllPrice" + num).html(parseInt(Number(count) * price * 100) / 100);
                $("#cg_hide_price" + num).val(price);
                $("#cg_hide_price" + num).attr("rel", type);

                this.SelectMonthChange($("#cg_selectMonth" + num));
            },
            SelectCountChange: function(obj) {
                var num = Number($(obj).attr("id").replace("cg_select_", ""));
                var count = Number($(obj).val());
                var price = Number($("#cg_hide_price" + num).val());
                $("#cg_spanAllPrice" + num).html(parseInt(count * price * 100) / 100);
            },
            SelectMonthChange: function(obj) {
                var num = Number($(obj).attr("id").replace("cg_selectMonth", ""));
                var type = $("#cg_hide_price" + num).attr("rel");

                var newMonth = Number($(obj).val());
                switch (type) {
                    case "1": newMonth = newMonth + 0; break;
                    case "2": newMonth = newMonth + 2; break;
                    case "3": newMonth = newMonth + 5; break;
                }

                var dateTime = new Date();
                dateTime.setFullYear(Number("<%=DateTime.Now.Year.ToString() %>"));
                if (newMonth == 12) {
                    $("#cg_span_Time" + num).html(dateTime.getFullYear() + "." + newMonth);
                } else {

                    dateTime.setMonth(newMonth);
                    $("#cg_span_Time" + num).html(dateTime.getFullYear() + "." + dateTime.getMonth());
                }
            },
            //支付按钮事件
            PayMoney: function(obj) {
                var num = Number($(obj).attr("ref"));
                var buyConut = $("#cg_select_" + num + " option:selected").val();
                var companyId = "<%=companyId%>";
                var beginTime = "<%=DateTime.Now.Year.ToString() %>-" + $("#cg_selectMonth" + num + " option:selected").val() + "-<%=DateTime.Now.Day.ToString() %>";
                var type = $("#cg_hide_price" + num).attr("rel");
                var packageId = $("#cg_hide_packageId_" + num).val();
                var Searchparms = { "buyCount": "", "companyId": "", "SartDateTime": "", "p": "cg", "type": "", "packageId": "" };
                Searchparms.buyCount = buyConut;
                Searchparms.companyId = companyId;
                Searchparms.SartDateTime = beginTime;
                Searchparms.type = type;
                Searchparms.packageId = packageId;

                $.ajax({
                    type: "GET",
                    url: "/ticketscenter/purchaserouteship/PurchasePay.ashx?" + $.param(Searchparms),
                    cache: false,
                    success: function(result) {
                        if (result != "error") {
                            Boxy.iframeDialog({ title: "购买信息确认", iframeUrl: "/ticketscenter/purchaserouteship/MsgComfirm.aspx?logId=" + result, width: "310px", height: "320px", draggable: true, data: null });
                        }
                    }
                });
            }
        };

        $(function() {
            $("#cg_divPage a").click(function() {
                var str = $(this).attr("href").match(/&[^&]+$/);
                pageIndex = str.toString().replace("&Page=", "");
                topTab.url(topTab.activeTabIndex, "/TicketsCenter/PurchaseRouteShip/Default.aspx?Page=" + pageIndex);
                return false;
            });

            $("#cg_divPage select").change(function() {
                pageIndex = $(this).val();
                topTab.url(topTab.activeTabIndex, "/TicketsCenter/PurchaseRouteShip/Default.aspx?Page=" + pageIndex);
                return false;
            });
        });
        function PurchaseRouteCloseIframe(iframeId) {
            var boxy = Boxy.getIframeDialog(iframeId);
            if (boxy != null && boxy != undefined) {
                boxy.hide();
            }
        }
 </script>
</asp:content>

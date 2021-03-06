<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/PublicCenterMasterPage.Master" AutoEventWireup="true" CodeBehind="HotelBook.aspx.cs" Inherits="UserPublicCenter.HotelManage.HotelBook" %>
<%@ Register Src="../WebControl/CityAndMenu.ascx" TagName="CityAndMenu" TagPrefix="uc1" %>
<%@ Register Src="~/WebControl/HotelControl/HotelSearchControl.ascx" TagName="HotelSearch" TagPrefix="uc2" %>
<%@ Register Src="~/WebControl/HotelControl/SpecialHotelControl.ascx" TagName="SpecialHotel" TagPrefix="uc3" %>
<%@ Register Src="~/WebControl/HotelControl/HotHotelControl.ascx" TagName="HotHotel" TagPrefix="uc4" %>
<%@ Register Src="~/WebControl/HotelControl/CommonUserControl.ascx" TagName="CommonUser" TagPrefix="uc5" %>
<%@ Register Src="~/WebControl/HotelControl/ImgFristControl.ascx" TagName="ImgFrist" TagPrefix="uc6" %>
<%@ Register Src="~/WebControl/HotelControl/ImgSecondControl.ascx" TagName="ImgSecond" TagPrefix="uc7" %>
<%@ Register Src="~/WebControl/HotelControl/ImgBannerControl.ascx" TagName="ImgBanner" TagPrefix="uc8" %>
<%@ Import Namespace="EyouSoft.Common" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">

<link href="<%=CssManage.GetCssFilePath("HotelManage") %>" rel="stylesheet" type="text/css" />

         <uc1:CityAndMenu ID="CityAndMenu1" runat="server" />
           <div class="main">
        <!--content start-->
          <uc8:ImgBanner ID="ImgBanner1" runat="server" />
        <div class="content">
         
     
        
       		<!--sidebar start-->
        	<div class="sidebar sidebarSearch" >
              <!--sidebar_1-->
           	     <uc2:HotelSearch ID="HotelSearch1" runat="server" />
              <!--sidebar_1 end-->
               <uc6:ImgFrist ID="ImgFrist1" runat="server" ImageWidth="224px" />
             <!-- sidebar_2 start-->
             <uc5:CommonUser ID="CommonUser1" runat="server" />
            <uc3:SpecialHotel ID="SpecialHotel1" runat="server" />
              <!-- sidebar_2 end-->
              <uc7:ImgSecond ID="ImgSecond1" runat="server" ImageWidth="224px" />
               <uc4:HotHotel ID="HotHotel1" runat="server" />
              <!-- sidebar_2 end-->
            </div>
           <!--sidebar02 start-->
            <div class="sidebar02 sidebar02Search" id="div_book">
            	<div class="sidebar02_1" id="hb_divOrder">
                    <p class="xuanzhe"><span>填写 <font color="#D41B1B"><%=hotelName %></font> 预订单 </span><img src="<%=ImageServerUrl%>/Images/hotel/liucheng2.gif"></p>
                  
                   <!--sidebar02SearchC start-->
                 
                    <div class="sidebar02SearchC">
                        	
                      <div class="yd_jiange">入住日期：<%=comeDate %>日－离店日期：<%=leaveDate %>日    共 <span class="red strong"><%=inDays %></span> 天    付款方式：<span class="green"><%=payType%></span>
                    </div>  
					
     <div class="yuding"><h1>预定酒店信息</h1>
	 <div class="biaoge1" >
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th align="center" valign="middle">房型</th>
    <th align="center" valign="middle">门市价</th>
    <th align="center" valign="middle">销售价</th>
    <th align="center" valign="middle"> 返佣价</th>
    <th align="center" valign="middle">返佣比例</th>
    <th align="center" valign="middle">结算价</th>
    <th align="center" valign="middle">早餐</th>
    <th align="center" valign="middle"> 床型</th>
    <th align="center" valign="middle">宽带</th>
  </tr>
  <tr>
    <td class="green"><%=roomTypeModel.RoomTypeName%></td>
    <td align="center">￥<%=EyouSoft.Common.Utils.GetMoney(rateModel.DisplayPrice)%></td>
    <td align="center">￥<%=EyouSoft.Common.Utils.GetMoney(rateModel.AmountPrice)%></td>
    <td align="center">￥<%=EyouSoft.Common.Utils.GetMoney(rateModel.CommissionAmount) %></td>
    <td align="center" class="orange strong"><%=EyouSoft.Common.Utils.GetMoney(rateModel.Percent * 100)%>%</td>
    <td align="center" class="green strong">￥<%=Decimal.Round(rateModel.BalancePrice) %></td>
    <td align="center"><%=rateModel.FreeMeal == 0 ? "无" : rateModel.FreeMeal.ToString()%></td>
    <td align="center"><%=roomTypeModel.BedType%></td>
    <td align="center"><%=roomTypeModel.RoomRate.Internet?"是":"否" %></td>
  </tr>
</table></div>
<div class="biaoge2" id="hb_priceList">
<h1>房费说明</h1><span>1个房间 <%= inDays%>晚 <%=comeDate%>至<%=leaveDate %></span>
<div id="hb_priceList2">
<%=hotelRateList %>
</div>
</div>
 
	 </div>
	 
	 <div class="yuding"><h1>入住信息</h1>
	 
<div class="biaoge2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td  colspan="4" align="left" class="pandl"  style=" padding-bottom:3px;"><b>房间数：</b>
 <select name="hb_selRoom" id="hb_selRoom" onchange="HotelBook.changeRoom();"> 
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
 </select>间 <font color="#666666">超过10间，点击
        
      </font><a href="/HotelManage/HotelTeamBook.aspx?hotelCode=<%=hotelCode%>&comeDate=<%=comeDate %>&leaveDate=<%=leaveDate%>&cityId=<%=CityId %>" target="_blank"><img style="padding-top:5px;" src="<%=ImageServerUrl%>/Images/hotel/yuding_04.gif" width="86" height="22" /></a></td>
    </tr>
  <tr id="hb_trCustList">
    <th width="20%" align="center">常旅客</th>
    <th width="22%" align="center">姓名</th>
    <th width="18%" align="center">类型</th>
    <th width="40%" align="center">手机</th>
  </tr>
    
    
  <tr>
    <td width="20%" align="center" >
      <select name="hb_selCustomer" id="hb_selCustomer"  onchange="return HotelBook.changeGuest(this,1);">
      <option value="0">请选择</option>
      <%if (visistList != null)
        {
            foreach (EyouSoft.Model.TicketStructure.TicketVistorInfo info in visistList)
            {
                %><option tel="<%=info.ContactTel %>"  value="<%= info.Id %>"><%=info.ChinaName == "" ? info.EnglishName : info.ChinaName%></option>
                <%}
        } %>
      </select>
	  
    </td>
    <td width="22%" align="left" class="pandl">
      <input name="hb_txtGuestName" type="text" class="inputhui" size="10" id="hb_txtGuestName"  onblur="HotelBook.checkContact();" />
      <font color="#FF0000"> *</font> </td>
    <td width="18%" align="center"><select name="hb_selGuestType" id="hb_selGuestType1">
      <option value="0">内宾</option>
      <option value="1">外宾</option>
    </select></td>
    <td width="40%" align="center" valign="top"><input name="hb_chkGuestMoible" id="hb_chkGuestMoible" type="text" class="inputhui" size="23" onblur="HotelBook.checkContact();" /><font color="#FF0000"> *</font> 
     <span style="display:none"><input type="checkbox" name="hb_chkIsMoible" id="hb_chkIsMoible" value="1" />短信通知客人</span></td>
    </tr>
  
 
   
  <tr id="hb_trArrive">
    <td align="center" ><p>预计最早到达时间：</p></td>
    <td align="left" class="pandl"><select name="hb_selETime" id="hb_selETime">
      <option value="6">06：00</option>
      <option value="7">07：00</option>
      <option value="8">08：00</option>
      <option value="9">09：00</option>
      <option value="10">10：00</option>
      <option value="11">11：00</option>
      <option value="12" selected="selected">12：00</option>
      <option value="13">13：00</option>
      <option value="14">14：00</option>
      <option value="15">15：00</option>
      <option value="16">16：00</option>
      <option value="17">17：00</option>
      <option value="18">18：00</option>
      <option value="19">19：00</option>
      <option value="20">20：00</option>
      <option value="21">21：00</option>
      <option value="22">22：00</option>
      <option value="23">23：00</option>
      <option value="24">23：59</option>
    </select></td>
    <td align="center">预计最晚到达时间：</td>
    <td align="left" valign="middle"  class="pandl"><select name="hb_selLTime" id="hb_selLTime">
       <option value="6">06：00</option>
      <option value="7">07：00</option>
      <option value="8">08：00</option>
      <option value="9">09：00</option>
      <option value="10">10：00</option>
      <option value="11">11：00</option>
      <option value="12">12：00</option>
      <option value="13">13：00</option>
      <option value="14">14：00</option>
      <option value="15">15：00</option>
      <option value="16">16：00</option>
      <option value="17">17：00</option>
      <option value="18" selected="selected">18：00</option>
      <option value="19">19：00</option>
      <option value="20">20：00</option>
      <option value="21">21：00</option>
      <option value="22">22：00</option>
      <option value="23">23：00</option>
      <option value="24">23：59</option>
      <option value="25">次日01:00</option>
      <option value="26">次日02:00</option>
      <option value="27">次日03:00</option>
      <option value="28">次日04:00</option>
      <option value="29">次日05:00</option>
    </select>
      </td>
  </tr>
</table>
</div>

	 </div>
	 
	 <div class="yuding">
	   <h1>联系人信息<span>（为了与您及时取得联系，请留下正确的联系方式）</span></h1>
	    <ul>
		  <li><input type="checkbox" name="checkbutton" id="hb_chkContact" style="vertical-align:middle;" onclick="HotelBook.checkContact('chk');" /><label for="hb_chkContact" style="cursor:pointer;">复制入住人信息</label>  </li>
		</ul>
	 <div class="clear"></div>
<div class="biaoge2" id="contact_mess">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="11%" align="left" class="pandl">姓名：</th>
    <td width="89%" align="left" class="pandl"><input name="hb_txtContactName" id="hb_cName" type="text" class="inputhui" size="40" />
      <font color="#FF0000">    *</font></td>
    </tr>
  <tr>
    <th width="11%" align="left" class="pandl" ></span>手机：</th>
    <td width="89%" align="left" class="pandl"><input name="hb_txtContactMoible" id="hb_cMoible" type="text" class="inputhui" size="40" />
      <font color="#FF0000"> *</font></td>
    </tr>
  <tr>
    <th align="left" class="pandl" >座机：</th>
    <td align="left" class="pandl">
  <input name="hb_txtContactArea" id="hb_cArea" type="text" class="inputhui" size="10" maxlength="4" />
-      
  <input name="hb_txtContactTel" id="hb_cTel" type="text" class="inputhui" size="30"  maxlength="10" />
  -
  <input name="hb_txtContactFen" id="hb_cFen" type="text" class="inputhui" size="10" maxlength="4" />
  <font color="#FF0000"> *</font></td>
    </tr>
</table>
</div>

	 </div>
	 
	 <div class="yuding"><h1>酒店附加服务</h1>
	 <div class="clear"></div>
<div class="biaoge2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%" align="left" valign="middle" class="pandl">无烟要求：
      <select name="hb_selIsSmoke" id="hb_selIsSmoke">
        <option value="无要求">无要求</option>
        <option value="尽量无烟层房间">尽量无烟层房间</option>
      </select></td>
    <td width="50%" align="left" valign="middle" class="pandl">早&nbsp;&nbsp;&nbsp;&nbsp;餐：
      <select name="hb_selIsBreakfast" id="hb_selIsBreakfast">
        <option value="无要求">无要求</option>
        <option value="每天每间加一早">每天每间加一早</option>
      </select></td>
    </tr>
  <tr>
    <td width="50%" align="left" valign="middle" class="pandl" >同一楼层：
      <input type="checkbox" name="hb_chkFloor" id="hb_chkFloor" value="同一楼层" />
      
      </td>
    <td width="50%" align="left" valign="middle" class="pandl">相邻房间：
      <input type="checkbox" name="hb_chkRoom" id="hb_chkRoom" value="相邻房间"  /></td>
    </tr>
</table>
</div>
      </div>
     <div class="yuding"><h1>注意事项</h1>
	 <div class="clear"></div>
        <div class="biaoge3">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
            <textarea  id="textarea" class="zuyisx"   readonly="readonly" >
1、网上价格可能因为酒店原因会有所变更，请以同业114预订中心确认为准。
2、同业114的会员价是同业114与酒店签订的协议价，此价格包含了酒店服务费，但不包含酒店其它费用及税收。
3、您的入住人数尽量与房间数量匹配，加床价格视各酒店规定有所不同。 
4、为了方便酒店前台办理入住手续，请在预订时提供正确的入住人信息。 
5、当您所订房间数量大于1间时，请留下相应的入住人信息，入住人姓名不能相同，以方便办理入住手续。 
6、您所提出的特殊要求可能因酒店原因不能保证实现，或者酒店可能要加收相应费用。
7、如果您入住一家酒店的时间是连续的，请尽量生成一张订单，如果您在一段连续的时间入住同一家酒店，但生成了多张订单，同业114将把这些订单合成一张。
8、完成订单后，在接到同业114按您所选择的确认方式发给您确认信息后，表示您的预订成功，您已在您所选择的酒店订到房间。
9、在您填写预订单时，务必要留下确认方式：电话、传真、短信或email，以便于同业114与您联系预订相关事宜。 
10、酒店星级，只作为参考。
11、通常情况下酒店的入店时间为14:00，离店时间为正午12:00。如提前入住或推迟离店，酒店会加收一定房费。
12、如在订单上没有特别注明到达时间，大部分酒店会将您的房间保留至入住日的18:00，过时不予保留。
13、如您在酒店前台延住，请通知同业114，如未通知同业114，且与酒店发生价格分歧，同业114将不负任何责任。 
14、如客人在前台不能顺利入住，请立即通知同业114，若客人在问题解决前放弃入住，将不能得到本次的预订返佣。
15、如因特殊原因取消订单，想恢复预订，则需重新提交新订单，而同业114也需再次向酒店确认。
16、入住港澳酒店时请务必提供客人护照上真实有效的姓名。</textarea></td>
          </tr>
          <tr>
            <td align="center" valign="middle"><input  type="checkbox"  checked="checked" disabled="disabled" /><font class="frb">我同意</font></td>
          </tr>
        </table>

        </div>
      </div>
      <div class="yuding">
        <h1>预订规则和要求</h1>
	    <div class="clear"></div>
            <div class="biaoge2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" valign="middle" class="pandl">
                <%= bookPolicy%>
                </td>
                </tr>
            </table>
            <ul class="btn02"><li><a href="#" onclick="return HotelBook.checkOrder();"><img src="<%=ImageServerUrl%>/Images/hotel/tijiaodidanbtn.gif" border="0" /></a></li>
            <li><a href="javascript:;" onclick="return HotelBook.clearOrder();"><img src="<%=ImageServerUrl%>/Images/hotel/congxintianxie.gif" /></a></li><div class="clear"></div></ul>
            </div>
      </div>
	  
	 
                  </div><!--sidebar02SearchC end-->
                 
              </div>
                    </div>
             
             <div class="sidebar02 sidebar02Search" id="div_check" style="display:none;">
            	<div class="sidebar02_1">
                    <p class="xuanzhe"><span>核对预订单信息</span><img src="<%=ImageServerUrl%>/Images/hotel/liucheng04.gif"></p>
                   <!--sidebar02SearchC start-->
                    <div class="sidebar02SearchC">
                        	
                      <div class="yd_jiange C_red">为了与旅客及时确认并联系，请再次确认订单信息</span>
                    </div>  
					
     <div class="yuding"><h1>入住信息</h1>
	 <div class="biaoge2">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20%" align="center" valign="middle" bgcolor="#FDF5EA">房间数：</td>
            <td align="left">&nbsp;<font class="frb" id="hc_roomNum">0</font>（间）</td>
            </tr>
          <tr>
            <td align="center" valign="middle" bgcolor="#FDF5EA">入住客人姓名：<br /></td>
            <td align="left" id="hc_guestNames"></td>
            </tr>
          <tr>
            <td align="center" valign="middle" bgcolor="#FDF5EA">入住客人类型：<br /></td>
            <td align="left" id="hc_guestTypes"></td>
         </tr>
          <tr>
            <td align="center" valign="middle" bgcolor="#FDF5EA">入住客人手机：<br /></td>
            <td align="left"  ><font id="hc_guestMoible"></font><font style="padding-left:10px;"  class="C_red" id="hc_isMoible"></font></td>
            </tr>
        </table>
	 </div>
	 </div>
	 
	 <div class="yuding">
		<h1>预订酒店信息</h1>
            <div class="biaoge2">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="20%" align="center" valign="middle" bgcolor="#FDF5EA">酒店名称：</td>
                  <td width="25%" align="left" >&nbsp;<%= hotelName %></td>
                  <td width="20%" align="center" bgcolor="#FDF5EA">房型：</td>
                  <td width="33%" align="left" >&nbsp;<%=roomTypeModel.RoomTypeName%></td>
                </tr>
                <tr>
                  <td align="center" valign="middle" bgcolor="#FDF5EA">住店日期：</td>
                  <td align="left" id="hc_inDate">&nbsp;<%=comeDate %>/<%=leaveDate %></td>
                  <td align="center" bgcolor="#FDF5EA">支付方式：</td>
                  <td align="left" >&nbsp;<%=payType %></td>
                </tr>
                <tr>
                  <td align="center" valign="middle" bgcolor="#FDF5EA">其他要求：</td>
                  <td colspan="3" align="left" id="hc_special">&nbsp; </td>
                </tr>
              </table>
            </div>
                <h1>价格清单</h1>
                <div class="biaoge2" id="hc_priceList">
                
                </div>
	 		</div>
	 	
	 <div class="yuding"><h1>联系人信息</h1>
<div class="biaoge2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="13%" align="center" class="pandl">姓名：</th>
    <td width="20%" align="center" class="pandl" id="hc_cName"></td>
    <th width="13%" align="center" class="pandl" >手机：</th>
    <td width="20%" align="center" class="pandl" id="hc_cMoible"></td>
    <th width="13%" align="center" class="pandl">座机：</th>
    <td width="20%" align="center" class="pandl" id="hc_cTel"></td>
  </tr>
</table>
</div>
<ul class="btn02">
  <li><a href="javascript:;" onclick="return HotelBook.save();"><img src="<%=ImageServerUrl%>/Images/hotel/qrtijiaobtn.gif" width="128" height="35" border="0" /></a></li>
  <li><a href="javascript:;" onclick="return HotelBook.update();"><img src="<%=ImageServerUrl%>/Images/hotel/backbtn.gif" border="0" /></a></li>
  <li style="width:90px; height:35px; line-height:35px; display:none;"  id="hb_mess">正在提交订单…</li>
  <div class="clear"></div>
</ul>

	 </div>
	                </div>
                    <!--sidebar02SearchC end-->
              </div>
                    </div>
         </div>
          <!--sidebar02 end-->

         </div>
         
         <script type="text/javascript">
             $(document).ready(function() {
                 $("#hb_selRoom").val("1");
             });
             var HotelBook = {
                 isFirst: true, //第一次提交表单
                 //修改房间数量
                 changeRoom: function() {
                     var roomNum = $("#hb_selRoom").val(); //当前房间数
                     var oldRoomNum = $("#hb_trCustList").nextAll("tr").length - 1; //原来房间数
                     var addNum = Math.abs(roomNum - oldRoomNum);
                     if (roomNum > oldRoomNum) {//添加游客
                         var firstSelect = $("#hb_selCustomer");
                         var theValue = firstSelect.val();
                         var selCusts = firstSelect.val("0").html();
                         firstSelect.val(theValue);
                         for (var i = 1; i <= addNum; i++) {
                             $("#hb_trArrive").before("<tr><td align=\"center\" ><select onchange=\"return HotelBook.changeGuest(this);\" name=\"hb_selCustomer\">" + selCusts + "</select></td><td align=\"left\" class=\"pandl\"><input name=\"hb_txtGuestName\" type=\"text\" class=\"inputhui\" size=\"10\" /> <font color=\"#FF0000\"> *</font> </td><td align=\"center\"><select name=\"hb_selGuestType\"><option value=\"0\" selected=\"selected\">内宾</option><option value=\"1\">外宾</option></select></td><td></td></tr>");
                         }

                     }
                     else if (roomNum < oldRoomNum) {//减少游客
                         for (var i = 1; i <= addNum; i++) {
                             $("#hb_trArrive").prev("tr").remove();
                         }
                     }
                 },

                 //联系人信息与入住人相同
                 checkContact: function(tar) {
                     if ($("#hb_chkContact").attr("checked")) {
                         $("#hb_cName").val($("#hb_txtGuestName").val()).attr("readonly", "readonly");
                         $("#hb_cMoible").val($("#hb_chkGuestMoible").val()).attr("readonly", "readonly");
                     }
                     else {
                         if (tar && tar == "chk") {
                             $("#hb_cName").val("").removeAttr("readonly");
                             $("#hb_cMoible").val("").removeAttr("readonly");
                         }
                     }
                 },
                 //选择常旅客
                 changeGuest: function(tar_sel, first) {
                     var tarObj = $(tar_sel);
                     var guestName = tarObj.find("option:selected").html();
                     tarObj.parent().next("td").find("input[name='hb_txtGuestName']").val(guestName == "请选择" ? "" : guestName);
                     if (first && first == 1)
                         tarObj.closest("tr").find("#hb_chkGuestMoible").val(tarObj.find("option:selected").attr("tel"));
                     HotelBook.checkContact();
                 },
                 //重新填写
                 clearOrder: function() {
                     $("#hb_selRoom").val("1");
                     $("#hb_selRoom").change();
                     $("#hb_chkContact").removeAttr("checked");
                     $("#contact_mess").find("input[type='text']").val("");
                     $("#hb_selIsSmoke").val("无要求");
                     $("#hb_selIsBreakfast").val("无要求");
                     $("#hb_chkFloor").removeAttr("checked");
                     $("#hb_chkRoom").removeAttr("checked");
                     $("#hb_txtGuestName").val("");
                     $("#hb_chkIsMoible").removeAttr("checked");
                     $("#hb_txtGuestName").val("");
                     $("#hb_chkGuestMoible").val("");
                     $("#hb_selETime").val("12");
                     $("#hb_selLTime").val("18");
                     $("#hb_selCustomer").val("0");
                     $("#hb_selGuestType1").val("0");
                     return false;
                 },
                 //返回修改订单
                 update: function() {
                     $("#div_book").css("display", ""); //隐藏预定页
                     $("#div_check").css("display", "none"); //显示审核页
                     return false;
                 },
                 //审核订单
                 checkOrder: function() {

                     var mess = "";
                     var pnum = 0;
                     $("input[name='hb_txtGuestName']").each(function() {
                         if ($.trim($(this).val()) == "")
                             pnum++;
                     });
                     if (pnum > 0)
                         mess += "请填写完整旅客姓名\n";
                     if ($.trim($("#hb_chkGuestMoible").val()) == "") {
                         mess += "请填写短信通知的手机号码\n";
                     }
                     else if (!/^(13|15|18|14)\d{9}$/.test($.trim($("#hb_chkGuestMoible").val()))) {
                         mess += "短信通知的手机号码格式不正确\n";
                     }
                     if ($.trim($("#hb_cName").val()) == "")
                         mess += "请填写联系人姓名\n";
                     if ($.trim($("#hb_cMoible").val()) == "")
                         mess += "请填写联系人手机\n";
                     else if (!/^(13|15|18|14)\d{9}$/.test($.trim($("#hb_cMoible").val())))
                         mess += "联系人的手机格式不正确\n";
                     if ($.trim($("#hb_cArea").val()) == "" || $.trim($("#hb_cTel").val()) == "")
                         mess += "请填写联系人座机\n";
                     var intHour = parseInt($("#hb_selLTime").val()) - parseInt($("#hb_selETime").val());
                     if (intHour > 6 || intHour < 0)
                         mess += "到达时间不能相差6个小时以上\n";
                     if (mess != "") {
                         alert(mess);
                         return false;
                     }

                     $("#hc_roomNum").html($("#hb_selRoom").val()); //设置房间数
                     var gNames = "&nbsp;";
                     $("input[name='hb_txtGuestName']").each(function() {
                         gNames += $(this).val() + ",";
                     });
                     if (gNames != "")
                         gNames = gNames.substring(0, gNames.length - 1);
                     $("#hc_guestNames").html("<div  style='word-wrap:break-word;width:530px;overflow:hidden'>" + gNames + "</div>"); //设置客户姓名
                     var gTypes = "&nbsp;";
                     $("select[name='hb_selGuestType']").each(function() {
                         gTypes += $(this).find("option:selected").html() + ",";
                     });
                     if (gTypes != "")
                         gTypes = gTypes.substring(0, gTypes.length - 1);
                     $("#hc_guestTypes").html(gTypes); //设置客户类型
                     $("#hc_guestMoible").html("&nbsp;" + $("#hb_chkGuestMoible").val()); //设置入住客人手机
                     $("#hc_isMoible").html($("#hb_chkIsMoible").attr("checked") ? "手机通知" : ""); //设置是手机通知
                     //设置特殊要求
                     var smoke = $("#hb_selIsSmoke").val();
                     var floor = $("#hb_chkFloor").attr("checked") ? $("#hb_chkFloor").val() : "";
                     var breakf = $("#hb_selIsBreakfast").val();
                     var room = $("#hb_chkRoom").attr("checked") ? $("#hb_chkRoom").val() : "";
                     $("#hc_special").html((smoke == "无要求" ? "" : "&nbsp;尽量无烟房间 ") + (floor == "" ? "" : (floor + "&nbsp;")) + (breakf == "无要求" ? "" : "每天每间加一早&nbsp;") + room);
                     $("#hc_priceList").html($("#hb_priceList2").html()); //设置价格清单
                     $("#hc_cName").html($("#hb_cName").val()); //联系人姓名
                     $("#hc_cMoible").html($("#hb_cMoible").val()); //联系人手机
                     var strfen = $.trim($("#hb_cFen").val());
                     var strfen1 = strfen == "" ? "" : ("-" + strfen);
                     $("#hc_cTel").html($("#hb_cArea").val() + "-" + $("#hb_cTel").val() + strfen1); //联系人电话
                     $("#div_book").css("display", "none"); //隐藏预定页
                     $("#div_check").css("display", "block"); //显示审核页

                 },
                 //保存订单
                 save: function() {
                     //如果是第一次则让其提交表单
                     if (HotelBook.isFirst) {
                         $("#hb_mess").show();
                         HotelBook.isFirst = false; //设置已提交
                         $.ajax(
	                  {
	                      url: "/HotelManage/HotelBook.aspx?hotelCode=<%=hotelCode %>&comeDate=<%=comeDate%>&leaveDate=<%=leaveDate%>&roomCode=<%=roomCode%>&vendorCode=<%=vendorCode %>&ratePlanCode=<%=ratePlanCode %>&IsLogin=<%=IsLogin%>&ImageServerPath=<%=ImageServerPath%>",
	                      data: $("#hb_divOrder").find("*").serialize() + "&method=save",
	                      dataType: "json",
	                      cache: false,
	                      type: "post",
	                      success: function(result) {
	                          $("#hb_mess").hide();
	                          HotelBook.isFirst = true; //恢复第一次提交
	                          if (result.success == "1") {
	                              window.location = "/HotelManage/HotelComplete.aspx?CityID=<%=CityId %>&comeDate=<%=comeDate%>&leaveDate=<%=leaveDate%>&resOrderId=" + result.message;
	                          }
	                          else {
	                              alert(result.message);
	                          }
	                      },
	                      error: function() {
	                          $("#hb_mess").hide();
	                          alert("下单失败!");
	                          HotelBook.isFirst = true; //恢复第一次提交
	                      }
	                  });

                     }
                     return false;
                 }

             }
         </script>
      
</asp:Content>

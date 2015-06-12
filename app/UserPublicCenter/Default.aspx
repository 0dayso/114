<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="UserPublicCenter.Index" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="/WebControl/PageHead.ascx" TagName="PageHead" TagPrefix="uc1" %>
<%@ Register Src="/WebControl/CityAndMenu.ascx" TagName="PageMenu" TagPrefix="uc2" %>
<%@ Register Src="/HomeControl/FrindLinkList.ascx" TagName="FrindLink" TagPrefix="uc3" %>
<%@ Register Src="/WebControl/PageFoot.ascx" TagName="PageFoot" TagPrefix="uc4" %>
<%@ Register Src="/HomeControl/GoldCompany.ascx" TagName="GoldC" TagPrefix="uc5" %>
<%@ Register Src="/HomeControl/RecommendProduct.ascx" TagName="RecomP" TagPrefix="uc6" %>
<%@ Register Src="/HomeControl/News.ascx" TagName="New" TagPrefix="uc7" %>
<%@ Register Src="/HomeControl/GuestsVisit.ascx" TagName="Guest" TagPrefix="uc8" %>
<%@ Register Src="/HomeControl/RecommendCompany.ascx" TagName="RecomC" TagPrefix="uc9" %>
<%@ Register Src="/HomeControl/Companys.ascx" TagName="Comp" TagPrefix="uc10" %>
<%@ Register Src="/HomeControl/Tickets.ascx" TagName="Ticket" TagPrefix="uc11" %>
<%@ Register Src="/HomeControl/Hotels.ascx" TagName="Hotel" TagPrefix="uc12" %>
<%@ Register Src="/HomeControl/RouteAreas.ascx" TagName="RouteArea" TagPrefix="uc13" %>
<%@ Register Src="/HomeControl/IndexRemind.ascx" TagName="IndexRemind" TagPrefix="uc14" %>
<%@ Register Src="HomeControl/Tickets.ascx" TagName="Tickets" TagPrefix="uc15" %>
<%@ Register Src="HomeControl/HotScenic.ascx" TagName="HotScenic" TagPrefix="uc16" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="aspnetForm" name="aspnetForm" runat="server">
    <div id="divHotCitys" style="display: none; z-index: 10000; float: left;">
        <ul id="ulHotCitys">
        </ul>
    </div>
    <uc1:PageHead ID="PageHead1" runat="server" />
    <uc2:PageMenu ID="PageMenu1" runat="server" />
    <div class="px102">
    </div>
    <!--ͷ����Ϣ-->
    <div class="leftnav">
        <div class="leftnav_l">
            <div class="leftnav_lt">
            </div>
            <div class="leftnav_lc">
                <ul>
                    <li><a href="/xianlu_6_0">����ר��</a></li>
                    <li><a href="/xianlu_6_1">����ר��</a></li>
                    <li><a href="/xianlu_6_2">�ܱ߶���</a></li>
                    <li><a href="<%=EyouSoft.Common.URLREWRITE.Plane.PlaneDefaultUrl(CityId) %>">Ԥ����Ʊ</a></li>
                    <li><a href="http://hotel.tongye114.com/">���ʾƵ�</a></li>
                    <li><a href="/info">������Ϣ</a></li>
                    <li><a href="<%=EyouSoft.Common.URLREWRITE.tonghang.GetTongHangUrl(CityId.ToString()) %>">
                        �̼���¼</a></li>
                    <li id="liBox"><a href="javascript:void(0)">���ΰٱ���</a></li>
                </ul>
            </div>
        </div>
        <div class="zizinav" style="display: none; z-index: 3;">
            <div class="zizinavl">
                &nbsp;</div>
            <div class="zizinavli">
                <ul>
                    <li class="bufua">���ΰٱ���</li>
                    <li><a target="_blank" href="http://www.hao123.com/haoserver/kuaidi.htm" rel="nofollow">���ÿ��</a></li>
                    <li><a target="_blank" href="http://jipiao.kuxun.cn/?fromid=Kgocn-S1328241-T1076481" rel="nofollow">��Ʊ��ѯ</a></li>
                    <li><a target="_blank" href="http://www.tongye114.com/visa/Map.aspx">���ӵ�ͼ</a></li>
                    <li><a target="_blank" href="http://www.tongye114.com/visa/Weather.aspx">������ѯ</a></li>
                    <li><a target="_blank" href="http://www.tongye114.com/visa/Train.aspx" rel="nofollow">��·��ѯ</a></li>
                    <li><a target="_blank" href="http://www.tongye114.com/visaList">����ǩ֤</a></li>
                    <li><a target="_blank" href="http://qq.ip138.com/idsearch/" rel="nofollow">���֤</a></li>
                    <li><a target="_blank" href="http://www.ip138.com/sj/" rel="nofollow">�ֻ�</a></li>
                    <li><a target="_blank" href="http://www.enowinfo.com">���������</a></li>
                    <li><a target="_blank" href="http://hotel.kuxun.cn/?fromid=Kgocn-S1328241-T1216391" rel="nofollow">�ؼ۾Ƶ�</a></li>
                </ul>
            </div>
        </div>
        <div class="leftnav_c">
            <div class="leftnav_ct" id="newsSlider">
                <div class="num" style="z-index: 2;">
                    <ul id="ulTab">
                        <asp:Repeater ID="rptHotAdvForLi" runat="server">
                            <ItemTemplate>
                                <li>
                                    <%#Container.ItemIndex+1 %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <div class="container" style="position: relative; width: 564px; overflow: hidden;
                    height: 250px; z-index: 0;" id="hotDiv">
                    <div style="position: absolute; width: 2820px;" id="hotAdv">
                        <asp:Repeater ID="rptHotAdv" runat="server">
                            <ItemTemplate>
                                <div style="width: 564px; float: left;">
                                    <a href="<%# Eval("RedirectURL") %>">
                                        <img alt="<%# Eval("Title") %>" width="564px" height="249" src="<%# EyouSoft.Common.Domain.FileSystem+Eval("ImgPath") %>" /></a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="leftnav_cb">
                <div class="shishigq">
                    ʵʱ����</div>
                <div class="shifalist" id="nav_today">
                    <ul style="padding: 0;" class="supplys">
                        <%=supplysHtml%>
                    </ul>
                </div>
                <div class="sxanniu">
                    <a href="javascript:" class="shangan" id="btn1">&nbsp;</a> <a href="javascript:"
                        class="xiaan" id="btn2">&nbsp;</a>
                </div>
                <div class="fabugq">
                    <a href="/info" style="color: #FF6600; text-decoration: none;" target="_blank">��������</a></div>
            </div>
        </div>
        <div class="leftnav_r">
            <div class="dengluk">
                <ul class="login-text" runat="server" id="divYesLogin" visible="false">
                    <li>
                        <%=strLoginMessage%>
                    </li>
                </ul>
                <div class="dengluk_t" runat="server" id="divLogin" visible="true">
                    <div class="yonghuhu">
                        &nbsp;</div>
                    <input type="text" class="yonghu" id="u" name="u">
                    <span id="errU" style="color: Red; display: none;">*</span>
                    <div class="px10">
                    </div>
                    <div class="yonghuhu2">
                        &nbsp;</div>
                    <input type="hidden" id="vc" name="vc" />
                    <input type="password" class="yonghu mima" type="password" id="p" name="p" />
                    <span id="errP" style="color: Red; display: none;">*</span>
                    <div class="xcdl">
                        <span class="spanqian">
                            <input type="checkbox" checked="checked" value="" id="re" name="re">
                            �´��Զ���¼ </span><span><a target="_blank" href="/Register/FindPassWord.aspx">��������</a></span></div>
                    <div class="ljdl">
                        <a id="btnLogin" class="login-btn" onclick="loginF();" style="cursor: pointer">������¼</a><span
                            id="hidOn" style="color: Red; display: none;">���ڵ�¼��</span></div>
                    <div class="zcsj">
                        <a href="/Register/CompanyUserRegister.aspx">ע���̼�</a></div>
                </div>
                <!--ʵʱ��Ϣ���� -->
                <uc14:IndexRemind ID="IndexRemind1" runat="server" />
            </div>
        </div>
        <div class="faq">
            <div class="faq-title">
                <ul class="clearfix">
                    <li><a onmousemove="setTab(1,2)" id="two1" class="hover" href="javascript:void(0)">
                        ��վ����</a></li>
                    <li><a onmousemove="setTab(2,2)" id="two2" href="javascript:void(0)">����ͳ��</a></li>
                </ul>
            </div>
            <div class="faq-main">
                <div id="con_two_1">
                    <ul>
                        <%=noticeHtml%>
                    </ul>
                </div>
                <div style="display: none;" id="con_two_2">
                    <ul>
                        <li><a href="javascript:void(0)">��վע�ṫ˾<strong style="color: #0080C8"><asp:Literal
                            ID="lbregCount" runat="server"></asp:Literal></strong>
                            ��</a></li>
                        <li><a href="javascript:void(0)">��վע���Ա<strong style="color: #0080C8"><asp:Literal
                            ID="lbrouteCount" runat="server"></asp:Literal></strong>��</a></li>
                        <li><a href="javascript:void(0)">��վ������·<strong style="color: #0080C8"><asp:Literal
                            ID="lbMqCount" runat="server"></asp:Literal></strong>��</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="px10">
    </div>
    <div class="glcx">
        <!-- ɢƴ����-->
        <%if (!isExtendSite)
          { %>
        <uc13:RouteArea ID="routeArea1" runat="server" />
        <!--������ҵ,�Ƽ���Ʒ-->
        <div class="glcx_r">
            <uc5:GoldC ID="goldc1" runat="server" />
            <uc6:RecomP ID="RecomP1" runat="server" />
        </div>
        <div class="px10">
        </div>
        <%}
          else
          { %><!--��ͨ��վ��ʾ������-->
        <uc10:Comp ID="Comp1" runat="server" /><%} %>
        <div style="width: 970px; height: 70px; overflow: hidden;">
            <%=bannerAdv %></div>
        <div class="px10">
        </div>
    </div>
    <!--��Ʊ����-->
    <div class="changle">
        <uc16:HotScenic ID="HotScenic1" runat="server" />
        <uc15:Tickets ID="Tickets1" runat="server" />
        <div class="ggban">
            <div>
                <a title="����ר��" href="<%=EyouSoft.Common.Domain.UserPublicCenter %>/TourList_134_<%=CityId %>">
                    <img width="238px" height="135px" src="<%=EyouSoft.Common.Domain.ServerComponents%>/images/ynzx.jpg"></a></div>
            <div class="px10">
            </div>
            <div>
                <a href="http://www.enowinfo.com">
                    <img  title="����ͨ" height="75px;" src="<%=EyouSoft.Common.Domain.ServerComponents%>/images/new2011/index/{BFF352F6-F720-4E83-97E8-E921AA5C9D35}.jpg"></a></div>
        </div>
        <div style="clear: both">
        </div>
    </div>
    <div class="px10">
    </div>
    <!--�ײ���Ѷ-->
    <div class="mainbox04 fixed">
        <uc7:New ID="new1" runat="server" />
        <uc8:Guest ID="guest1" runat="server" />
        <uc9:RecomC ID="recomc1" runat="server" />
    </div>
    <!--��������-->
    <%=partnerlinks%>
    <!--�ײ���Ȩ -->
    <uc4:PageFoot ID="PageFoot1" runat="server" />

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("blogin") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("Switchable") %>"></script>

    <script type="text/javascript">
        //����tab�л�
        function setTab(cursel, n) {
            for (i = 1; i <= n; i++) {
                var menu = document.getElementById("two" + i);
                var con = document.getElementById("con_two_"+ i);
                menu.className = i == cursel ? "tabtwo-on" : "";
                con.style.display = i == cursel ? "block" : "none";
            }
        }
        //��¼
        function loginF() {
            var UserName = $.trim($("#u").val()), PassWord = $.trim($("#p").val());
            if (UserName == "") { $("#errU").show(); }
            if (PassWord == "") { $("#errP").show(); }
            if (UserName != "" && PassWord != "") {
                $("#btnLogin").closest("div").removeClass().addClass("islogin");
                $("#btnLogin").hide();
                $("#hidOn").show();
                var url = '<%=Request.ServerVariables["SCRIPT_NAMT"] %>?CityId=<%=CityId %>';
                blogin.ssologinurl = "<%=EyouSoft.Common.Domain.PassportCenter %>";
                blogin(document.getElementById("aspnetForm"), "", url, function(message) {
                    alert(message); $("#btnLogin").show(); $("#hidOn").hide();
                    $("#p").val("").focus();
                    $("#btnLogin").closest("div").removeClass().addClass("ljdl");
                    $("#btnLogin").attr("disabled", "").css("cursor", "pointer");
                });
            } return false;
        }
        var t;
        $(function() {
            $("#liBox").mouseover(function() {
                $(".zizinav").show();
            });
            $("#liBox").mouseout(function() {
                t = setTimeout(hidediv, 200);
            });
            function hidediv() {
                $(".zizinav").hide();
            }
            $(".zizinav").mouseover(function() {
                $(this).show();
                clearTimeout(t);
            });
            $(".zizinav").mouseout(function() {
                $(".zizinav").hide();
            });
            //����ͼƬ�ֻ�
            var hotTab = $('#ulTab').switchable('#hotAdv>div', { currentCls: 'on', circular: true, steps: 1, visible: 1, triggers: "li", triggerType: "click", effect: "scroll" }).autoplay({ interval: 5, api: true });
            $("#ulTab li").click(function() {
                hotTab.pause();
            });

            $("#newsSlider").hover(function() { }, function() { hotTab.play(); });

            //�󶨵�¼�س�
            $("#u,#p").bind("keypress", function(e) {
                if (e.keyCode == 13) {
                    loginF();
                    return false;
                }
            });
            //�û������뽹��
            $("#u").focus(function() { $("#errU").hide(); }).blur(function() { if ($.trim($(this).val()) == "") { $("#errU").show(); } });
            $("#p").focus(function() { $("#errP").hide(); }).blur(function() { if ($.trim($(this).val()) == "") { $("#errP").show(); } });


            //����Ӧ��@Mr.Think
            var _wrap = $('ul.supplys'); //�����������
            var _interval = 3000; //���������϶ʱ��
            var _moving; //��Ҫ����Ķ���
            _wrap.hover(function() {
                clearInterval(_moving); //������ڹ���������ʱ,ֹͣ����
            }, function() {
                _moving = setInterval(function() {
                    var _field = _wrap.find('li:first'); //�˱������ɷ����ں�����ʼ��,li:firstȡֵ�Ǳ仯��
                    var _h = _field.height(); //ȡ��ÿ�ι����߶�
                    _field.animate({ marginTop: -_h + 'px' }, 600, function() {//ͨ��ȡ��marginֵ,���ص�һ��
                        _field.css('marginTop', 0).appendTo(_wrap); //���غ�,�����е�marginֵ����,�����뵽���,ʵ���޷����
                    })
                }, _interval)//�������ʱ��ȡ����_interval
            }).trigger('mouseleave'); //��������ʱ,ģ��ִ��mouseleave,���Զ�����
        });

        (function($) {
            $.fn.extend({
                Scroll: function(opt, callback) {
                    //������ʼ��
                    if (!opt) var opt = {};
                    var _btnUp = $("#" + opt.up); //Shawphy:���ϰ�ť
                    var _btnDown = $("#" + opt.down); //Shawphy:���°�ť
                    var timerID;
                    var _this = this.eq(0).find("ul:first");
                    var lineH = _this.find("li:first").height(), //��ȡ�и�
                        line = opt.line ? parseInt(opt.line, 10) : parseInt(this.height() / lineH, 10), //ÿ�ι�����������Ĭ��Ϊһ�������������߶�
                        speed = opt.speed ? parseInt(opt.speed, 10) : 900; //���ٶȣ���ֵԽ���ٶ�Խ�������룩
                    timer = opt.timer //?parseInt(opt.timer,10):3000; //������ʱ���������룩
                    if (line == 0) line = 1;
                    var upHeight = 0 - line * lineH;
                    //��������
                    var scrollUp = function() {
                        _btnUp.unbind("click", scrollUp); //Shawphy:ȡ�����ϰ�ť�ĺ�����
                        _this.animate({
                            marginTop: upHeight
                        }, speed, function() {
                            for (i = 1; i <= line; i++) {
                                _this.find("li:first").appendTo(_this);
                            }
                            _this.css({ marginTop: 0 });
                            _btnUp.bind("click", scrollUp); //Shawphy:�����ϰ�ť�ĵ���¼�
                        });
                    }
                    //Shawphy:���·�ҳ����
                    var scrollDown = function() {
                        _btnDown.unbind("click", scrollDown);
                        for (i = 1; i <= line; i++) {
                            _this.find("li:last").show().prependTo(_this);
                        }
                        _this.css({ marginTop: upHeight });
                        _this.animate({
                            marginTop: 0
                        }, speed, function() {
                            _btnDown.bind("click", scrollDown);
                        });
                    }
                    _btnUp.css("cursor", "pointer").click(scrollUp)
                    _btnDown.css("cursor", "pointer").click(scrollDown)
                }
            })
        })(jQuery);
        $(document).ready(function() {
            $("#nav_today").Scroll({ line: 2, speed: 900, timer: 3000, up: "btn1", down: "btn2" });
        });
    </script>
    </form>
</body>
</html>

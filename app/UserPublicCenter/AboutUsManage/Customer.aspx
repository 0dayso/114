<%@ Page Title="客服中心" Language="C#" MasterPageFile="~/MasterPage/PublicCenterMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="UserPublicCenter.AboutUsManage.Customer" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Register Src="AboutUsHeadControl.ascx" TagName="AboutUsHeadControl" TagPrefix="uc1" %>
<%@ Register Src="AboutUsLeftControl.ascx" TagName="AboutUsLeftControl" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
    <link href="<%=CssManage.GetCssFilePath("body") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("gongqiu") %>" rel="stylesheet" type="text/css" />
    <div id="header">
        <uc1:AboutUsHeadControl ID="AboutUsHeadControl1" runat="server" />
    </div>
    <table width="970" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="142" valign="top" style="background: #FFF7D7;">
                <uc2:AboutUsLeftControl ID="AboutUsLeftControl1" runat="server" />
            </td>
            <td width="10">&nbsp;
                
            </td>
            <td width="818" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="background: #F6F6F6; padding: 5px;">
                            <img src="<%=ImageServerPath %>/images/UserPublicCenter/companytu.gif" width="811" />
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="maintop10">
                    <tr>
                        <td width="10%" style="background: url(<%=ImageServerPath %>/images/UserPublicCenter/companyleft.gif) no-repeat left top;
                            height: 10px;">
                        </td>
                        <td width="90%" style="background: #F6F6F6; border: 1px solid #E5E5E5; border-bottom: 0px;
                            border-left: 0px;">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background: #F6F6F6;">
                    <tr>
                        <td style="padding: 10px 38px 18px 38px; text-align: left; line-height: 24px;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="<%=ImageServerPath %>/images/UserPublicCenter/kefu1.gif" width="126" height="29" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;杭州易诺客服中心作为公司客户服务系统的基础。始终把客户放在第一位，本着服务好“客户的客户”的服务理念。成立至今一贯坚持以“三心”——热心、耐心和责任心为服务标准，为广大客户提供主动热情、周到细致、高效快捷的优质服务。经过多年发展，客服中心现已拥有了一批专业素质高、经验丰富的客服人员，并建立了标准化的服务体系，对服务各环节进行严格控制，保证服务质量，增加客户满意度。<br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="<%=ImageServerPath %>/images/UserPublicCenter/kefu2.gif" width="217" height="29" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;微笑（Smile）<br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;迅速（Speed）
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;真诚（Sincerity）
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;满意（Satisfaction）<br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="<%=ImageServerPath %>/images/UserPublicCenter/kefu4.gif" width="134" height="29" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;<span class="hui14"><strong>销售经理</strong></span><br />
                                        <table border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
                                            <tr>
                                                <td width="114" valign="top">
                                                    <p align="center">&nbsp;
                                                  </p>
                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        销售经理
                                                    </p>
                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        固定电话
                                                    </p>
                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        移动电话
                                                    </p>
                                                </td>
                                                <td width="114" align="center" valign="top">
                                                    <p align="center">联系MQ </p>
                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        联系QQ</p>
                                                </td>
                                            </tr>
                                            <tr>
                      <td height="25" align="center">北京地区</td>
                      <td align="center">郑经理</td>
                      <td align="center">0571-56893765</td>
                      <td align="center">13857149521</td>
                      <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=14229')" title="点击MQ洽谈！">14229 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a></td>
                      <td align="center"><a target=blank href=tencent://message/?uin=834971866&Site=qq&Menu=yes title="点击这里给我发消息">834971866 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a></td>
                    </tr>
                    <tr>
                      <td height="25" align="center"> 上海地区 </td>
                      <td align="center">项经理</td>
                      <td align="center">0571-56892803</td>
                      <td align="center">13958018904</td>
                      <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=23209')" title="点击MQ洽谈！">23209 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a></td>
                      <td align="center"><a target=blank href=tencent://message/?uin=569995625&Site=qq&Menu=yes title="点击这里给我发消息">569995625 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a></td>
                    </tr>
                    <tr>
                      <td height="25" align="center"> 广东地区  </td>
                      <td align="center">沈经理</td>
                      <td align="center">020-22075851/2</td>
                      <td align="center">13828443009</td>
                      <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=32473')" title="点击MQ洽谈！">32473 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a></td>
                      <td align="center"><a target=blank href=tencent://message/?uin=1241073464&Site=qq&Menu=yes title="点击这里给我发消息">1241073464 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a></td>
                    </tr>
                    <tr>
                      <td height="25" align="center"> 江苏地区  </td>
                      <td align="center">余经理 </td>
                      <td align="center">0571-56892805</td>
                      <td align="center">13757187047</td>
                      <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=13648')" title="点击MQ洽谈！">13648 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a></td>
                      <td align="center"><a target=blank href=tencent://message/?uin=1124632860&Site=qq&Menu=yes title="点击这里给我发消息">1124632860 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a></td>
                    </tr>
                    <tr>
                      <td height="25" align="center"> 山东地区  </td>
                      <td align="center">张经理 </td>
                      <td align="center">0571-56892335</td>
                      <td align="center">13777825083</td>
                      <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=10472')" title="点击MQ洽谈！">10472 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a></td>
                      <td align="center"><a target=blank href=tencent://message/?uin=511262932&Site=qq&Menu=yes title="点击这里给我发消息">511262932 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a></td>
                    </tr>
                    <tr>
                      <td height="25" align="center"> 浙赣闽大区  </td>
                      <td align="center">项经理 </td>
                      <td align="center">0571-56892803</td>
                      <td align="center">13958018904</td>
                      <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=23209')" title="点击MQ洽谈！">23209 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a></td>
                      <td align="center"><a target=blank href=tencent://message/?uin=569995625&Site=qq&Menu=yes title="点击这里给我发消息">569995625 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a></td>
                    </tr>
                                        </table>
                                        <br />
                                        <span class="hui14"><strong>&nbsp;&nbsp;&nbsp;&nbsp;客户中心</strong></span>
                                        <table border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
                                            <tr>
                                                <td width="114" valign="top">
                                                    <p align="center">&nbsp;                                                        </p>                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        客服专员                                                    </p>                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        固定电话                                                    </p>                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        联系MQ</p>                                                </td>
                                                <td width="114" valign="top">
                                                    <p align="center">
                                                        联系QQ</p>                                                </td>
                                            </tr>
                                           <tr>
    <td height="25" align="center"> 北京地区 </td>
    <td align="center"> 钟小姐</td>
    <td align="center" > 0571- 56883767 </td>
    <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=13750')" title="点击MQ洽谈！">13750 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center"><a target="blank" href="tencent://message/?uin=897122920&amp;Site=qq&amp;Menu=yes" title="点击这里给我发消息">897122920 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
                                          </tr>
  <tr>
    <td height="25" align="center" > 上海地区 </td>
    <td align="center" > 刘小姐</td>
    <td align="center"> 0571-56893747 </td>
    <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=28260')" title="点击MQ洽谈！">28260 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center" ><a target="blank" href="tencent://message/?uin=1454801581&amp;Site=qq&amp;Menu=yes" title="点击这里给我发消息">1454801581 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
  <tr>
    <td height="25" align="center" > 广东地区 </td>
    <td align="center" > 刘小姐</td>
    <td align="center"> 0571-56893747 </td>
    <td align="center"> <a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=28260')" title="点击MQ洽谈！">28260 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center" ><a target=blank href=tencent://message/?uin=956195408&Site=qq&Menu=yes title="点击这里给我发消息">956195408 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
  <tr>
    <td height="25" align="center"  > 江苏地区</td>
    <td align="center">陈小姐</td>
    <td align="center">0571-56892806 </td>
    <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=28939')" title="点击MQ洽谈！">28939 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center"  ><a target=blank href=tencent://message/?uin=6649847&Site=qq&Menu=yes title="点击这里给我发消息">6649847 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a></td>
  </tr>
  <tr>
    <td height="25" align="center"  > 山东地区 </td>
    <td align="center"> 韩小姐</td>
    <td align="center"> 0571-56892337 </td>
    <td align="center"> <a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=10445')" title="点击MQ洽谈！">10445 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center"><a target=blank href=tencent://message/?uin=468047420&Site=qq&Menu=yes title="点击这里给我发消息">468047420 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
  <tr>
    <td height="25"   align="center"  >浙赣闽大区</td>
    <td align="center"> 钟小姐</td>
    <td align="center" > 0571- 56883767 </td>
    <td align="center"> <a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=13750')" title="点击MQ洽谈！">13750 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center"><a target=blank href=tencent://message/?uin=897122920&Site=qq&Menu=yes title="点击这里给我发消息">897122920 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
  <tr>
    <td height="25"   align="center"  >湖南地区</td>
    <td align="center"> 钟小姐</td>
    <td align="center" > 0571- 56883767 </td>
    <td align="center"> <a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=13750')" title="点击MQ洽谈！">13750 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center"><a target=blank href=tencent://message/?uin=897122920&Site=qq&Menu=yes title="点击这里给我发消息">897122920 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
  <tr>
    <td height="25" align="center"  >东北大区</td>
    <td align="center"  > 陈小姐</td>
    <td align="center"  > 0571-56898348 </td>
    <td align="center"  > <a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=28939')" title="点击MQ洽谈！">28939 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center" > <a target=blank href=tencent://message/?uin=1006649847&Site=qq&Menu=yes title="点击这里给我发消息">1006649847 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
  <tr>
    <td height="25" align="center"  >西南大区</td>
    <td align="center" > 刘小姐</td>
    <td align="center"> 0571-56892806 </td>
    <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=28260')" title="点击MQ洽谈！">28260 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center" ><a target="blank" href="tencent://message/?uin=956195408&amp;Site=qq&amp;Menu=yes" title="点击这里给我发消息">956195408 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
  <tr>
    <td height="25" align="center"  > 机票客服专线</td>
    <td align="center">廖小姐</td>
    <td align="center">0571-56893761</td>
    <td align="center"><a href="javascript:void(0)" onclick="window.open('http://im.tongye114.com:9000/webmsg.cgi?version=1&amp;uid=27440')" title="点击MQ洽谈！">27440 <img src="<%=ImageServerPath %>/images/MQWORD.gif" /></a> </td>
    <td align="center" ><a target=blank href=tencent://message/?uin=1305218445&Site=qq&Menu=yes title="点击这里给我发消息">1305218445 <img src="<%=ImageServerPath %>/images/UserPublicCenter/sqq.gif" /></a> </td>
  </tr>
                                        </table>
                                        <span class="huise">*客服经理何小姐 电话：0571-56884627 手机：13345811080 QQ：1397604721</span><br />
                                        <br />
                                        <span class="hui14"><strong>其他联系方式</strong></span>
                                        <br />
                                        公司地址：浙江省杭州市塘苗路18号 B座4层
                                        <br />
                                        电话：0571-56884627 传真：0571-56893768
                                        <br />
                                        网址：www.enowinfo.com 邮政编码 310012<br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <img src="<%=ImageServerPath %>/images/UserPublicCenter/kefu3.gif" width="134" height="29" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;1 、我们承诺在交易全程照顾您。
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;2 、我们承诺为您提供公平，公正，透明的交易平台。
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;3 、我们承诺在您需要的时候能够快捷地找到我们，我们始终在您身边。
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;4 、我们承诺一心一意地为您提供舒适、满意的服务。
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;5 、我们承诺用公平公正的态度处理您的交易纠纷，保障您在交易过程中的权益。<br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="517NATicket.aspx.cs" Inherits="IMFrame.Ticket._17NATicket" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>机票</title>
    <link rel="stylesheet" type="text/css" href="<%=CssManage.GetCssFilePath("autocomplete") %>" />
    <style type="text/css">
        BODY
        {
            color: #333;
            font-size: 12px;
            font-family: "宋体" ,Arial, Helvetica, sans-serif;
            text-align: center;
            background: #fff;
            margin: 0px;
        }
        img
        {
            border: thin none;
        }
        table
        {
            border-collapse: collapse;
            margin: 0px auto;
            padding: 0px auto;
        }
        TD
        {
            font-size: 12px;
            color: #0E3F70;
            line-height: 20px;
            font-family: "宋体" ,Arial, Helvetica, sans-serif;
        }
        *
        {
            margin: auto 0;
            padding: 0;
        }
        .inputk
        {
            border: 1px #4592BF solid;
            background: url(<%=ImageServerUrl %>/IM/images/jpinput2.gif) repeat-x;
            width: 60px;
            height: 17px;
            padding: 2px 0 0 2px;
        }
        .inputtxt
        {
            border: 0px #ffffff solid;
            background: url(<%=ImageServerUrl %>/IM/images/jpinput.gif);
            width: 94px;
            height: 19px;
            padding: 2px 0 0 2px;
        }
        a.jp
        {
            color: #083971;
            text-decoration: none;
        }
        a.jp:visited
        {
            color: #083971;
            text-decoration: none;
        }
        a.jp:hover
        {
            color: #f00;
            text-decoration: underline;
        }
        /*热点城市CSS*//*容器*/#divHotCitys
        {
            display: none;
            position: absolute;
            width: 181px;
            border: 1px solid #cccccc;
            margin: 0px auto;
            background: #ffffff;
        }
        #ulHotCitys
        {
            margin: 0px;
            padding: 0px;
            list-style-type: none;
            color: #666666;
            overflow: hidden;
            width: 181px;
            margin: 0px auto;
            margin-top: 4px;
        }
        #ulHotCitys li
        {
            margin: 0px;
            padding: 0px;
            list-style-type: none;
            float: left;
            height: 24px;
            width: 60px;
            line-height: 24px;
        }
        /*提示信息*/#ulHotCitys li.li1
        {
            width: 160px;
            height: 32px;
            line-height: 32px;
            background: #f5f5f5;
            text-align: left;
        }
        /*关闭按钮*/#ulHotCitys li.li2
        {
            width: 20px;
            height: 32px;
            line-height: 32px;
            background: #f5f5f5;
        }
        #ulHotCitys li.li2 a
        {
            overflow: hidden;
            display: block;
            text-decoration: none;
            color: #666666;
        }
        #ulHotCitys li.li2 a:hover
        {
            overflow: hidden;
            display: block;
            background: #f0f0f0;
            color: #666666;
        }
        /*间隔*/#ulHotCitys li.li3
        {
            width: 100%;
            height: 4px;
            line-height:4px;
        }
        /*城市列表*/#ulHotCitys li.list
        {
        }
        #ulHotCitys li.list a
        {
            overflow: hidden;
            display: block;
            text-decoration: none;
            color: #666666;
            text-align:center;
        }
        #ulHotCitys li.list a:hover
        {
            overflow: hidden;
            display: block;
            background: #ff9900;
            color: #ffffff;
        }
        /*未设置热点城市时的提示信息*/#ulHotCitys li.liNotHotCitys
        {
            width: 100%;
            height: 28px;
            line-height: 28px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table width="210" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="<%=ImageServerUrl %>/IM/images/jpheader.gif" width="210" height="80" alt="" />
            </td>
        </tr>
    </table>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("517ticketcore") %>"></script>

    <script type="text/javascript">
        ticketLKE.CityInputConfig.FromCityId = "txtFromCity";
        ticketLKE.CityInputConfig.ToCityId = "txtToCity";
        ticketLKE.TimeDateConfig.dateTimeControlId = "startDateTime";
        ticketLKE.TimeDateConfig.EnddateTimeControlId = "endDateTime";
    </script>

    <table width="210" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td height="141" valign="top" style="background: url('<%=ImageServerUrl %>/IM/images/jpmanbj.gif') no-repeat top;">
                <table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody><tr>
          <td height="96" align="center"><a target="_blank" href="http://vipjp.tongye114.com/Login/110/login.htm"><img width="197" height="90" border="0" src="<%=ImageServerUrl %>/IM/images/2_1.jpg"></a></td>
        </tr>
        <tr>
          <td height="41" align="center"><a target="_blank" href="http://vipjp.tongye114.com/Login/110/login.htm"><img width="144" height="36" src="<%=ImageServerUrl %>/IM/images/4.jpg"></a></td>
        </tr>
        <tr>
          <td align="center">VIP大客户注册及授信客户<br>
          服务电话:0571-56893746 <br>
QQ:<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1305218445 &amp;site=qq&amp;menu=yes" target="_blank">1305218445</a>
  

<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=34737111&amp;site=qq&amp;menu=yes" target="_blank">34737111</a>
</td>
        </tr>
      </tbody></table>
            </td>
            <div id="divHotCitys">
                <ul id="ulHotCitys">
                </ul>
            </div>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" bgcolor="#F6FFFF" style="line-height: 140%;">
                            <strong>客服</strong>
                            <%= Utils.GetMQ("27440")%><br />
                            电话：0571-56893761<br />
                            手机：15356126700
                        </td>
                    </tr>
                </table>
                <img src="<%=ImageServerUrl %>/IM/images/jpword.gif" width="210" height="180" alt="" />
            </td>
        </tr>
    </table>
    </form>

    <script type="text/javascript" src="/DatePicker/WdatePicker.js"></script>

    <script type="text/javascript">
        var HomePage = {
            onClickTitck:function(){
                if("<%=IsLogin %>"=="True"){
                    ticketLKE.FromMQPost("<%=mqID %>","<%=mqPass %>");
                }else{
                    alert("请您先登录!");
                    return false;
                }
               setTimeout(function(){
                    document.body.style.display="none";
                    document.body.style.display="";
                },10);
            },
            isShowEndDate:function(){
                var  radVoyageType= $("input[name='radVoyageType']:checked").val();
                if(radVoyageType==2){
                    $("#divEndDate").show();
                }else{
                     $("#divEndDate").hide();
                }
            }

        }
        $(function() {
            /*机票 BEGIN */
            HomePage.isShowEndDate();

            ticketLKE.initAutoComplete();
            ticketLKE.initHotCitys();

            ticketLKE.stringPort="<% = EyouSoft.Common.Domain.UserPublicCenter %>";
            
            $("#fromCity").click(function() {
                ticketLKE.showHotCitys(1);
                ticketLKE.hiddenDiv();
            });

            $("#toCity").click(function() {
                ticketLKE.showHotCitys(2);
                ticketLKE.hiddenDiv();
            });
            
            /*机票 END */

        });
        
    </script>
    <span style="display:none;"><script language="JavaScript" src="http://s126.cnzz.com/stat.php?id=1125215&amp;web_id=1125215&amp;show=pic" charset="gb2312" type="text/javascript"></script>&nbsp;<img height="0" alt="" width="0" border="0" src="http://zs7.cnzz.com/stat.htm?id=1125215&amp;r=http%3A//www.tongye114.com/Register/CompanyUserRegister.aspx&amp;lg=zh-cn&amp;ntime=0.67142400 1283503185&amp;repeatip=576&amp;rtime=4&amp;cnzz_eid=84357694-1283137261-&amp;showp=1024x768&amp;st=48&amp;sin=http%3A//www.tongye114.com/Register/CompanyUserRegister.aspx&amp;res=0" />
</span>
</body>
</html>

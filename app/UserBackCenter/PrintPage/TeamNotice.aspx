<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="TeamNotice.aspx.cs"
    Inherits="UserBackCenter.PrintPage.TeamNotice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>����֪ͨ��_ͬҵ114</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="<%=EyouSoft.Common.CssManage.GetCssFilePath("TeamNotice") %>" rel="Stylesheet"
        type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
        .style2
        {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table id="tbl_top" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 10px;">
        <tr>
            <td height="31" valign="bottom" bgcolor="#f5f5f5" style="border-bottom: 1px solid #DCAE30;">
                <table width="767" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="155" align="left">
                            �����м�ࣺ<a href="javascript:void(0)" onclick="printConfig.setLineHeight(true)">+�Ӵ�</a>
                            <a href="javascript:void(0)" onclick="printConfig.setLineHeight(false)">-��С</a>
                        </td>
                        <td width="154" align="center">
                            �����С��<a href="javascript:void(0)" onclick="printConfig.setFontSize(true)">+�Ӵ�</a>
                            <a href="javascript:void(0)" onclick="printConfig.setFontSize(false)">-��С</a>
                        </td>
                        <td width="173" align="right">
                            <a title="�Զ����� A4 ֽ�š���ӡʱ���ֱ���Զ�����ҳü��ҳ��Ϊ��,��������ַ��" href="<%=EyouSoft.Common.Domain.ServerComponents %>/PrintTemplate/printSetup.zip">
                                ��ӡ�ؼ���װ</a>
                        </td>
                        <td width="206" align="center" valign="bottom">
                            <a href="javascript:void(0)" onclick="printConfig.printPage()">
                                <img src="<%=ImageServerUrl %>/images/zjprint.gif" alt="ֱ�Ӵ�ӡ" width="80" height="22"
                                    border="0" /></a>
                            <asp:ImageButton ID="imgbtnToWord" OnClick="btnWord_Click" Width="80" Height="22"
                                runat="server" />
                        </td>
                        <td width="79" align="right">
                            <a href="javascript:void(0)" style="display: none;">��ӡԤ��</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table width="920" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
            <td width="200" align="right" valign="top">
                <table width="83%" id="tbl_Left" border="0" align="right" cellpadding="0" cellspacing="0"
                    style="margin-top: 40px;">
                    <tr>
                        <td align="left" style="color: #999999;">
                            ��ѡ��ѡ������ָ����Ŀ<br />
                            ��Ϊ���أ�����Ϊ��ʾ
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="color: #999999;">
                            <input type="checkbox" name="checkbox" onclick="meetAndCollectionContect(this)" />����/���ŷ�ʽ<br />
                            <input name="checkbox" type="checkbox" onclick="localInfo(this)" />�ؽ�����Ϣ<br />
                            <%-- <input type="checkbox" name="checkbox" onclick="checkbox" />������Ϣ<br />--%>
                            <input type="checkbox" name="checkbox2" onclick="serviceInfo(this)" />�����׼��˵��
                            <br />
                            <input type="checkbox" name="checkbox2" onclick="IncludeContent(this)" />������Ŀ
                            <br />
                            <input type="checkbox" name="checkbox25" onclick="NotContainService(this)" />����˵��
                            <br />
                            <input type="checkbox" name="checkbox25" onclick="SpeciallyNotice(this)" />��ע
                        </td>
                    </tr>
                </table>
            </td>
            <td width="720">
                <div id="printPage">
                    <table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" valign="bottom">
                                <strong><span class="headertitle">
                                    <%=CompanyName%></span>���֤��:<%=License%></strong>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-bottom: 3px solid #ff0000;">
                                <span style="font-size: 12px; line-height: 15px;"><strong>��ַ��</strong><%=CompanyAddress%><strong>
                                    ��ϵ�ˣ�</strong><%=TourContact%><span style="font-size: 12px; line-height: 15px;"><strong>
                                        �绰��</strong><%=TourContactTel%></span></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                            </td>
                        </tr>
                    </table>
                    <table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="25" align="center" class="cttitle">
                                ������֪ͨ�顷
                            </td>
                        </tr>
                    </table>
                    <table width="720" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                &nbsp;&nbsp;&nbsp;&nbsp;��λ�𾴵��������Ǻã���л�����ǵ�������֧�֣��ֽ��������ε��г����ݡ��Ӵ���׼��ע�������������ȷ���£�����������������ǩ����ǩ�֡�
                            </td>
                        </tr>
                    </table>
                    <table width="720" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000"
                        style="border: 1px solid #000000;">
                        <tr>
                            <td style="width: 70px;">
                                <strong>��·���ƣ�</strong>
                            </td>
                            <td >
                                <span class="bottow_side">
                                    <%=RouteName%></span>
                            </td>
                            <td>
                                <strong>��&nbsp;&nbsp;&nbsp;&nbsp;����</strong><span class="bottow_side">&nbsp;<%=TourDays%>&nbsp;</span>
                            </td>
                        </tr>
                        <tr runat="server" id="Tr_Traffic">
                            <td style="width: 70px; vertical-align:top;">
                                <strong>��ͨ���ţ�</strong>
                            </td>
                            <td colspan="2" style="width: 650px;">
                                <asp:Literal ID="ltrTraffic" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr runat="server" id="CollectionContect">
                            <td style="width: 70px;vertical-align:top;">
                                <strong>���Ϸ�ʽ��</strong>
                            </td>
                            <td colspan="2" style="width: 650px;">
                                <span class="bottow_side">
                                    <asp:Literal ID="ltrCollectionContect" runat="server"></asp:Literal></span>
                            </td>
                        </tr>
                        <tr runat="server" id="MeetTourContect">
                            <td style="width: 70px;vertical-align:top;">
                                <strong>���ŷ�ʽ��</strong>
                            </td>
                            <td colspan="2" style="width: 650px;">
                                <span class="bottow_side">
                                    <asp:Literal ID="ltrMeetTourContect" runat="server"></asp:Literal></span>
                            </td>
                        </tr>
                        <tr runat="server" id="localInfo">
                            <td style="width: 70px;vertical-align:top;">
                                <strong>�ؽ��磺</strong>
                            </td>
                            <td colspan="2" style="vertical-align: top;width: 650px;">
                                <table style="display: inline; width: auto;">
                                    <asp:Repeater runat="server" ID="rptTourLocalityInfo">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <%#Eval("LocalCompanyName")%>
                                                </td>
                                                <td>
                                                    &nbsp;&nbsp;�绰��<%#Eval("ContactTel")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="font-size: 12px; border-top: 1px solid #000000;">
                                ��ע�����г�Ϊ�ο��г̣���������ѯӪҵ���Ĺ�����Ա��
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="pnlNotQuickPlan" runat="server">
                        <table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000"
                            style="border-top: none; margin-left: auto; margin-right: auto;">
                            <tr>
                                <td align="center" bgcolor="#00D9D9" style="width: 70px; border:1px solid #000000; border-top:none;">
                                    <strong>�ճ�</strong>
                                </td>
                                <td align="center" bgcolor="#00D9D9" style="width: 650px; border:1px solid #000000;border-top:none;">
                                    <strong>�г̰���</strong>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="border: 0px;">
                                    <table width="720" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
                                        <asp:Repeater runat="server" ID="rptTeamNotice" OnItemDataBound="rptTeamNotice_ItemDataBound">
                                            <ItemTemplate>
                                                <tr>
                                                    <td rowspan="2" align="center" bgcolor="#E8FFFF" style="width: 70px;">
                                                        <strong>��<%#Eval("PlanDay")%>��<br />
                                                            (<asp:Literal ID="ltrWeekDay" runat="server"></asp:Literal>)</strong><br />
                                                        <asp:Literal ID="ltrPlanDate" runat="server"></asp:Literal>
                                                    </td>
                                                    <td align="left" valign="bottom" bgcolor="#E8FFFF">
                                                        <img src="<%=ImageServerUrl %>/images/xing.gif" width="8" height="11" />
                                                        �У�<%#Eval("PlanInterval")%>
                                                        <img src="<%=ImageServerUrl %>/images/zhu.gif" width="15" height="11" />
                                                        ס��<%#EyouSoft.Common.Function.StringValidate.TextToHtml(Eval("House").ToString())%>
                                                        <img src="<%=ImageServerUrl %>/images/chi.gif" width="10" height="11" />
                                                        �ͣ�<%#EyouSoft.Common.Function.StringValidate.TextToHtml(Eval("Dinner").ToString())%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap: break-word;">
                                                        <!--�г�����-->
                                                        &nbsp;<%#EyouSoft.Common.Function.StringValidate.TextToHtml(Eval("PlanContent").ToString())%>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        
                        <table width="720" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000">
                             
                             <tr  id="serviceInfo">
                                <td bgcolor="#F6E5A9" colspan="2" >
                                    <p>
                                        <strong>&nbsp;�����׼��˵�� </strong>
                                    </p>
                                </td>
                            </tr>          
                             <%if (!string.IsNullOrEmpty(ResideContent) || !string.IsNullOrEmpty(DinnerContent) || !string.IsNullOrEmpty(SightContent) || !string.IsNullOrEmpty(CarContent) || !string.IsNullOrEmpty(GuideContent) || !string.IsNullOrEmpty(TrafficContent) || !string.IsNullOrEmpty(IncludeOtherContent))
                              {%>                 
                            <tr id="IncludeContent">
                                <td align="right" bgcolor="#FCF7E4" style="width:70px;">
                                    ������Ŀ��
                                </td>
                                <td align="left" style="width:650px;word-wrap: break-word; overflow:hidden;">
                                    <%if (!string.IsNullOrEmpty(ResideContent))
                                      {%>
                                    ס�ޣ�<%=ResideContent%>
                                    <br />
                                    <%} if (!string.IsNullOrEmpty(DinnerContent))
                                      { %>
                                    �òͣ�<%=DinnerContent%>
                                    <br />
                                    <%} if (!string.IsNullOrEmpty(SightContent))
                                      { %>
                                    ���㣺<%=SightContent%>
                                    <br />
                                    <%} if (!string.IsNullOrEmpty(CarContent))
                                      { %>
                                    �ó���<%=CarContent%>
                                    <br />
                                    <%} if (!string.IsNullOrEmpty(GuideContent))
                                      { %>
                                    ���Σ�<%=GuideContent%>
                                    <br />
                                    <%} if (!string.IsNullOrEmpty(TrafficContent))
                                      { %>
                                    ������ͨ��<%=TrafficContent%>
                                    <br />
                                    <%} if (!string.IsNullOrEmpty(IncludeOtherContent))
                                      { %>
                                    ������<%=IncludeOtherContent%>
                                    <%} %>
                                </td>
                            </tr>
                            <%} %>
                            <%if(!string.IsNullOrEmpty(NotContainService)) {%>
                            <tr id="NotContainService">
                                <td align="right" bgcolor="#FCF7E4" style="width: 70px;">
                                    ����˵����
                                </td>
                                <td align="left" style="width:650px;word-wrap: break-word; overflow:hidden;">
                                    <%=NotContainService%>
                                </td>
                            </tr>
                            <%}if(!string.IsNullOrEmpty(SpeciallyNotice)){ %>
                            <tr id="SpeciallyNotice">
                                <td align="right" bgcolor="#FCF7E4" style="width: 70px;">
                                    ��ע��
                                </td>
                                <td align="left" style="width:650px;word-wrap: break-word; overflow:hidden;">
                                    <%=SpeciallyNotice%>
                                </td>
                            </tr>
                            <%} %>
                            <tr>
                                <td colspan="2" align="left" style="line-height: 18px;">
                                    ����Ϊ�ҹ�˾�ص��չˣ�����ر��ϽӴ�������
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="pnlQuickPlan" runat="server" Visible="false">
                        <table width="720" border="1" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000"
                            >
                            <tr>
                                <td align="left" style="border-top: none;">
                                    <strong>�г���Ϣ����أ�</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="word-wrap: break-word; overflow:hidden;">
                                    <%=QuickPlanContent%>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <table width="720" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000">
                        <tr>
                            <td height="100" valign="top" width="80" align="left">
                                �ο�ǩ�֣�
                            </td>
                            <td>
                                <div style="text-align: right; margin-right: 70px;" id="div_BuyCompany">
                                    <asp:Image ID="imgBuyCompany" Visible="false" runat="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <table id="tbl_Footer" width="100%" height="40" border="0" align="center" cellpadding="0"
                    cellspacing="0">
                    <tr>
                        <td width="33%" align="center">
                            <input name="print" type="button" onclick="printConfig.printPage()" class="baocun_an"
                                value="ֱ�Ӵ�ӡ" />
                        </td>
                        <td width="33%" align="center">
                            <asp:Button ID="btnToWord" runat="server" Text="������word" CssClass="baocun_an" OnClick="btnWord_Click" />
                        </td>
                        <td align="center">
                            <asp:Button ID="btnToStamp" runat="server" Text="����" CssClass="baocun_an" OnClick="btnToStamp_Click" />
                            <asp:Button ID="btnCancelStamp" runat="server" Visible="false" Text="ȡ������" CssClass="baocun_an"
                                OnClick="btnCancelStamp_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input id="hidrptPrintHTML" name="rptPrintHTML" type="hidden" />
    <input type="hidden" id="txtFontSize" name="txtFontSize" value="12" />
    <input type="hidden" id="txtLineHeight" name="txtLineHeight" value="18" />
    <input type="hidden" id="txtPrintHTML" name="txtPrintHTML" />
    <input id="hidCompanyID" name="hidCompanyID" type="hidden" value="<%=CompanyID %>" />

    <script type="text/javascript" src="<%=EyouSoft.Common.JsManage.GetJsFilePath("jquery") %>"></script>

    <script type="text/javascript">
        var printConfig = {
            config: { maxFontSize: 16, minFontSize: 10, maxLineHeight: 25, minLineHeight: 15 },
            printPreviewHTML: '',
            //���������С isIncrease=true �Ӵ� isIncrease=false ��С
            setFontSize: function(isIncrease) {
                
                var currentFontSize = parseInt($("#txtFontSize").val());
                var toFontSize = isIncrease ? currentFontSize + 1 : currentFontSize - 1;
                if (!isIncrease && toFontSize < this.config.minFontSize) {
                    alert("�ѵ�������С����" + this.config.minFontSize + "����");
                    return;
                }

                if (isIncrease && toFontSize > this.config.maxFontSize) {
                    alert("�ѵ������������" + this.config.maxFontSize + "����");
                    return;
                }

                $("#printPage td").css({ 'font-size': toFontSize + 'px' });
                $("#txtFontSize").val(toFontSize);
            },
            //�����м�� isIncrease=true �Ӵ� isIncrease=false ��С
            setLineHeight: function(isIncrease) {
                var currentLineHeight = parseInt($("#txtLineHeight").val());
                var toLineHeight = isIncrease ? currentLineHeight + 1 : currentLineHeight - 1;

                if (!isIncrease && toLineHeight < this.config.minLineHeight) {
                    alert("�ѵ�������С�м��" + this.config.minLineHeight + "����");
                    return;
                }

                if (isIncrease && toLineHeight > this.config.maxLineHeight) {
                    alert("�ѵ���������м��" + this.config.maxLineHeight + "����");
                    return;
                }

                $("#printPage td").css({ 'line-height': toLineHeight + 'px' });
                $("#txtLineHeight").val(toLineHeight);
            },            
            //ֱ�Ӵ�ӡ
            printPage: function() {
                $("#tbl_top").hide();
                 $("#tbl_Left").hide();    
                 $("#tbl_Footer").hide();  
                 $("body").css("background","none");
                
                if (window.print != null) {
                    window.print();  
                    //��ԭҳ������
                    window.setTimeout(function() {
                        $("#tbl_top").show();  
                        $("#tbl_Left").show();  
                        $("#tbl_Footer").show();
                        $("body").css({"background":"url(<%=ImageServerUrl %>/images/lura4.gif)","background-repeat":"no-repeat","background-position":" 0px 80px"});  
                    }, 800);                 
                } else {
                    alert('û�а�װ��ӡ��');
                }
            }           
        };
        function getHtml(){                     
            $("#hidrptPrintHTML").val($("#printPage").html());
        }
        function meetAndCollectionContect(obj){
            if(obj.checked){
                 $("#MeetTourContect,#CollectionContect").hide();
            }
            else{
                 $("#MeetTourContect,#CollectionContect").show();
            }
        }
        function localInfo(obj){
            if(obj.checked){
                 $("#localInfo").hide();
            }else{
                 $("#localInfo").show();
            }
        }
        function serviceInfo(obj){
            if(obj.checked){
                 $("#serviceInfo").hide();
            }else{
                 $("#serviceInfo").show();
            }
        } 
        function IncludeContent(obj){
            if(obj.checked){
                 $("#IncludeContent").hide();
            }else{
                 $("#IncludeContent").show();
            }
        }
        function NotContainService(obj){
            if(obj.checked){
                 $("#NotContainService").hide();
            }else{
                 $("#NotContainService").show();
            }
        } 
        function SpeciallyNotice(obj){
            if(obj.checked){
                 $("#SpeciallyNotice").hide();
            }else{
                 $("#SpeciallyNotice").show();
            }
        }          
    </script>

    </form>
</body>
</html>

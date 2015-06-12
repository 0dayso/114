<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyUserRegister.aspx.cs"
    EnableEventValidation="false" Inherits="UserPublicCenter.Register.CompanyUserRegister"
    MasterPageFile="~/MasterPage/PublicCenterMasterPage.Master" Title="ע��" %>

<%@ Import Namespace="EyouSoft.Common" %>
<%@ Import Namespace="EyouSoft.SSOComponent.Entity" %>
<%@ Register Src="/WebControl/RegisterHead.ascx" TagName="RegisterHead" TagPrefix="uc1" %>
<%@ Register Src="../WebControl/RegisterHead.ascx" TagName="RegisterHead" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="Main" ID="Default_ctMain" runat="server">

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>

    <script type="text/javascript" src="<%=JsManage.GetJsFilePath("blogin") %>"></script>

    <style type="text/css">
        .xinhao
        {
            color: #FF0000;
        }
        .jutixx
        {
            background-image: url("../images/shurukuangbg.gif");
            background-position: right top;
            background-repeat: no-repeat;
            border: 1px solid #A7A6AA;
            color: #000000;
            font-size: 14px;
            font-weight: bold;
            height: 12px;
            padding-top: 5px;
        }
        .jutixx02
        {
            border: 1px solid #A7A6AA;
            color: #000000;
            font-size: 14px;
            font-weight: bold;
            height: 12px;
            padding-top: 5px;
        }
        .home
        {
            font-size: 12px;
            color: #FF6600;
            border: 1px #FF6600 solid;
            background: #FFF2C0;
            display: block;
            width: 85px;
        }
        .T
        {
            font-size: 14px;
            color: #FF3300;
            font-weight: bold;
            display: block;
            height: 25px;
            text-indent: 64px;
            line-height: 25px;
            background: url(images/jionicon/xiadian.gif) no-repeat 50px top;
        }
        .radiosty
        {
            width: 23px;
            height: 23px;
        }
        .f14
        {
            font-size: 14px;
            font-weight: bold;
        }
        .style1
        {
            width: 13%;
        }
        .provincelist
        {
            border: 1px dashed #CCCCCC;
            background-color: #F6F6F6;
            margin-bottom: 5px;
            overflow: hidden;
        }
        .provincelist ul
        {
            clear: both;
            padding: 0;
        }
        .provincelist ul li
        {
            float: left;
            width: 80px;
            line-height: 20px;
        }
        .provincelist ul p
        {
            clear: both;
            line-height: 20px;
        }
    </style>
    <div class="body">
        <uc2:RegisterHead ID="RegisterHead2" runat="server" />

        <script type="text/javascript">
            function mouseovertr(o) {
                o.style.backgroundColor = "#FFF6C7";
            }
            function mouseouttr(o) {
                o.style.backgroundColor = ""
            }



            function SetProvince(ProvinceId) {
                $("#<%=ddl_ProvinceList.ClientID %>").attr("value", ProvinceId);
            }
            function SetCity(CityId) {
                $("#<%=ddl_CityList.ClientID %>").attr("value", CityId);
            }
            function SetCounty(CountyId) {
                $("#<%=ddl_CountyList.ClientID %>").attr("value", CountyId);
            }
        </script>

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center">
                    <img id="RegisterHeadimg" src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/join-1.gif"
                        width="956" height="30" />
                </td>
            </tr>
        </table>
        <div style="border: 4px solid rgb(255, 102, 0);" id="divMain">
            <div id="divFristRegister">
                <table width="940" border="0" cellspacing="0" cellpadding="5" class="maintop15">
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="43px" style="height: 47px; width: 19%;">
                            <span class="ff0000">*</span>�û�����
                        </td>
                        <td align="left" style="height: 47px">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr height="35px">
                                    <td width="11%">
                                        <input id="txtUserName" tabindex="1" name="txtUserName" type="text" min="5" max=""
                                            class="bitian" size="20" onblur="Register.ckUserName(this,'2');" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            <span id="errMsg_isExistSecondUserName" style="display: none" class="errmsg">���û����Ѿ�����,�����������û���</span>
                                            5-20���ַ�(����Сд��ĸ�����֡��»���)������Ϊ���ġ�һ��ע��ɹ���Ա�������޸ģ����� <a href="http://im.tongye114.com" target="_blank">
                                                ͬҵMQ</a> ���ͬ��ʹ��</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td height="32px" align="right" style="width: 19%">
                            <span class="ff0000">*</span>��¼���룺
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtFristPassWord" tabindex="2" name="txtFristPassWord" type="password"
                                            class="bitian" size="20" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            ������6-16λӢ����ĸ�����֡����� ��϶��ɡ�</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td height="32px" align="right" style="width: 19%">
                            <span class="ff0000">*</span>ȷ�����룺
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtSecondPassWord" tabindex="3" name="txtSecondPassWord" type="password"
                                            class="bitian" size="20" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" id="divSecondPassErr" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            ��������һ����������������롣</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="32px" style="width: 19%">
                            <span class="ff0000">*</span>��ʵ������
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtContactName" name="txtContactName" tabindex="4" type="text" class="bitian"
                                            size="20" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" id="divTrueContactName" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />����������ʵ������ ����ͬ����ϵ</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" style="width: 19%" height="32px">
                            <span class="ff0000">*</span>E-mail��
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtContactEmail" name="txtContactEmail" tabindex="5" type="text" class="bitian"
                                            size="20" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" id="div2" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            <span id="errMsg_ExitEmail" class="errmsg" style="display: none">��Email�Ѿ�ע��,����������!</span>
                                            ����д������������������԰�����<span class="ff0000">�һ�����</span>��
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="32px" style="width: 19%">
                            <span class="ff0000">*</span>QQ��
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="qq" name="qq" tabindex="6" type="text" class="bitian" size="20" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" id="div1" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />������������QQ�� ����ͬ��QQ��ϵ</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="32px" style="width: 19%">
                            <span></span>MSN��
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtMsn" onfocus="Register.OnckMSN(this)" onblur="Register.OnblurMsn(this)"
                                            name="txtMsn" tabindex="7" type="text" class="bitian1" size="20" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" id="div3" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            ������������MSN�� ����ͬ��MSN��ϵ</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divSecondRegister">
                <table width="940" border="0" cellspacing="0" cellpadding="5" class="maintop15">
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="trCategory">
                        <td height="30" align="right" style="width: 168px">
                            <span class="ff0000">*</span> ��ѡ�����
                        </td>
                        <td align="left">
                            <input name="rdoCategory" type="radio" id="rdoCgs" value="1" class="radiosty" /><label
                                for="rdoCgs" class="f14">�ɹ���</label>
                            <input name="rdoCategory" type="radio" id="rdoGys" value="2" class="radiosty" /><label
                                for="rdoGys" class="f14">��Ӧ��</label>
                            <span id="spSelCategory" style="color: Red;"></span>
                        </td>
                        <td align="left">
                            <div id="divcatetext" class="tist" style="display: none">
                                <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                    width="16" height="16" />
                                <span id="spCateText"></span>
                            </div>
                        </td>
                    </tr>
                </table>
                <table width="940" border="0" cellspacing="0" cellpadding="5" class="maintop15" id="tbyouke"
                    style="display: none">
                    <tr id="trCgsType" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)"
                        style="display: none">
                        <td height="25" align="right" style="width: 19%">
                            <span class="ff0000">*</span> �ɹ������ͣ�
                        </td>
                        <td align="left">
                            <input name="rdoCgsType" value="2" checked="checked" type="radio" />������
                            <input name="rdoCgsType" value="10" type="radio" />����
                        </td>
                    </tr>
                    <tr valign="middle" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)"
                        id="trGysCategory" style="display: none">
                        <td height="30" colspan="4" align="right">
                            <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-bottom: 15px;
                                margin-top: 10px; border-top: 2px solid #B7D2DF; background: #EFF5F8; border-bottom: 1px solid #B7D2DF">
                                <tr>
                                    <td width="13%" align="right" style="border-top: 2px solid #B7D2DF; background: #EFF5F8;
                                        border-bottom: 1px solid #B7D2DF">
                                        <span class="ff0000">*</span> ��Ӧ�����
                                    </td>
                                    <td width="1%" style="border-top: 2px solid #B7D2DF; background: #EFF5F8; border-bottom: 1px solid #B7D2DF">
                                        &nbsp;
                                    </td>
                                    <td width="90%" align="left" style="border-top: 2px solid #B7D2DF; background: #EFF5F8;
                                        padding-bottom: 8px; padding-top: 3px; border-bottom: 1px solid #B7D2DF">
                                        <table width="340" border="0" cellspacing="0" cellpadding="5">
                                            <tr>
                                                <td width="20%" align="left" valign="bottom">
                                                    <input type="radio" id="CompanyType1" name="radManageArea" value="0" /><label style="cursor: pointer"
                                                        for="CompanyType1">��·</label>
                                                    <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/icoline.gif" width="16"
                                                        height="16" alt="��·" />
                                                </td>
                                                <td width="20%" align="left" valign="bottom">
                                                    <input type="radio" id="CompanyType10" name="radManageArea" value="9" /><label style="cursor: pointer"
                                                        for="CompanyType10">��Ʊ</label>
                                                    <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/jipiao.gif" width="16"
                                                        height="16" alt="��Ʊ" />
                                                </td>
                                                <td width="20%" align="left" valign="bottom">
                                                    <input type="radio" id="CompanyType6" name="radManageArea" value="5" /><label style="cursor: pointer"
                                                        for="CompanyType6">�� ��</label>
                                                    <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/jiudian.gif" width="17"
                                                        height="15" alt="�Ƶ�" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="bottom">
                                                    <input type="radio" id="CompanyType5" name="radManageArea" value="4" /><label style="cursor: pointer"
                                                        for="CompanyType5">�� ��</label>
                                                    <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/jingqu.gif" width="16"
                                                        height="14" alt="����" />
                                                </td>
                                                <td align="left" valign="bottom">
                                                    <input type="radio" id="CompanyType7" name="radManageArea" value="6" /><label style="cursor: pointer"
                                                        for="CompanyType7">����</label>
                                                    <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/chedui.gif" width="20"
                                                        height="14" alt="����" />
                                                </td>
                                                <td align="left" valign="bottom">
                                                    <input type="radio" id="CompanyType8" name="radManageArea" value="7" /><label style="cursor: pointer"
                                                        for="CompanyType8">������Ʒ</label>
                                                    <img src="<%=ImageServerPath %>/images/UserPublicCenter/jionicon/nvyouyp.gif" width="14"
                                                        height="14" alt="������Ʒ" />
                                                </td>
                                            </tr>
                                        </table>
                                        <span id="errMsg_radManageArea" class="errmsg"></span>
                                    </td>
                                </tr>
                            </table>
                            <tr valign="middle" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)"
                                id="trXlgysCategory" style="display: none">
                                <td height="30" align="right">
                                    <span class="ff0000">*</span> ��·��Ӧ�����
                                </td>
                                <td align="left" colspan="2" height="30">
                                    <input type="checkbox" name="chxLine" value="1" id="ckline1" onclick="Register.CheckLineCheckBox();" /><label
                                        for="ckline1">������ר�ߵ�</label>
                                    <input type="checkbox" name="chxLine" id="ckline2" value="3" onclick="Register.CheckLineCheckBox();" /><label
                                        for="ckline2">
                                        �������ؽӵ�</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp; <span id="errMsg_chxLine" class="errmsg"></span>
                                </td>
                            </tr>
                            <input id="hdfZXandDj" name="hdfZXandDj" type="hidden" />
                            <tr valign="middle" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)"
                                id="trLXSZZ" style="display: none">
                                <td height="30" align="right">
                                    <span></span>���������ʣ�
                                </td>
                                <td align="left" colspan="2" height="30">
                                    <input type="checkbox" name="chxzz" value="1" id="checkCJLY" /><label for="checkCJLY">��������</label>
                                    <input type="checkbox" name="chxzz" id="checkRJLY" value="2" /><label for="checkRJLY">
                                        �뾳����</label>
                                    <input type="checkbox" name="chxzz" value="3" id="checkTWLY" /><label for="checkTWLY">̨������</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp; <span id="Span1" class="errmsg"></span>
                                </td>
                            </tr>
                            <input id="lxszz" name="lxszz" type="hidden" runat="server" />
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="25px" style="font-size: 14px; width: 19%;">
                            <span class="ff0000">*</span>��˾���ƣ�
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <input id="txtCompanyName" tabindex="8" name="txtCompanyName" type="text" class="bitian"
                                            size="50" />
                                    </td>
                                    <td>
                                        <div class="tist" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            ��дȫ�ƣ����ǹ�˾���Ż���´�������ȫ�ƺ�д����
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="TrSimplemName">
                        <td align="right" height="25px" style="width: 19%;">
                            <span></span>��˾��ƣ�
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtCompanySimpleName" onfocus="Register.inputpress(this)" onblur="Register.inputblur(this)"
                                            tabindex="9" name="txtCompanySimpleName" type="text" class="bitian1" size="50"
                                            maxlength="8" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" id="div4" style="display: none">
                                            �˸������ڣ����磺�㽭ʡ����</div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="TrMainPro">
                        <td align="right" height="25px" style="width: 19%;">
                            <span></span>��ҪƷ�ƣ�
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtBrandName" onfocus="Register.inputpress(this)" onblur="Register.inputblur(this)"
                                            tabindex="10" name="txtBrandName" type="text" class="bitian1" size="50" maxlength="8" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" style="display: none">
                                            ��Ϊ��Ҫ�����ƹ��������Ϣ���˸������ڣ����磺���ּ���
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="TrCompanySize">
                        <td align="right" height="25px" style="width: 19%;">
                            <span class="ff0000">*</span>��˾��ģ:
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <select name="sltCompanySize" id="sltCompanySize" runat="server">
                                            <option value="0" selected="selected">��ѡ��</option>
                                            <option value="1">10������</option>
                                            <option value="2">10-20��</option>
                                            <option value="3">20-50��</option>
                                            <option value="4">50-100��</option>
                                            <option value="5">100-200��</option>
                                            <option value="6">200������</option>
                                        </select>
                                    </td>
                                    <td>
                                        <div class="tist" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            ��ѡ��˾��ģ.
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="25px" style="width: 19%">
                            ���֤�ţ�
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="20%">
                                        <input id="txtLicenseNumber" name="txtLicenseNumber" type="text" tabindex="11" class="bitian1"
                                            size="20" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="25px" style="width: 19%">
                            <span class="ff0000">*</span>���ڵأ�
                        </td>
                        <td align="left">
                            <span class="unnamed1" id="ProvinceRequired" style="display: none">*</span>ʡ�ݣ�<asp:DropDownList
                                ID="ddl_ProvinceList" runat="server" valid="required">
                            </asp:DropDownList>
                            <input type="hidden" id="proRequired" name="proRequired" class="bitian" />
                            <span class="unnamed1" id="CityRequired" style="display: none">*</span>���У�<asp:DropDownList
                                ID="ddl_CityList" runat="server" valid="required">
                            </asp:DropDownList>
                            <span class="unnamed1" id="CountyRequired" style="display: none">*</span>�ؼ���<asp:DropDownList
                                ID="ddl_CountyList" runat="server" valid="required">
                            </asp:DropDownList>
                            <span id="errMsg_Province" style="display: none" class="errmsg">��ѡ��ʡ��</span> <span
                                id="errMsg_City" style="display: none" class="errmsg">��ѡ�����</span> <span id="errMsg_CountyList"
                                    style="display: none" class="errmsg">��ѡ������</span>
                        </td>
                    </tr>
                    <tr id="trSellCity" style="display: none" onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="25px" style="width: 19%">
                            <span class="ff0000">*</span>���۳��У�
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <div class="chengshi" id="SaleProvince" style="overflow: hidden">
                                        </div>
                                        <div class="chengshi" id="chengshilist" style="overflow: hidden">
                                            <div id="OtherCity" class="provincelist">
                                                <span>��������<input type="text" style="height: 13px; size: 20;" id="inputOtherSaleCity"
                                                    name="inputOtherSaleCity" />��������ã��ŷֿ�</span> <span id="errMsgckSellCity" class="errmsg"
                                                        style="display: none">��ѡ��/�������۳���</span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="25px" style="width: 19%">
                            <span class="ff0000">*</span>�칫�ص㣺
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtOfficeAddress" name="txtOfficeAddress" type="text" class="bitian" size="50"
                                            tabindex="12" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            ע��������ڵ����͵�ַ������ͬ����ϵ
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="25px" style="width: 19%">
                            <span class="ff0000">*</span>�ͷ��绰��
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtContactTel" name="txtContactTel" type="text" class="bitian" size="20"
                                            tabindex="13" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            ����д400�绰�ȶ���ͷ��绰,Ϊ������ϵ,�����д��ʵ����
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="32px;" style="width: 19%">
                            <span class="ff0000">*</span>��ϵ�ֻ���
                        </td>
                        <td align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="11%">
                                        <input id="txtContactMobile" name="txtContactMobile" tabindex="14" type="text" class="bitian"
                                            size="20" />
                                    </td>
                                    <td width="89%">
                                        <div class="tist" style="display: none">
                                            <img style="display: none" src="<%=ImageServerPath %>/images/UserPublicCenter/1000216.gif"
                                                width="16" height="16" />
                                            �ֻ�����������˻�Ա���ʣ��������ѣ������д��ʵ����
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" height="25px" style="width: 19%">
                            �ͷ����棺
                        </td>
                        <td align="left">
                            <input id="txtContactFax" name="txtContactFax" type="text" class="bitian1" size="20"
                                tabindex="15" />
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="TrCompanyinfo">
                        <td align="right" height="25px" style="width: 19%">
                            ��˾���ܣ�
                        </td>
                        <td align="left">
                            <textarea tabindex="16" style="width: 600px; height: 100px;" class="jutixx" id="txtCompanyInfo"
                                cols="20" name="txtCompanyInfo"></textarea>
                        </td>
                    </tr>
                    <tr id="trSellCityAndArea" style="display: none">
                        <td align="right" height="35px" style="width: 19%">
                            <strong>��ѡ������Ӫ����·����</strong>
                        </td>
                        <td align="left" id="tdAllSellCityAndArea">
                        </td>
                    </tr>
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)" id="trTicket" style="display: none">
                        <td colspan="2">
                            <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-bottom: 15px;
                                margin-top: 10px; margin-left: 10px;">
                                <tr>
                                    <td align="right" style="background: #F3F7F9;" class="style1">
                                        <span class="xinhao">*</span>��Ʊ��Ӧ����д�
                                    </td>
                                    <td style="background: #F3F7F9;">
                                        &nbsp;
                                    </td>
                                    <td width="85%" align="left" style="background: #F3F7F9; padding-bottom: 8px; padding-top: 3px;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                                            <tr>
                                                <td width="21%" align="right">
                                                    OFFICE�ţ�
                                                </td>
                                                <td width="79%" align="left">
                                                    <input tabindex="28" name="txtOffice" id="txtOffice" type="text" class="bitian1"
                                                        size="20" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <span style="background: #F3F7F9;"><span class="errmsg">*</span></span>������
                                                </td>
                                                <td align="left">
                                                    <input name="txtDlNumber" type="text" class="bitian1" size="20" id="txtDlNumber" />
                                                    <span id="errMsg_txtDlNumber" class="errmsg"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    ��Ӧ���°�ʱ�䣺
                                                </td>
                                                <td align="left">
                                                    <input name="txtWorkStartTime" tabindex="31" id="txtWorkStartTime" type="text" class="bitian1"
                                                        size="9" />-<input tabindex="34" name="txtWorkEndTime" id="txtWorkEndTime" type="text"
                                                            class="bitian1" size="9" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    QQ��
                                                </td>
                                                <td align="left">
                                                    <input tabindex="37" id="txtContactQQ" name="txtContactQQ" type="text" class="bitian1"
                                                        size="20" />
                                                    MSN��<input tabindex="40" id="txtContactMSN" name="txtContactMSN" type="text" class="bitian1"
                                                        size="20" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="940" border="0" cellspacing="0" cellpadding="5" class="maintop15">
                    <tr onmouseover="mouseovertr(this)" onmouseout="mouseouttr(this)">
                        <td align="right" style="font-size: 14px; width: 172px;" height="30px">
                            <span class="ff0000">*</span>��֤�룺
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtValidateCode" runat="server" CssClass="bitian" TabIndex="17"
                                size="6" MaxLength="4"></asp:TextBox>
                            <a title="ˢ����֤��" href="#" onclick="javascript:document.getElementById('<%=imgValidateCode.ClientID %>').src='/ValidateCode.aspx?ValidateCodeName=CompanyRegisterCode&id='+Math.random();$('#spanCodeisNull').hide();return false;">
                                <asp:Image ID="imgValidateCode" runat="server" />�����壬��һ��</a>

                            <script language="javascript">
                                document.getElementById('<%= imgValidateCode.ClientID %>').src = '/ValidateCode.aspx?id=' + Math.random() + "&ValidateCodeName=CompanyRegisterCode";
                            </script>

                            <span id="spanCodeisNull" style="display: none" class="errmsg">��������֤��</span> <span
                                id="spanCodeErr" style="display: none" class="errmsg">��������ȷ����֤��</span>
                        </td>
                    </tr>
                    <tr>
                        <td height="40" align="right" style="width: 160px">
                        </td>
                        <td align="left">
                            <input type="button" id="btnSecondRegister" value="ͬ�����·���������ύע��" style="background: url(<%=ImageServerPath %>/images/UserPublicCenter/subb.gif);
                                width: 270px; height: 37px; border: none; font-size: 14px; font-weight: bold;
                                color: #ffffff; cursor: pointer" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--  <a href="javascript:void(0);" onclick=" $('#RegisterHeadimg').attr('src', '<%=ImageServerPath %>/images/UserPublicCenter/join-1.gif'); $('#divFristRegister').show(); $('#divSecondRegister').hide(); return false;" style="text-decoration:underline">&lt;&lt;������һ��</a>--%>
                        </td>
                    </tr>
                </table>
                <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left">
                            <input id="F_ckPact" name="checkbox" type="checkbox" value="checkbox" onclick="Register.ChangeckPoct();"
                                checked="true" />
                            <label for="F_ckPact" style="cursor: pointer">
                                �Ķ���ͬ����������</label><span class="errmsg" style="display: none" id="span_PactErr">ͬ����������������ע��</span>
                            <br />
                            <textarea readonly="readonly" cols="140" rows="10">һ��������Э��˫��Ϊ������ŵ�Ƽ����޹�˾���³ơ���ŵ�Ƽ�����������ͬҵ����ƽ̨(www.tongye114.com)�û���������Э����к�ͬЧ����

    ������Э�����ݰ���Э�����ļ�������ŵ�Ƽ��Ѿ������Ļ������ܷ����ĸ���������й���ΪЭ�鲻�ɷָ��һ���֣���Э�����ľ���ͬ�ȷ���Ч���� 
    �ڱ�����Э����û���ԡ�����������ʾ������������ָʾ���ļ������ڱ�����Э�����ɲ��֣������������ݵ�Э����йزο����ݣ��뱾Э��û�з����ϵ�ֱ�ӹ�ϵ�� 
    �û���ʹ����ŵ�Ƽ��ṩ�ĸ�������ͬʱ����ŵ���ܲ����ظ�����ع���Ĺ涨����ŵ�Ƽ���Ȩ������Ҫ��ʱ���ƶ����޸ı�Э����������籾Э�����κα������ŵ�Ƽ�������վ�Ͽ��ع��棬֪ͨ���û������û���ͬ����ر��������ֹͣʹ�á����񡱡����޶���Э��һ��������ͬҵ����ƽ̨�����������Զ���Ч�����������ڷ�������Ч�����Ϊ��Э���һ���֡���¼�����ʹ�á����񡱽���ʾ�û����ܾ��޶���Э�顣��������ȷ�����⣬�κ�ʹ�����񡱷�Χ���������ǿ�������ݾ��ܱ�Э��Լ���� 
�û�ȷ�ϱ�����Э��󣬱�����Э�鼴���û�����ŵ�Ƽ�֮���������Ч�������û������ע��֮ǰ�����Ķ�ȫ������Э�����ݣ������κ����ʣ�������ŵ�Ƽ���ѯ�� 
1)�����û���ʵ���Ƿ���ע��֮ǰ�����Ķ��˱�����Э�飬ֻҪ�û����Э�������·��ġ�ͬ�����Ϸ���Э�飬���ύע�ᡱ��ť��������ŵ�Ƽ�ע�����ɹ�ע��Ϊ�û����û�����Ϊ��Ȼ��ʾ��ͬ�Ⲣǩ���˱�����Э�顣 
2)��Э�鲻�漰�û�����ŵ�Ƽ������û�֮�������Ͻ��׶������ķ��ɹ�ϵ�����ɾ��ס� 

���� ����

����ͬҵ����ƽ̨���й�����ͬҵ����ƽ̨�ϵ������ͼʾ�ĺ��壬�������ͬҵ����ƽ̨����������ͬҵ����ƽ̨������ 
    �û����û�ע�᣺�û��������Ǿ��кϷ���Ӫ�ʸ��ʵ����֯�����߾߱���ȫ������Ϊ��������Ȼ�ˡ���������Ϊ�����ˡ�����������Ϊ�������Լ��޾�Ӫ���ض���Ӫ�ʸ����֯����ע��Ϊ��ŵ�Ƽ��û��򳬹�������Ȩ������Ϊ������Χ���½��׵ģ�������ŵ�Ƽ�֮��ķ���Э����ʼ��Ч����ŵ�Ƽ�һ�����֣���Ȩ����ע�����û�����׷����ʹ������ͬҵ����ƽ̨�����񡱵�һ�з������Ρ��û�ע����ָ�û���½����ͬҵ����ƽ̨������Ҫ����д�����Ϣ��ȷ��ͬ����������û�Э��Ĺ��̡��û�����н��ס���ȡ�г������Ӵ�����ͬҵ����ƽ̨������������������Ӧ��˰�����Լ�һ��Ӳ���������������������ķ��þ����û�����֧��������ͬҵ����ƽ̨����Ϊ���׵ص㡣����ͬҵ����ƽ̨����Ϊ�û���ɫ���׶��󣬻���ͷ���Ľ��׽���Э�̣��Լ���ȡ������ó����صķ���ĵص㡣��ŵ�Ƽ����ܿ��ƽ������漰����Ʒ���������������ȫ��Ϸ��ԣ���ó��Ϣ����ʵ�Ի�׼ȷ�ԣ��Լ����׷���������ó��Э�����µĸ����������������ŵ�Ƽ�������Ϊ��һ������ҵ���ݲ���������Ϊ�ı�����ŵ�Ƽ������û�Ӧ��ͨ���Լ��Ľ����ж�ȷ����¼��Ʒ�����������Ϣ����ʵ�ԡ��Ϸ��Ժ���Ч�ԡ�  
��


���� �û�Ȩ��������

�û���Ȩ��ӵ���Լ�������ͬҵ����ƽ̨���û��������룬����Ȩ��ʹ���Լ����û�����������ʱ��½����ͬҵ����ƽ̨���û��������κ���ʽ����ת�û���Ȩ����ʹ���Լ�������ͬҵ����ƽ̨�û����� 
    �û���Ȩ���ݱ�����Э��Ĺ涨�Լ�����ͬҵ����ƽ̨�Ϸ�������ع�����������ͬҵ����ƽ̨�Ͻ���ƽ̨��ѯ��Ʒ��������Ϣ������������Ϣ����¼��Ʒ���μ�������Ʒ�����������û�������Ʒ������ͬ�����������û������á��μ���ŵ�Ƽ����йػ�Լ���Ȩ������ŵ�Ƽ��ṩ���������й���Ϣ���� 
    �û�������ͬҵ����ƽ̨�Ͻ��׹��������������û����ײ������ף�����������ŵ�Ƽ���������Э�����û��緢�������û���Υ����Υ��������Э�����Ϊ����������ŵ�Ƽ����з�ӳҪ�������û������Ͻ����������û��������ϵģ��û���Ȩͨ��˾������Ҫ����ŵ�Ƽ��ṩ������ϣ� 
    �û���������ע��ʱ�ṩ�Լ�����ʵ���ϣ�����֤������ϵ�ˡ������ʼ���ַ����ϵ�绰����ϵ��ַ��������������ݵ���Ч�Լ���ȫ�ԣ���֤��ŵ�Ƽ��������û�����ͨ��������ϵ��ʽ���Լ�������ϵ��ͬʱ���û�Ҳ���������������ʵ�ʱ��ʱ��ʱ�����й�ע�����ϡ��û���֤������������������ͬҵ����ƽ̨����ע�����֤�� 
    �û�Ӧ����֤��ʹ������ͬҵ����ƽ̨���н��׹��������س�ʵ���õ�ԭ�򣬲��ڽ��׹����в�ȡ������������Ϊ�����������Ͻ��׵��������򣬲����������Ͻ����޹ص���Ϊ�� 
    �û���Ӧ������ͬҵ����ƽ̨�϶������������û������ȡ�������ֶ������������öȻ򽵵������û������öȣ� 
    �û�������ͬҵ����ƽ̨�ϲ��÷�������Υ����Υ����Ϣ�� 
    �û�������ͬҵ����ƽ̨�ϲ����������ҽ�ֹ���۵Ļ��������۵���Ʒ�����������ַ�����֪ʶ��Ȩ�������Ϸ�Ȩ�����Ʒ��Ҳ��������Υ����ṫ������򹫹����µġ�������ŵ�Ƽ���Ϊ���ʺ�������ͬҵ����ƽ̨�����۵���Ʒ�� 
    �û���ŵ�Լ���ʹ������ͬҵ����ƽ̨ʱʵʩ��������Ϊ�����ع��ҷ��ɡ��������ŵ�Ƽ�����ع涨�Լ�������ṫ������򹫹����¡�����Υ�������κη��ɺ���ķ������û������Լ�����������е�������Ӧ�ķ������Σ� 
    �û�ͬ�⣬��������ͬҵ����ƽ̨���κ���������ҵ�����ã���������������δ����ŵ�Ƽ�����������׼������£��Ը��ơ������ȷ�ʽʹ��������ͬҵ����ƽ̨վ��չʾ���κ����ϡ�

�ġ���ŵ�Ƽ���Ȩ��������

��ŵ�Ƽ������������м�����ά���������Ͻ���ƽ̨���������У���Ŭ�������͸Ľ�������ʹ�û����Ͻ��׻����˳�����У� 
    ���û���ע��ʹ������ͬҵ����ƽ̨�Ͻ���ƽ̨�����������뽻�׻�ע���йص����⼰��ӳ���������ŵ�Ƽ�Ӧ��ʱ�����ظ��� 
    �����û�������ͬҵ����ƽ̨�ϵĲ�����Ϊ�������κ���ŵ�Ƽ���ΪӦ����ֹ������������ŵ�Ƽ���Ȩ��ʱ����ɾ�������Ϣ����ֹ�����ṩ�ȴ��������������û���ͬ�⣻ 
    �����Ͻ���ƽ̨�������ԣ���ŵ�Ƽ�û������������û���ע�����ݡ����еĽ�����Ϊ�Լ��뽻���йص������������������飬���������������� 
���û�������������֪ͨ��ŵ�Ƽ�����Ϊĳ�������û�����彻��������ܴ����ش����⣻
���û�����������������ŵ�Ƽ���֪����ƽ̨����Υ���򲻵���Ϊ�ģ���ŵ�Ƽ�����ͨ��רҵ�����ߵ�֪ʶˮƽ��׼��������ݽ����б𣬿���������Ϊ��Щ���ݻ���Ϊ����Υ���򲻵����ʵģ�
��ŵ�Ƽ���Ȩ���ݲ�ͬ���ѡ������ɾ�������Ϣ�������ֹͣ�Ը��û��ṩ���񣬲�׷����ط������Ρ�
�û�������ͬҵ����ƽ̨�Ͻ��׹��������������û����ײ������ף�������ŵ�Ƽ��������Ե���������ŵ�Ƽ���˺���ŵ�Ƽ���Ȩͨ�������ʼ���ϵ�����˫���˽�������������˽�����ͨ�������ʼ�����֪ͨ�Է��� 
    �û���������ͬҵ����ƽ̨�Ͻ����������û��������ϵģ��û�ͨ��˾�����Ż������������շ�������Ҫ����ŵ�Ƽ��ṩ������ݣ���ŵ�Ƽ�Ӧ������ϲ��ṩ�й����ϣ� 
    ��ŵ�Ƽ���Ȩ���û���ע�����ݼ�������Ϊ���в��ģ�����ע�����ݻ�����Ϊ�д����κ�������ɣ�����Ȩ���û�����ѯ�ʼ�Ҫ�������֪ͨ����ֱ������ɾ���ȴ��� 
    ��������Ч���������������������ȷ���û�����Υ����Ϊ��������ŵ�Ƽ����㹻��ʵ���ݿ����϶��û�����Υ����Υ������Э����Ϊ�ģ���ŵ�Ƽ���Ȩ������ͬҵ����ƽ̨��������վ�������緢����ʽ�����û���Υ����Ϊ�� 
    �����û�������ͬҵ����ƽ̨���������и�����Ϣ����ŵ�Ƽ���Ȩ�ڲ�֪ͨ�û���ǰ���½���ɾ�����ȡ���������Դ�ʩ���������������Թ�ܷ���ΪĿ�ĵ���Ϣ���Գ�������ΪĿ�ĵ���Ϣ����ŵ�Ƽ����������Ŵ�����թ�ȶ����������ݵ���Ϣ����ŵ�Ƽ����������������Ͻ����޹ػ����Խ���ΪĿ�ĵ���Ϣ����ŵ�Ƽ����������Ŵ��ڶ��⾺�ۻ�������ͼ�������������������ص���Ϣ����ŵ�Ƽ����������Ÿ���ϢΥ����������������������ŵ�Ƽ��������û��Ϸ�����ģ� 
    ���ʹ��Ȩ�� �û��Դ�������ŵ�Ƽ����ҵġ�ȫ��ͨ�õġ����õġ���ѵ����ʹ��Ȩ�� (����Ȩ�Ը�Ȩ����������Ȩ)��ʹ��ŵ�Ƽ���Ȩ(ȫ���򲿷ݵ�) ʹ�á����ơ��޶�����д�����������롢�ַ���ִ�к�չʾ�û���ʾ����վ�ĸ�����Ϣ��������������Ʒ����/����������֪���պ󿪷����κ���ʽ��ý���������������Ϣ����������Ʒ�ڣ� 
    ��ŵ�Ƽ������û��ļ�������趨��ȡ����ŵ�Ƽ�cookies�� ��ŵ�Ƽ�������Щ������ͬҵ����ƽ̨ҳ�Ϸ������Ĺ�˾���û���������趨��ȡ�� cookies �� ���û���¼ʱ��ȡ���ݣ���ŵ�Ƽ�ʹ��cookies��Ϊ�û��ṩ���Ի����� ����ܾ����� cookies���û�������ʹ����Ҫ��¼����ŵ�Ƽ���Ʒ���������ݡ� 
����
�塢������жϺ���ֹ��

�û�ͬ�⣬����ŵ�Ƽ�δ���û���ȡ����ѵ�����£���ŵ�Ƽ�������ȫȨ�������κ����� (��������������ŵ�Ƽ���Ϊ�û���Υ����Э�����������;��񣬻��Բ����ϱ�Э�����������;���ķ�ʽ���£����û��ڳ���90���ʱ����δ���û����˺ż������¼��վ��) ��ֹ�û��ġ��������롢�˻� (�����κβ���) ���û��ԡ����񡱵�ʹ�ã���ɾ�������ٱ��棩�û���ʹ�á��������ύ���κ����ϡ�ͬʱ��ŵ�Ƽ�������ȫȨ�������ڷ���֪ͨ�򲻷���֪ͨ������£���ʱֹͣ�ṩ�����񡱻����κβ��ݡ��˺���ֹ����ŵ�Ƽ�û������Ϊ�û�����ԭ�˺��л���֮��ص��κ���Ϣ����ת���κ�δ���Ķ����͵���Ϣ���û�������������⣬�û�ͬ�⣬��ŵ�Ƽ�������ֹ�û����롰���񡱶����û����κε����߳е��κ����Σ� 
    ���û�����ŵ�Ƽ����ע������ͬҵ����ƽ̨ע���û����ʱ������ŵ�Ƽ����ͬ�⣬����ŵ�Ƽ�ע����ע���û����û����������ŵ�Ƽ��ķ���Э���ϵ����ע�����û��˺ź���ŵ�Ƽ��Ա�������Ȩ���� 
���û�ע������ŵ�Ƽ���Ȩ�������û���ע�����ݼ���ǰ�Ľ�����Ϊ��¼��
���û�ע�������û���ע��ǰ������ͬҵ����ƽ̨�ϴ���Υ����Ϊ��Υ����ͬ����Ϊ����ŵ�Ƽ��Կ���ʹ������Э�����涨��Ȩ����
����������£���ŵ�Ƽ�����ͨ��ע���û��ķ�ʽ��ֹ���� 
�����û�Υ��������Э����ع涨ʱ����ŵ�Ƽ���Ȩ��ֹ����û��ṩ������ŵ�Ƽ������жϷ���ʱ֪ͨ�û���������û��ڱ���ŵ�Ƽ���ֹ�ṩ�������һ��ֱ�ӻ��ӻ�����������ע��Ϊ��ŵ�Ƽ��û��ģ���ŵ�Ƽ���Ȩ�ٴε�������ֹ����û��ṩ����

������ŵ�Ƽ�ͨ���û��ṩ����Ϣ���û���ϵʱ�������û���ע��ʱ��д�ĵ��������Ѳ����ڻ��޷����յ����ʼ��ģ�����ŵ�Ƽ���������ϵ��ʽ֪ͨ�û����ģ����û�����������������δ���ṩ�µĵ��������ַ�ģ���ŵ�Ƽ���Ȩ��ֹ����û��ṩ����

��һ����ŵ�Ƽ������û�ע����������Ҫ��������ٵģ���ŵ�Ƽ���Ȩ��ʱ��ֹ����û��ṩ����

�ܱ�����Э����ֹ�����ʱ���û���ʾ��Ը�����µķ���Э��ģ�

��������ŵ�Ƽ���Ϊ����ֹ����������

�����жϡ���ֹ֮ǰ�û�������Ϊ�Ĵ������û�Υ�����ɷ������Υ������Э��涨����ʹ��ŵ�Ƽ��жϡ���ֹ���û�����ģ����ڷ����жϡ���ֹ֮ǰ�û�������Ϊ������ԭ���� 
�ٷ����жϡ���ֹ֮ǰ���û��Ѿ��ϴ�������ͬҵ����ƽ̨����Ʒ��δ���׻���δ������ɵģ���ŵ�Ƽ���Ȩ���жϡ���ֹ�����ͬʱɾ��������Ʒ�������Ϣ��
�ڷ����жϡ���ֹ֮ǰ���û��Ѿ��������û����۵ľ�����Ʒ����ҪԼ����������δ��������ŵ�Ƽ���Ȩ���жϻ���ֹ�����ͬʱɾ�����û������ҪԼ��
�۷����жϡ���ֹ֮ǰ���û��Ѿ�����һ�û��;��彻�״��һ�£���ŵ�Ƽ����Բ�ɾ������ף�����ŵ�Ƽ���Ȩ���жϡ���ֹ�����ͬʱ���û����жϻ���ֹ��������֪ͨ�û��Ľ��׶Է��� 

�������η�Χ��

�û���ȷ����ͬ�⣬��ŵ�Ƽ�������������һ��������µ��κ����⳥�е����Σ�����������������������ʹ�á����ݵȷ������ʧ������������ʧ�����⳥ (������ŵ�Ƽ��Ƿ��ѱ���֪�õ����⳥�Ŀ�����)�� 
    ʹ�û�δ��ʹ�á����񣻵�����δ����׼�Ľ��������������û��Ĵ������ݻ����ݣ��������ԡ����񡱵���������ڡ����񡱵���Ϊ���������ŵ�Ƽ���ԭ���������롰�����йص��κ��������ˣ�����������û���ȷ��Ⲣͬ�⣬������Υ���йط��ɻ��߱�Э��֮�涨��ʹ��ŵ�Ƽ������κ���ʧ���ܵ��κε����������⣬���κ����������ŵĴ������û�Ӧ����ŵ�Ƽ��ṩ�����������������ʦ���á� 

�ߡ���˽Ȩ���ߣ�

���÷�Χ�� 
�����û�ע������ͬҵ����ƽ̨�˻�ʱ���û�������ŵ�Ƽ�Ҫ���ṩ�ĸ���ע����Ϣ��
�����û�ʹ����ŵ�Ƽ����񣬲μ���ŵ�Ƽ�������������ͬҵ����ƽ̨ҳʱ����ŵ�Ƽ��Զ����ղ���¼���û�������ϵķ�������ֵ��������������IP��ַ�����ݼ��û�Ҫ��ȡ�õ���ҳ��¼��
����ŵ�Ƽ��ռ������û�����ŵ�Ƽ����н��׵��й����ݣ������������ڳ��ۡ�������Ʒ��¼���������ۼ�Υ���¼��
����ŵ�Ƽ�ͨ���Ϸ�;������ҵ��鴦ȡ�õ��û��������ݡ�
��Ϣʹ�ã� 
����ŵ�Ƽ��������κ��˳��ۻ�����û��ĸ�����Ϣ���������ȵõ��û�����ɡ�
����ŵ�Ƽ��಻�����κε��������κ��ֶ��ռ����༭�����ۻ����޳������û��ĸ�����Ϣ���κ��û�������������һ�����֣���ŵ�Ƽ���Ȩ������ֹ����û��ķ���Э�飬������˺š� 
��Ϊ�����û���Ŀ�ģ���ŵ�Ƽ�����ͨ��ʹ���û��ĸ�����Ϣ�����û��ṩ���񣬰��������������û�������Ʒ�ͷ�����Ϣ����������ŵ�Ƽ�������鹲����Ϣ�Ա��������û������й����Ʒ�ͷ������Ϣ��������Ҫ�û�������ͬ�⣩��

��Ϣ��¶��
�û��ĸ�����Ϣ������������²��ֻ�ȫ������¶��
�پ��û�ͬ�⣬���������¶�� 
�����û��Ǻ��ʸ��֪ʶ��ȨͶ���˲�������Ͷ�ߣ�Ӧ��Ͷ����Ҫ����Ͷ������¶���Ա�˫��������ܵ�Ȩ�����ף�
�۸��ݷ��ɵ��йع涨������������˾��������Ҫ�������������������˾��������¶��
������û�����Υ���й��йط��ɻ�����վ���ߵ��������Ҫ���������¶��
��Ϊ�ṩ����Ҫ��Ĳ�Ʒ�ͷ��񣬶�����͵����������û��ĸ�����Ϣ��
��������ŵ�Ƽ����ݷ��ɻ�����վ������Ϊ���ʵ���¶��
��������ͬҵ����ƽ̨�ϴ�����ĳһ�����У��罻���κ�һ�����л򲿷������˽������������Ϣ��¶����ģ� ��ŵ�Ƽ���ȫȨ���Ծ�������û��ṩ�佻�׶Է������緽ʽ�ȱ�Ҫ��Ϣ���Դٳɽ��׵���ɻ���׵Ľ����

��Ϣ��ȫ�� 
����ŵ�Ƽ��˻��������뱣�����ܣ������Ʊ����û����˻���������Ϣ�� 
����ʹ����ŵ�Ƽ�����������Ͻ���ʱ���û����ɱ����Ҫ���׶Է���Ǳ�ڵĽ��׶Է��ṩ�Լ��ĸ�����Ϣ�������緽ʽ����������ַ�����û����Ʊ����Լ��ĸ�����Ϣ�����ڱ�Ҫ���������������ṩ��
������û������Լ��ĸ�����Ϣй�ܣ���������ŵ�Ƽ��˻������뷢��й¶�����û�����������ŵ�Ƽ��ͷ����Ա���ŵ�Ƽ���ȡ��Ӧ��ʩ��

Cookie��ʹ�ã� 
��ͨ����ŵ�Ƽ�����Cookie��ȡ�õ��й���Ϣ�������ñ����ߣ�
������ŵ�Ƽ��Ϸ������Ĺ�˾ͨ��������û���������趨��Cookies���������Լ�����˽Ȩ����ʹ�á�
�����޸ģ���ŵ�Ƽ������Ա�����������ʱ�޸ĵ�Ȩ���� 

��Ͻ��
����������֮���������ã��Լ��뱾���������йص����飬��Ӧ�����л����񹲺͹��������Դ��������㽭ʡ����������������ԺΪ��һ���Ͻ��Ժ��

</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="left">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    var CategoryText1="������ҪԤ����Ʒ����ѡ��ɹ��̡�";
    var CategoryText2="������Ҫ������Ʒ����ѡ��Ӧ�̡�";
    var CategoryText3="�����û�ֻ�ܹ�ƽ̨�����������ܲ鿴ͬ�н���ۣ�ͬҵMQ���ܼӺ��ѡ�";    

        var Register = {
            ckUserName: function(obj, Number) { //��֤�û����Ƿ����
                var UserName = $.trim($(obj).val());
                if (UserName != "") {
                    var isExist = true;
                    $.ajax({
                        type: "GET",
                        async: false,
                        dataType: 'html',
                        url: "ExistUserName.ashx?UserName=" + UserName,
                        cache: false,
                        success: function(html) {
                            if (html == "True") {
                                if (Number == "1") {
                                    $("#span_txtUserName").show();
                                      $("#errMsg_isExistSecondUserName").hide();
                                } else {
                                    $("#errMsg_isExistSecondUserName").show();
                                }
                                isExist = false;
                            }
                        }
                    });
                    return isExist;
                }
            },
            ckisExistEmail: function(obj) {
                var Email = $.trim($(obj).val());
                if (Email != "") {
                    var isExist = true;
                    $.ajax({
                        type: "GET",
                        async: false,
                        dataType: 'html',
                        url: "ExistUserName.ashx?isEmail=1&Email=" + Email,
                        cache: false,
                        success: function(html) {
                            if (html == "True") {
                                $("#errMsg_ExitEmail").show();
                                isExist = false;
                            }
                        }
                    });
                    return isExist;
                }
            },
            ckInputisNull: function($obj, isOnclick,isSubmit) { //ע���һ������д��Ա��Ϣ��ʱ����֤
                var objValue = $.trim($obj.val());
                var isPassck = true;
                $obj.parent("td").next().find("div").hide();
                    var objId = $obj.attr("id");
                if(objValue!==""){   
                    isPassck= this.validInputIsNull(objValue,objId,$obj,isOnclick);                
                }else 
                {                    
                    if(isSubmit){
                       isPassck= this.validInputIsNull(objValue,objId,$obj,isOnclick);
                    }
                }
                return isPassck;
            },
            validInputIsNull:function(objValue,objId,$obj,isOnclick){
                var isPassck=true;
                if (objId == "txtUserName") {
                    if(Register.IsModifUserNameEmail(objId)){
                        //�û�������5-20
                        if(!Register.ckUserName($obj)){
                             $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                                $obj.parent("td").next().find("div").show();
                                $obj.parent("td").next().find("div img").show();
                                isPassck = false;
                        }else{
                              $("#errMsg_isExistSecondUserName").hide();
                        }
                        if (objValue.length < 5 || objValue.length > 20) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }                      
                        //�û�������Ϊ����
                        if (/.*[\u4e00-\u9fa5]+.*$/.test(objValue)) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                        if (isPassck) {
                            if ($("#span_txtUserName").css("display") == "none") {
                                if (!isOnclick) {
                                    var isExistUser = Register.ckUserName($obj, "1");
                                    if (!isExistUser) {
                                        isPassck = false;
                                    }
                                }
                            }
                        }
                    }
                } else if (objId == "txtFristPassWord") { //����
                    var regexp=/^[a-zA-Z\W_\d]{6,16}$/; //6-16λӢ����ĸ�����֡����Ż����

                    if(!regexp.test(objValue)){
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck=false;
                    }
                    if (objValue == $.trim($("#txtSecondPassWord").val())) {
                        $("#divSecondPassErr").hide();
                    }
                }
                else if (objId == "txtSecondPassWord") {
                    //ȷ������
                    if (objValue!=$("#txtFristPassWord").val()) 
                    {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                }else if(objId=="txtOfficeAddress"){
                    if ($.trim(objValue)=="") 
                    {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                }
                else if(objId=="txtContactMobile"){  //�ֻ�����
                    var regis=/^(13|15|18|14)\d{9}$/;
                     if (objValue == "" || !regis.test(objValue)) {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                }else if(objId=="txtContactEmail"){  //Email
                    if(Register.IsModifUserNameEmail(objId)){
                        var regis=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
                        if(!Register.ckisExistEmail($obj)){
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck=false;
                        }
                         if (objValue == "" || !regis.test(objValue || !Register.ckisExistEmail($obj))) {                            
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                    }
                }else if(objId=="txtCompanyName"){ //��˾����
                    if(!$("#divSecondRegister").find("input[type='radio'][name='rdoCategory'][value='3']").attr("checked")){            
                        if (objValue == "") {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        } 
                    }
                }else if (objId=="txtContactName"){
                      if (objValue == "") {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        } 
                }else if (objId=="txtContactTel"){
                      if (objValue == "" || objValue.search(/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-?)?[1-9]\d{6,9}(\-\d{1,4})?$/) == -1) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                }
                else if (objId=="qq"){
                      if (objValue == "" || objValue.search(/^[1-9]\d{4,10}$/) == -1) {
                            $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                            $obj.parent("td").next().find("div").show();
                            $obj.parent("td").next().find("div img").show();
                            isPassck = false;
                        }
                }
                else if(objId=="proRequired"){
                    if(objValue==""){
                    }
                }
                else {
                    if (isOnclick) {
                        $obj.parent("td").next().find("div").removeClass().addClass("redtist");
                        $obj.parent("td").next().find("div").show();
                        $obj.parent("td").next().find("div img").show();
                        isPassck = false;
                    }
                }
                return isPassck;
            },
            CheckCompanySize:function(){
                var Size=$("#ctl00_Main_sltCompanySize").val();
                if(Size=="0")
                {
                     $("#ctl00_Main_sltCompanySize").parent("td").next().find("div").removeClass().addClass("redtist");
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div").show();
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div img").show();
                            isPassck = false;
                }
                else
                {
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div").hide();
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div img").hide();
                            isPassck = true;
                }
            },
            OnckMSN:function(obj){
            $(obj).parent("td").next().find("div").removeClass().addClass("tist");
                $(obj).parent("td").next().find("div").show();
            },
             inputpress:function(obj){
                $(obj).parent("td").next().find("div").show();
                $(obj).parent("td").next().find("div img").show();
            },
            inputblur:function(obj){
                $(obj).parent("td").next().find("div").hide();
                $(obj).parent("td").next().find("div img").hide();
            },
            OnblurMsn:function(obj){
            var objvalue=$.trim($(obj).val());
            if(objvalue!=""){
                        var msnReg = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
                         if(objvalue.search(msnReg)==-1){
                            $(obj).parent("td").next().find("div").removeClass().addClass("redtist");
                            $(obj).parent("td").next().find("div").html("����д��ȷ��msn�ʺ�,�Ա���ϵ.");
                            $(obj).parent("td").next().find("div").show();
                            $(obj).parent("td").next().find("div img").show();
                            isPassck = false;
                         }
                         else
                         {
                            $(obj).parent("td").next().find("div").html("������������MSN�� ����ͬ��MSN��ϵ");
                            $(obj).parent("td").next().find("div").hide();
                            $(obj).parent("td").next().find("div img").hide();
                         }
                    }
             else{
                $(obj).parent("td").next().find("div").hide();
                $(obj).parent("td").next().find("div img").hide();
              }
            },
            ckValidateCode: function() { //��֤��
                var $CodeObj = $("#<%=txtValidateCode.ClientID %>");
                var CodeisTrue = true;
                if ($.trim($CodeObj.val()) == "") {
                    $("#spanCodeisNull").show();
                    CodeisTrue = false;
                } else {
                    var validResult = false;
                    var arrStrCookie = document.cookie;
                    for (var i = 0; i < arrStrCookie.split(";").length; i++) {
                        var temName = arrStrCookie.split(";")[i].split("=")[0];
                        var temCode = arrStrCookie.split(";")[i].split("=")[1];
                        if ($.trim(temName) == "CompanyRegisterCode") {
                            if (temCode == $.trim($CodeObj.val())) {
                                validResult = true;
                            }
                        }
                    }
                    if (!validResult) {
                        $("#spanCodeErr").show();
                        CodeisTrue = false;
                    }
                }
                return CodeisTrue;
            },
            ChangeckPoct: function() { //�Ƿ�ͬ���������
                if (!$("#F_ckPact").attr("checked")) {
                    $("#span_PactErr").show();
                } else {
                    $("#span_PactErr").hide();
                }
            },
            GetSellCity: function() { //ѡ���������ҳ��е�ʱ�� �������۳��м���·����
                var Isfinally=false;           //�Ƿ�Ϊѡ��ר��,���ţ��ؽ�
                                    
                var ProvinceId = $("#ctl00_Main_ddl_ProvinceList").val();
                var CityId = $("#ctl00_Main_ddl_CityList").val();
                var IsGys= $("#divSecondRegister").find("input[type='radio'][name='rdoCategory'][value='2']").attr("checked");//ѡ������Ϊ��Ӧ��
                    
                var IsLineGys=$("#divSecondRegister").find("input[type='radio'][name='radManageArea'][value='0']").attr("checked"); //�ж��Ƿ�Ϊ��·
                var IsLine=$("#divSecondRegister").find("input[type='checkbox'][name='chxLine'][value='1']").attr("checked");// �Ƿ�ѡ��������ר�ߵ�
                var Isdijie=$("#divSecondRegister").find("input[type='checkbox'][name='chxLine'][value='3']").attr("checked");// �Ƿ�ѡ��������ר�ߵ�
                if(IsGys && IsLineGys)   //ѡ��ר��
                {
                    Isfinally=true;
                }else{
                    return;
                }
                
                if (ProvinceId != "0" && CityId != "0" && Isfinally) {
                    //���۳���
                    if(Isdijie && !IsLine)
                    {
                        $("#trSellCity").hide();
                    }
                    else
                    {
                        $("#trSellCity").show();
                    }
                    $.ajax({
                        type: "POST",
                        dataType: 'html',
                        url: "CompanyUserRegister.aspx?type=GetSaleCity&ProvinceId=" + ProvinceId,
                        cache: false,
                        success: function(html) {
                            $("#chengshilist").find("input[type='checkbox'][name='ckSellCity']").click(function() {
                                var ckSellCity = new Array();
                                $("#chengshilist").find("input[type='checkbox'][name='ckSellCity']:checked").each(function() {
                                    ckSellCity.push($(this).val());
                                });
                                if (ckSellCity.length == 0 && $.trim($("#inputOtherSaleCity").val()) == "") {
                                    $("#errMsgckSellCity").show();
                                }
                                else {
                                    $("#errMsgckSellCity").hide();
                                }
                            });
                            $("#inputOtherSaleCity").focus(function() {
                                $("#errMsgckSellCity").hide();
                            });
                            $("#inputOtherSaleCity").blur(function() {
                                var ckSellCity = new Array();
                                $("#chengshilist").find("input[type='checkbox'][name='ckSellCity']:checked").each(function() {
                                    ckSellCity.push($(this).val());
                                });
                                if (ckSellCity.length == 0 && $.trim($("#inputOtherSaleCity").val()) == "") {
                                    $("#errMsgckSellCity").show();
                                }
                            });

                        }
                    });

                    //��Ӫ��·����
                    $("#trSellCityAndArea").show();
                    $.ajax({
                        type: "POST",
                        dataType: 'html',
                        url: "CompanyUserRegister.aspx?type=GetTourArea&ProvinceId=" + ProvinceId + "&CityId=" + CityId + "&CityName=" + escape($("#ctl00_Main_ddl_ProvinceList option:selected").text() + $("#ctl00_Main_ddl_CityList option:selected").text()),
                        cache: false,
                        success: function(html) {
                            $("#tdAllSellCityAndArea").html(html);
                        }
                    });

                } else {
                    $("#trSellCity").hide();
                    $("#trSellCityAndArea").hide();
                }
            },
            SetRegisterState: function() {
                $("#btnSecondRegister").val("������д��ɣ��ύ������ϵͳ");
                $("#btnSecondRegister").removeAttr("disabled");
            },
            SetCategroyShow:function(typeval,isLoad){ //���������ʾ��ʾ��������            
                $("#divMain").find("input[type='radio'][name='rdoCategory']").each(function(){ //��֤��Ӧ�����
                    if(isLoad==false){  
                        if($(this).val()==typeval){         
                            $(this).attr("checked","checked")
                        }
                    }
                });
               
                $("#txtDlNumber").removeAttr("valid");
                $("#txtDlNumber").removeAttr("errmsg");  
                $("#trSellCityAndArea").hide();
                $("#trSellCity").hide();            
                $("#trGysCategory").hide(); 
                $("#trXlgysCategory").hide();
                $("#trLXSZZ").hide();
                $("#TrSimplemName").hide();
                $("#TrCompanyInfo").hide();
                $("#TrCompanySize").hide();
                $("#TrMainPro").hide();               
                $("#trTicket").hide();
                if(typeval==1){ //�ɹ���     
                    $("#tbyouke").show();
                    $("#trCgsType").show();
                }else if(typeval==2){  //��Ӧ��         
                    $("#trGysCategory").show();
                    $("#tbyouke").show();
                    $("#trCgsType").hide();                
                }else {     //�ο� ��3
                    $("#tbyouke").hide();
                    $("#trCgsType").hide();
                    //�Ƴ���֤
                    $("#tbyouke").find("input[type='text']").each(function(){
                        $(this).removeAttr("valid");
                        $(this).removeAttr("errmsg");
                    });                   
                }
            },
            GetCompanyType:function(){  //��ȡ��˾����
                var cType="";   
                var mainCategory;
                $("#divSecondRegister").find("input[type='radio'][name='rdoCategory']:checked").each(function(){
                    mainCategory=$(this).val();
                });
               if(mainCategory=="1"){  //�ɹ��̡�������|2��;�����������ɹ���|10��
                 $("#divSecondRegister").find("input[type='radio'][name='rdoCgsType']:checked").each(function(){
                   cType=$(this).val();
                });
               }else if(mainCategory=="2"){
                    var gysCate;
                    $("#divSecondRegister").find("input[type='radio'][name='radManageArea']:checked").each(function(){
                        gysCate=$(this).val();
                    });
                    if(gysCate=="0"){  //ר�ߺ͵ؽ�
                        var lineArr=new Array();
                         $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function(){
                                if($(this).attr("checked")){
                                    lineArr.push($(this).val());
                                }
                        });
                        if(lineArr.length>0){
                            $("#hdfZXandDj").val(lineArr.join(','));
                        }
                        var lxszz=new Array();//����������
                         $("#divSecondRegister").find("input[type='checkbox'][name='chxzz']").each(function(){
                                if($(this).attr("checked")){
                                    lxszz.push($(this).val());
                                }
                        });
                        if(lxszz.length>0){
                            $("#lxszz").val(lxszz.join(','));
                        }
                        cType=0;
                    }else{
                        cType=gysCate;
                    }
                }else{  //�ο�
                    cType=11;
                }
                return cType;
            },
            ApplyCgsGys:function(){  //������û������Ϊ�ɹ��̻��߹�Ӧ�̣���ʼ����ʾֵ
                  var category="<%=IsYkApplay%>";
                  if (category == "1" || category=="2")
                   {
                        $("#btnSecondRegister").val("ͬ�����·���������ύ����");
                        $("#rdoSbgg").attr("disabled","disabled");
                        $("#rdoSbgg").hide(); 
                        $("#lblsbgg").hide();    
                        $("#txtUserName").val("<%=UserName %>");
                        $("#txtContactName").val("<%=TureName %>");
                        $("#txtContactMobile").val("<%=Mobile %>");
                        $("#txtContactEmail").val("<%=Email %>");
                        $("#txtUserName").attr("disabled","disabled");
                        $("#txtFristPassWord").val("<%=SiteUserInfo!=null?SiteUserInfo.PassWordInfo.NoEncryptPassword:"" %>");
                        $("#txtSecondPassWord").val("<%=SiteUserInfo!=null?SiteUserInfo.PassWordInfo.NoEncryptPassword:"" %>");
                        
                        if(category=="1"){
                            $("#rdoCgs").attr("checked","checked");
                        }else if(category=="2"){
                            $("#rdoGys").attr("checked","checked");
                        }
                        
                    }else{  //����Ĭ����ʾΪ����棬������ʾ
                        category="3";
                    }
                  return category;  
            },
            IsModifUserNameEmail:function(ObjId){  //�ж��������Ƿ�ȥ��֤�û�����EmailΨһ��
              var isModif=true;  //������֤
              var category="<%=IsYkApplay%>";
              if (category == "1" || category=="2")
               {
                    if(ObjId=="txtUserName"){
                        isModif=false;
                    }
                    if(ObjId=="txtContactEmail")
                    {   
                        if( $.trim($("#txtContactEmail").val())==$.trim("<%=Email %>")){
                            isModif=false;
                        }
                    }
                }
                return isModif;
            },
           CheckLineCheckBox:function(){    //��֤��·���ѡ��
              var arrline=new Array();
              $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function(){
                if($(this).attr("checked")){
                    arrline.push($(this).val());
                }
              });
              var IsLine=false;
              if(arrline.length==0){
                $("#errMsg_chxLine").html("��ѡ����·��Ӧ�����");
                $("#trSellCityAndArea").hide();
                $("#trSellCity").hide()
              }else{
                if($("#ctl00_Main_ddl_CityList").val()!="0")
                {
                    Register.GetSellCity(); 
                    $("#trSellCityAndArea").show();
                    $("#errMsg_chxLine").html("");
                    for(var i=0;i<arrline.length;i++){
                        if(arrline[i]=="1"){
                            IsLine=true;
                        }else{
                            if(IsLine==false){
                                $("#trSellCity").hide();
                            }
                        }
                    }
                }
              }
            },
            IsShowAreaError: function(){
                $("#errMsgckRouteArea").hide();
            }
        };
        
          function BindProvinceCheckboxList(SaleProvince)
         {
             var str="<ul style='clear:both;'>";
                        for(var i=0; i<ProvinceCount; i++)
                        {
                            str=str+"<li style='float:left; width:80px;'><input class=\"checkprovice\" name=\"CheckProvice\" type=\"checkbox\" value=\""+arrProvince[i][1]+"\"/>"+arrProvince[i][0]+"</li>";
                        }
                        str+="</ul>";
                    $("#"+SaleProvince).html(str);
         }
         
       $(function() {
       //��ȡѡ��ĳ���
       var citylist="";
        $("[name='ckSellCity'][checked]").each(function(){
            citylist+=$(this).val()+",";
        });
       
       //ѡ��(ȡ��) ʡ��=====> ��ȡ(ȡ��) ��Ӧ�����б�
        $(".checkprovice").live("click",function(){
        var proid=$(this).val();
        if($(this).attr("checked")==true)
        {
            $.ajax({
            type: "POST",
            async: false,
            dataType: 'html',
            url: "ComPanyUserRegister.aspx?type=GetSaleCity&ProvinceId=" + $(this).val(),
            success: function(html) {
                $("#OtherCity").before('<div class="provincelist" id="province'+proid+'"></div>');
                $("#province"+proid).html(html);
                $("#errMsgckSellCity").hide();
                        }
                 });
        }
        else
        {
            $("#province"+proid).remove();
        }
        
        });
        });

        $(function() {
        
            Register.SetCategroyShow(Register.ApplyCgsGys(),true);
            $("#divMain .bitian").focus(function() {
                var isSbgg=$("#rdoSbgg").attr("checked");  //ѡ������䣬����֤��˾��
                if ($.trim($(this).val()) == "") {                                        
                    $(this).parent("td").next().find("div").removeClass().addClass("tist");
                    $(this).parent("td").next().find("div img").hide();
                    $(this).parent("td").next().find("div").show(); 
                }   
                          
                if(isSbgg){
                    $("#txtCompanyName").parent("td").next().find("div").removeClass("tist");
                    $("#txtCompanyName").parent("td").next().find("div img").hide();
                    $("#txtCompanyName").parent("td").next().find("div").hide();      
                }
                if ($(this).attr("id") == "txtUserName") {
                    $("#span_txtUserName").hide();
                }                
                $("#spanCodeisNull").hide();
                $("#spanCodeErr").hide();
            });
            $("#divMain .bitian").blur(function() {
                Register.ckInputisNull($(this), true,false);
                if ($(this).attr("id") == "ctl00_Main_txtValidateCode") {
                    Register.ckValidateCode();
                }
            });

            $("#ctl00_Main_ddl_ProvinceList").change(function() {
                $("#errMsg_City").hide();
                $("#trSellCityAndArea").hide();
                if ($(this).val() != "0") {
                    $("#errMsg_Province").hide();
                } else {
                    $("#errMsg_Province").show();
                }
            });

            $("#ctl00_Main_ddl_CityList").change(function() {
                if ($("#ctl00_Main_ddl_ProvinceList").val() != "0") {
                    if ($(this).val() != "0") {
                        $("#errMsg_City").hide();
                    } else {
                        $("#errMsg_City").show();
                    }
                } else {
                    $("#errMsg_Province").show();
                }
                //�����۳��м���·����
                Register.GetSellCity();
            });
            $("#ctl00_Main_sltCompanySize").change(function(){
                if($("#ctl00_Main_sltCompanySize").val()=="0")
                {
                     $("#ctl00_Main_sltCompanySize").parent("td").next().find("div").removeClass().addClass("redtist");
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div").show();
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div img").show();
                            isPassck = false;
                }
                else
                {
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div").hide();
                            $("#ctl00_Main_sltCompanySize").parent("td").next().find("div img").hide();
                            isPassck = true;
                }
            });

            FV_onBlur.initValid($("#btnSecondRegister").closest("form").get(0));
            $("#btnSecondRegister").click(function() {
                    var form = $(this).closest("form").get(0);
                    var isVaildTxt=true; //��֤�û��������룬�ֻ���EMail,��˾����  
                     $("#divMain .bitian").each(function() { 
                        Register.ckInputisNull($(this), true,true);
                    });
                   // Register.ckValidateCode(); //��֤��֤��
                   Register.CheckCompanySize();//��֤��˾��ģ
                    if(!ValiDatorForm.validator(form, "span")){
                        isVaildTxt=false;
                    }
                    var typeval;  //���
                    $("#divSecondRegister").find("input[type='radio'][name='rdoCategory']").each(function(){             
                        if($(this).attr("checked")){
                             typeval=$(this).val();                       
                        }
                    });  
                  if(typeval==3){
                     $("#divMain .bitian").each(function() {
                        var contrId=$(this).attr("id"); 
                        if(contrId!="ctl00_Main_txtValidateCode" && contrId!="txtCompanyName" ){  
                             if (!Register.ckInputisNull($(this), true,true)) {
                                    isVaildTxt = false;
                                    return false;
                             }
                        } 
                    })
                 }else{
                     $("#divMain .bitian").each(function() {
                        var contrId=$(this).attr("id") ;              
                        if (contrId!="ctl00_Main_txtValidateCode") {
                            if (!Register.ckInputisNull($(this), true,true)) {
                                isVaildTxt = false;
                                return false;                                
                            } 
                         }
                     });
                 }
                 $("#spSelCategory").html("");
                if(typeval=="1"){ //�ɹ��̣���֤�ɹ�������
                  $("#errMsg_radManageArea").html("");
                     //��֤ʡ�ݺͳ���
                      if ($("#ctl00_Main_ddl_ProvinceList").val() == "0") {
                            $("#errMsg_Province").show();
                            isVaildTxt = false;
                      } else {
                            $("#errMsg_Province").hide();
                            if ($("#ctl00_Main_ddl_CityList").val() == "0") {
                                $("#errMsg_City").show();
                                isVaildTxt = false;
                            } else {
                                $("#errMsg_City").hide();
                            }
                      }  
                }else if(typeval=="2"){  //��Ӧ�̣���֤��Ӧ�����
                    var count="-1";
                    $("#divSecondRegister").find("input[type='radio'][name='radManageArea']:checked").each(function(){ //��֤��Ӧ�����
                        count=$(this).val();
                    });
                    if(count=="-1"){  //û��ѡ��ɹ�������
                        $("#errMsg_radManageArea").html("��ѡ��Ӧ�����");
                        isVaildTxt=false;
                    }else{
                         $("#errMsg_radManageArea").html("");
                         //��֤ʡ�ݺͳ���
                          if ($("#ctl00_Main_ddl_ProvinceList").val() == "0") {
                                $("#errMsg_Province").show();
                                isVaildTxt = false;
                          }else {
                                $("#errMsg_Province").hide();
                                if ($("#ctl00_Main_ddl_CityList").val() == "0") {
                                    $("#errMsg_City").show();
                                    isVaildTxt = false;
                                } else {
                                    $("#errMsg_City").hide();
                                }
                          }          
                         if(count==0){  //ѡ����·
                                //��֤��·��Ӧ�����
                                var arrline=new Array();
                                $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function(){
                                    if($(this).attr("checked")){
                                        arrline.push($(this).val());
                                    }
                                });
                                if(arrline.length==0){
                                    $("#errMsg_chxLine").html("��ѡ����·��Ӧ�����");
                                        isVaildTxt=false;
                                }else{
                                    var isLine=false;
                                    for(var i=0;i<arrline.length;i++){
                                        if(arrline[i]=="1"){
                                            isLine=true;
                                        }
                                    }
                                    if(isLine){  //��·��Ҫ��֤���۳��У���·����
                                        var ckCompanyType = new Array();
                                        $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']:checked").each(function() {
                                            ckCompanyType.push($(this).val());
                                        });
                                        if (ckCompanyType.length == 0) {
                                            isVaildTxt = false;
                                            $("#errMsg_ckCompanyType").show();
                                        } else {
                                                if ($("#divSecondRegister").find("input[type='checkbox'][name='chxLine'][value='1']").attr("checked")) {
                                                        var ckSellCity = new Array();
                                                        $("#chengshilist").find("input[type='checkbox'][name='ckSellCity']:checked").each(function() {
                                                            ckSellCity.push($(this).val());
                                                        });
                                                        if (ckSellCity.length == 0 && $.trim($("#inputOtherSaleCity").val()) == "") {
                                                            isVaildTxt = false;
                                                            $("#errMsgckSellCity").show();
                                                        }
                                                  }
                                              }
                                    }
                                    if (arrline.length > 0) //ѡ��ר�߻��ߵؽӵĻ���Ҫ��֤����ѡ����·����
                                    {
                                        if ($("input[type='checkbox'][name='checkbox_Area']:checked").length <= 0)
                                        {
                                            isVaildTxt = false;
                                            $("#errMsgckRouteArea").show();
                                        }
                                    }
                                }
                            }
                         
                        }
                    }else if (typeval=="3"){  //�ο�
                        typeval=11;
                    }else{
                        $("#spSelCategory").html("��ѡ�����");
                        return;
                    }
                  if(!Register.ckValidateCode()){  //��֤��֤��
                    isVaildTxt=false;
                  }
                  if (!$("#F_ckPact").attr("checked")) {  //��֤ͬ������
                        $("#span_PactErr").show();
                        isVaildTxt = false;
                  }
                var companyType=Register.GetCompanyType();  //��ȡ��˾����  
                if (isVaildTxt) { 
                    var addType="add"
                    var category="<%=IsYkApplay%>";  //�Ƿ�Ϊ����           
                    var MsgSucc="ע��ɹ���";
                    var MsgError="ע��ʧ�ܣ�";
                   if (category == "1" || category=="2")
                   {
                        addType="update";
                        $("#btnSecondRegister").val("�����ύ����....");
                        MsgSucc="����ɹ���";
                        MsgError="����ɹ���";
                   }else{
                        $("#btnSecondRegister").val("�����ύע��....");
                   }
                    $("#btnSecondRegister").attr("disabled", "disabled");
                    $.ajax({
                        type: "POST",
                        dataType: 'html',
                        data: $("#aspnetForm").serializeArray(),
                        url: "CompanyUserRegister.aspx?type="+addType+"&companytype="+companyType,
                        cache: false,
                        success: function(html) {
                            if (html == "1") { //�ɹ�                                  
                                alert(MsgSucc);                                  
                                $("#btnSecondRegister").val("���ڵ�¼��....");
                                $("#btnSecondRegister").attr("disabled", "disabled");
                                blogin.ssologinurl = "<%=EyouSoft.Common.Domain.PassportCenter %>";
                                blogin2($("#txtUserName").val(), $("#txtFristPassWord").val(), "", "<%= EyouSoft.Common.Domain.UserPublicCenter %>/Register/RegisterSuccess.aspx?CityId=<%=CityId %>", function(message) {
                                    alert(message);
                                    Register.SetRegisterState();
                                });
                            }
                            else if (html == "3") {
                                alert("�û����Ѿ�����!");
                                $("#txtSecondUserName").focus();
                                Register.SetRegisterState();
                            }
                            else if (html == "2") {
                                alert("�����Ѿ�����!");
                                $("#txtContactEmail").focus();
                                Register.SetRegisterState();
                            } 
                            else if (html == "5") {
                                alert("ע��̫Ƶ�������Ժ�����!");
                                Register.SetRegisterState();
                            }else {
                                alert(MsgError);
                                Register.SetRegisterState();
                            }
                        }
                    });
                }
            });
            $("#divSecondRegister").find("input[type='radio'][name='rdoCategory']").each(function(){
               $(this).click(function(){
                    
                        $("#spSelCategory").html("");
                        Register.SetCategroyShow($(this).val(),false); 
                        $("#divcatetext").show();
                        if($(this).val()=="1"){
                            $("#spCateText").html(CategoryText1);
                        }else if($(this).val()=="2"){
                            $("#spCateText").html(CategoryText2);
                        }else{
                            $("#spCateText").html(CategoryText3);
                        }
                    
                     $("#divSecondRegister").find("input[type='radio'][name='radManageArea']:checked").each(function(){
                         $(this).removeAttr("checked");
                     });
                     $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function(){
                        if($(this).attr("checked")){
                                $(this).removeAttr("checked");
                            }
                     });                     
               });
               $(this).blur(function(){
                    $("#spCateText").html(""); $("#divcatetext").hide();
               });
            });
             $("#divSecondRegister").find("input[type='radio'][name='radManageArea']").each(function(){
               $(this).click(function(){
                    if($(this).attr("checked"))
                    {
                       $("#errMsg_radManageArea").html("");
                      var seltype=$(this).val();
                       $("#trTicket").hide();
                        $("#trSellCity").hide();
                        $("#trSellCityAndArea").hide();
                        $("#txtDlNumber").removeAttr("valid");
                        $("#txtDlNumber").removeAttr("errmsg");
                      if(seltype==0){    //��·����Ҫ��ʾ��·��Ӧ�����
                        $("#trXlgysCategory").show();
                        $("#trLXSZZ").show();
                        $("#TrSimplemName").show();
                        $("#TrCompanyInfo").show();
                        $("#TrCompanySize").show();
                        $("#TrMainPro").show();     
                        $("#txtDlNumber").removeAttr("valid");
                        $("#txtDlNumber").removeAttr("errmsg");
                      }else{
                         $("#divSecondRegister").find("input[type='checkbox'][name='chxLine']").each(function(){
                            if($(this).attr("checked")){
                                $(this).removeAttr("checked");
                            }
                         });
                        $("#trXlgysCategory").hide();
                        $("#trLXSZZ").hide();
                         $("#TrSimplemName").hide();
                        $("#TrCompanyInfo").hide();
                        $("#TrCompanySize").hide();
                        $("#TrMainPro").hide();   
                        if(seltype==9){
                            $("#trTicket").show();
                            $("#txtDlNumber").attr("valid","required");
                            $("#txtDlNumber").attr("errmsg","�����������");
                        }else{
                            $("#txtDlNumber").removeAttr("valid");
                            $("#txtDlNumber").removeAttr("errmsg");
                        }
                      }
                    }                    
               });
            });
          
             $("#<%=txtValidateCode.ClientID %>").bind("keypress", function(e){
                if (e.keyCode == 13) {
                    $("#btnSecondRegister").click(); 
                    $("#ctl00_Main_sltCompanySize").change();
                    return false;
                }
            });
              if('<%=Request.QueryString["cType"]%>'=='gy'){
               $("#rdoGys").click();
            }
            if('<%=Request.QueryString["cType"]%>'=='cg'){
               $("#rdoCgs").click();
            }
        });
        
  
    </script>

</asp:Content>

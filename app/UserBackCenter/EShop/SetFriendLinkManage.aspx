<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetFriendLinkManage.aspx.cs" Inherits="UserBackCenter.EShop.SetFriendLinkManage" %>

<%@ Import Namespace="EyouSoft.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����������</title>
    <link href="<%=CssManage.GetCssFilePath("main") %>" rel="stylesheet" type="text/css" />
    <link href="<%=CssManage.GetCssFilePath("backalertbody") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <div style="width: 100%;" id="FriendLinkList">
    </div>     
    </form>
     <script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>

       <script type="text/javascript" src="<%=JsManage.GetJsFilePath("validatorform") %>"></script>   
       
    <script language="javascript" src="/js/jquery-1.3.2.min.js" type="text/javascript"></script>

    

    <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            initPage();           
        });
        function newAjax(contentId,Url,dataArr,callBack)
        {  
          $.ajax
            ({  
                url:Url+"?"+dataArr,
                cache:false,
                async:false,
                success:function(html)
                {
                 if(contentId) {
                        $("#"+contentId).html(html);
                     }
                     var type= typeof(callBack);
                     switch(type){
                        case 'function':
                            callBack(html);
                            break;
                        case 'string':
                            eval(callBack);
                        default:
                            break;             
                     }
                    }              
            });  
        }
        function initPage()
        {            
        var compid="<%=CompanyId %>";
            newAjax("FriendLinkList","AjaxFriendLinkManage.aspx","CompanyId="+compid,deleteFriendLink);
            
        }
        function checkUrl(urlValue)
        {
            var checkValue=$.trim(urlValue);
            var result=null;
            if(checkValue!=""){
                var patrn=/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\\\"\\\"])*$/;               
                result=patrn.exec(checkValue);                                         
            }   
            return result;  
        }
        //ɾ������
        function deleteFriendLink()
        {
            $(".a_dellink").each(function(){
                $(this).click(function(){
                    if(window.confirm("��ȷ��Ҫɾ���������𣬴˲������ɻָ���"))
                    {
                        var linkId=$(this).attr("linkId");
                        $.ajax
                        ({  
                            url:"SetFriendLinkManage.aspx?action="+"delete"+"&FriendLinkId="+linkId,
                            cache:false,
                            async:false,
                            success:function(html)
                            {
                                $("#FriendLinkList").html(html);
                                var type= typeof(callBack);
                                 switch(type){
                                    case 'function':
                                        callBack(html);
                                        break;
                                    case 'string':
                                        eval(callBack);
                                    default:
                                        break;
                                  }      
                               if(html=="1"){
                                    initPage();
                                    alert("ɾ�����ӳɹ���")
                                }else{
                                    alert("ɾ������ʧ�ܣ�")
                                }  
                              },            
                            error:function()
                             {
                                alert("����ʧ��");
                             }
                        }); 
                    }
                });
            });
             $("#addFriendLink").click(function(){                 
                 var LinkAddress=$("#txtLinkAddress").val(); 
                var SortId=$("#txtSortId").val();
                 if($("#txtLinkName").val()==""){ 
                    alert("�������Ʋ���Ϊ�գ�")
                    return false;
                 }
                 if(!checkUrl(LinkAddress))
                 {
                    alert("���ӵ�ַ�������")
                    return false;
                 }   
                 if(!checkIsNumber(SortId)){ 
                    alert("����ֵӦΪ������")
                    return false;
                 }                       
                $.ajax
                ({  
                    url:"SetFriendLinkManage.aspx?action="+"addFriendLink"+"&LinkAddress="+LinkAddress+"&LinkName="+escape($("#txtLinkName").val())+"&SortId="+SortId,
                    cache:false,
                    async:false,
                    success:function(html)
                    {
                        $("#FriendLinkList").html(html);                           
                        var type= typeof(callBack);
                         switch(type){
                            case 'function':
                                callBack(html);
                                break;
                            case 'string':
                                eval(callBack);
                            default:
                                break;   
                          }   
                         if(html=="1"){
                            initPage();
                            alert("������ӳɹ���")
                            //$("#txtLinkAddress").val('http://');
                            //$("#txtLinkName").val('');
                            //$("#txtSortId").val('0');
                        }else
                        {
                            initPage();                          
                            if(eval(html)){
                                alert(eval(html))
                            }else{
                                alert("�������ʧ�ܣ�")
                            }
                        }   
                    },            
                    error:function()
                    {
                        alert("����ʧ��");
                    }
                });               
            });
            
            $(".a_updatelink").each(function(i){
                $(this).click(function(){                
                        var linkId=$(this).attr("linkId");
                        var LinkAddress=$("input[name='LinkAddress']").eq(i).val();
                        var LinkName=escape($("input[name='LinkName']").eq(i).val());
                         var SortId=$("input[name='linkSort']").eq(i).val();    
                        if(LinkName==""){ 
                            alert("�������Ʋ���Ϊ�գ�")
                            return false;
                        }
                        if(!checkUrl(LinkAddress))
                        {
                            alert("�����������")
                            return false;
                        } 
                        if(!checkIsNumber(SortId)){ 
                            alert("����ֵӦΪ������")
                            return false;
                        }
                       
                    $.ajax
                    ({  
                        url:"SetFriendLinkManage.aspx?action="+"update"+"&LinkAddress="+LinkAddress+"&LinkName="+LinkName+"&SortId="+SortId+"&FriendLinkId="+linkId,
                        cache:false,
                        async:false,
                          success:function(html)
                            {
                                $("#FriendLinkList").html(html);
                                 var type= typeof(callBack);
                                 switch(type){
                                    case 'function':
                                        callBack(html);
                                        break;
                                    case 'string':
                                        eval(callBack);
                                    default:
                                        break; 
                                 }     
                                  if(html=="1"){
                                        initPage();
                                        alert("�޸����ӳɹ���");
                                }else{
                                     initPage();
                                        if(eval(html)){
                                            alert(eval(html))
                                        }else{
                                            alert("�޸�����ʧ�ܣ�")
                                        }
                                    }   
                           },            
                        error:function()
                         {
                            alert("����ʧ��");
                         }
                    });              
                });
            })
        }
        function checkUrl(urlValue)
        {
            var checkValue=$.trim(urlValue);
            var result=null;
            if(checkValue!=""){
                var patrn=/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\\\"\\\"])*$/;               
                result=patrn.exec(checkValue);                                         
            }   
            return result;  
        }
        function checkIsNumber(sortvalue)
        {
            var checkvalue=$.trim(sortvalue);
            var result=null;
            if(sortvalue!="")            
            {
                var part= /^[-\+]?\d+(\.\d+)?$/;
                result=part.exec(sortvalue);
            }   
            return result;
        }

       
    </script>
</body>
</html>

﻿/* createdate: 2010-06-18 该文件重新生成后,请同步web.config文件中的SmsKeys节点值*/
var SmsDisabledKeys=["<",">","法轮功","洪志","法轮","宏志","真善忍","大法","fa lun","falun","发轮","发伦","发抡","发沦","发囵","发仑","发纶","法纶","法仑","法囵","法沦","法抡","法伦","功友","师父","法论","发论","法.轮.功","法 轮 功","自焚","自焚","玄`机","江独裁","江八点","江泽民","朱容基","胡锦涛","十六大","共产党","政治风波","疆独","民猪","民运","古怪歌","推翻","示威","政变","台*湾","吕秀莲","西藏","中华民国","造反","新华内情","达赖","镇压","东突","游行","上访","罢课","屎","集会","广闻","压迫","反革命","疆独","无能","教徒","共产党","吕秀莲","正法","抗日","小泉","靖国神社","钓鱼岛","香港总部","暴乱","窃听器","弹药","枪支","六合彩","色情","嫖娼","三陪","他妈的","龙卷风","淫秽","非典","包赢","日他","Soccer01.com","黑庄","13423205670","畜生","蠢猪","婊子","王八蛋","迷药","九码","六码","三码","干你娘","妓女","fuck","强奸","dafa","小鸡鸡","操你","鸡巴","日你妈","傻B","SIM卡抽奖","操你娘","肉棒","J巴","做爱","作爱","淫","我X X你","我XX你","伴游","人民大众","时事参考","人民内情真相","新华举报","鸡毛信文汇","人民真实报道","大参考","大纪元","联总之声","传单","舆论","美国之音","人民报讯","E周刊","博讯","人民报","中俄边界新约","国研新闻邮件","简鸿章","新闻封锁","人民大众时事参考","鸡毛信文汇","联总之声传单","九、评","九.评","九评","九-评","猛料","通信维权","突厥斯坦","印尼伊斯兰祈祷团","东突厥斯坦","伊斯兰运动","拉登","拉丹","自由运动","回民","天葬","中国移动通信","CDMA","绿色环保手机","IP17908","7.310","9.635","兆赫","灵动卡","刷卡消费","银行联合管理局","68170802","商务领航","深圳国领","深圳红岭","代开发票","17大","刷现","套现","现刷","报名","火热","热线"];

//打印
function PrintPage()
{ 
    //隐藏原始页面内容
    $("#div_hideprint").hide();
    //保存，并显示要打印的html
    $("#div_savePrintInfo").html($("#divprint").html()).show();
    //打印
    if (window.print != null) {
        window.print();
    } else {
        alert('没有安装打印机');
    }
    //还原页面内容
    window.setTimeout(function() {
        $("#div_savePrintInfo").hide().html('');
        $("#div_hideprint").show();
    }, 1000);
}
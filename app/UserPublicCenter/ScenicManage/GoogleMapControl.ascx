<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GoogleMapControl.ascx.cs"
    Inherits="UserPublicCenter.ScenicManage.GoogleMapControl" %>
    <%@ Import Namespace="EyouSoft.Common" %>
<style type="text/css">
    #map_canvas
    {
        width: 708px;
        height: 415px;
        border:1px solid gray;
    }
</style>
<div id="map_canvas">
    <%= LoadintText %>
</div>

<script type="text/javascript" src="<%=JsManage.GetJsFilePath("jquery") %>"></script>
<script type="text/javascript" src="http://ditu.google.com/maps?file=api&amp;v=2&amp;key=undefined"></script>
<script type="text/javascript" src="http://ditu.google.com/maps?file=api&amp;v=2&amp;key=<%= GoogleMapKey %>"></script>
<script type="text/javascript">
    /**
    * 创建地图控件
    */
    function initialize() {
        alert("aaaa");
        if (GBrowserIsCompatible()) {
            alert("aaaa3");        
            map = new GMap2(document.getElementById('map_canvas'));
            // 将视图定位到当前经纬度
            map.setCenter(new GLatLng(<%= Latitude %>, <%= Longitude %>), 13);

            var ico = new GIcon(G_DEFAULT_ICON, '<%= EyouSoft.Common.Domain.ServerComponents %>/scenicspots/T1/images/googleMapRed.png');
            var targetPt = new GLatLng(<%= Latitude %>, <%= Longitude %>);
            var marker = new GMarker(targetPt, { icon: new GIcon(ico) });
            marker.openInfoWindow(createInfoWindow());
            
            // 平移及缩放控件（左上角）、缩略图控件（右下角）
            map.addControl(new GLargeMapControl());
            
            map.addControl(new GOverviewMapControl());
            
            //启用鼠标滚轮缩放地图
            map.enableScrollWheelZoom();
            // 为标注添加事件处理函数：单击标注时要显示气泡窗口 
	        GEvent.addListener(marker, 'click', function() { 
			        marker.openInfoWindow(createInfoWindow()); 
	        } );
            map.addOverlay(marker);
            if(<%= ZoomLevel %>!=0)
                    map.setZoom(<%= ZoomLevel %>);
        }
    }

    /**
    * 为气泡提示窗口创建 DOM 对象
    */
    function createInfoWindow() {
        // 为气泡提示窗口创建动态 DOM 对象，这里我们用 DIV 标签
        var div = document.createElement('div');
        div.innerHTML = '<div style="font-size: 9pt; width:<%= ShowTitleDivWidth %>px;height:<%= ShowTitleDivHeight %>px"><%= ShowTitleText %></div>';

        // 当用户关闭气泡时 Google Map API 会自动释放该对象  
        return div;
    }
    $(function() {
        initialize();
    });
    
</script>


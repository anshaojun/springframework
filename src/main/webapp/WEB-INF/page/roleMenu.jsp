<%@ include file="include/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    function loadMenu() {
        var data = [];
        $.ajax({
            type: "post",
            dataType: "json",
            async: false,
            data:{"roleId":'${role.id}',"checkbox":true},
            url: ctx + "/menuManage/loadMenu.do",
            success: function (result) {
                data = result;
            }
        });
        return data;
    }
    function getSelected() {
        var paramJsonArr = DemoTree.getCheckbarJsonArrParam();
        var nodeid = paramJsonArr["nodeId"];
        return nodeid;
    }
    var DemoTree;
    //菜单树
    layui.extend({
        dtree: '${ctx}/js/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['dtree', 'layer', 'jquery'], function () {
        var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery;
        // 初始化树
        DemoTree = dtree.render({
            elem: "#menu_tree",
            data: loadMenu(), // 使用data加载
            line: true,
            skin: "zdy",
            checkbar: true,
            checkbarType: "all" // 默认就是all，其他的值为： no-all  p-casc   self  only
        });
    });

</script>
<body>
<ul id="menu_tree"></ul>
</body>
<script>
</script>
</html>

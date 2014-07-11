$(function(){

    $(".roll").myScroll({
        speed:40,
        rowHeight:24 //行高,即li的高度，如果有margin/padding,也在计算之中
    });

    //回到底部
    $(window).scroll(function(){
        var scrollt = document.documentElement.scrollTop + document.body.scrollTop; //获取滚动后的高度
        if( scrollt >200 ){  //判断滚动后高度超过200px,就显示
            $("#gotop").fadeIn(400); //淡出
        }else{
            $("#gotop").stop().fadeOut(400); //如果返回或者没有超过,就淡入.必须加上stop()停止之前动画,否则会出现闪动
        }
    });
    $("#gotop").click(function(){ //当点击标签的时候,使用animate在200毫秒的时间内,滚到顶部
        $("html,body").animate({scrollTop:"0px"},200);
    });


    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('img.review').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(document).on('change', 'input[type=file]', function(){
        readURL(this);
    });

    $(document).on('click', 'a[class="show_more_industries_nav"]', function(){
        $(".more_industries_nav").toggle();
    });

    $(document).on('click', 'a[class="more_nav"]', function(){
        $(".more_nav_content").toggle();
    });

    $(document).on('change', '#industry_id', function(){
        var id = $(this).val()
        if(id){
            window.location.href = "/industry/"+$(this).val()+"/enterprises";}else{
            window.location.href = "/enterprises";
        }
    })

    $('.grab_data').on('ajax:error', function(event, xhr, status) {
        alert("抓取失败，错误信息为："+xhr.responseText)
        $(this).find("i").removeClass("icon-spinner icon-spin")
    }).on('ajax:beforeSend', function(event, xhr, settings) {
            $(this).find("i").addClass("icon-spinner icon-spin")
        }).on('ajax:success', function(evt, data, status, xhr) {
            $(this).find("i").removeClass("icon-spinner icon-spin")
            alert(data.notice)
        });
});

function delete_item(o,title){
    var url = $(o).attr("ref");
    var statue =  window.confirm("删除后，"+title+",你确定删除吗?");
    if(statue){
        $.post(url,{_method: "delete"},function(){
        })
        alert("删除成功！")
        if($(o).attr("title")=="删除该企业"){
            window.location.href = "/enterprises";
        }else{
          window.location.reload();
        }
    }else{return false}

}

function post_domain_id_and_industry_id_validate(){
    if ($("#post_domain_id").val()=="" && $("#post_industry_id").val()==""){
        alert("错误！请为该条信息选择合适的行业或者类别后再提交！")
        return false;
    }else{
        return true;
    }
}


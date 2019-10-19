/**
 * 
 */
function loadIndexArticle(urlpath)
{
    $.ajax
    ({
            url:urlpath+"/article/indexArticleList",
            type:"get",
            async:true,
            dataType:"json",
            success:function(result)
            {
                 for(var i=0;i<result.length;i++)
                 {
                	 var article = result[i];
                	 createArticleLi(article,urlpath);
                 }           
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

function createArticleLi(article,urlpath)
{
	var sli = "";
	//把通过ajax以Json数据格式获得的日期数据格式化成date类型，并加以处理
	article.publishtime=formatDate(new Date(article.publishtime),"yyyy-MM-dd hh:mm:ss");
	//var content= new String();
	//content = article.content;
	//article.content = content.substring(0, 20);
    article.content = removeHtmlTag(article.content);
    if(article.content.length > 50)
        article.content = article.content.substring(0, 50) + "……";
    sli += '<li>' +
			'<div class="entryImg">' + 
			'<a title="'+ article.title + '" target="_blank"' +
			'href="'+urlpath+'/article/articleContent/'+article.aid+
            '"> <img width="640" height="360"' + 
			'src="'+article.mainpic+'"' +
			'class="attachment-post-thumbnail size-post-thumbnail wp-post-image"' +
			'alt="show.jpg"' +
			'sizes="(max-width: 640px) 100vw, 640px" /></a> <span' +
			' class="entryCopyright">精选</span>' +
			'</div>' +

			'<h3 class="entryTitle">' +
			'<a title="' + article.title + '" target="_blank"' +
			'href="'+urlpath+'/article/articleContent/'+article.aid+'">' + article.title  + 
            '</a></h3>' +
			'<p class="entryContent">' + article.content +
			'</p><div class="entryMeta">' +
			'<em class="entryDate">来源：</em>' + 
			'<em class="entryDate"><a target="_blank" href="http://' + 
			article.source +
			'">' + 
			article.source + 
			'</a></em>' +
			' <em class="entryDate">/ ' + article.publishtime + 
			'</em>' +
			'</div>' +
    		'<br />' +
    		'<br />' +
    		'<br />' +
    		'</li>';
    
    $("#article_ul").append(sli);
}

function formatDate(date,format)
{
    var paddNum = function(num)
    {
      num += "";
      return num.replace(/^(\d)$/,"0$1");
    }
    //指定格式字符
    var cfg = {
       yyyy : date.getFullYear() //年 : 4位
      ,yy : date.getFullYear().toString().substring(2)//年 : 2位
      ,M  : date.getMonth() + 1  //月 : 如果1位的时候不补0
      ,MM : paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
      ,d  : date.getDate()   //日 : 如果1位的时候不补0
      ,dd : paddNum(date.getDate())//日 : 如果1位的时候补0
      ,hh : date.getHours()  //时
      ,mm : date.getMinutes() //分
      ,ss : date.getSeconds() //秒
    }
    format || (format = "yyyy-MM-dd hh:mm:ss");
    return format.replace(/([a-z])(\1)*/ig,function(m){return cfg[m];});
  } 


//index翻页操作
function turnPage(urlpath)
{ 
    document.getElementById("nextPage").style.display="none";

    //document.getElementById("article_ul").innerHTML="";
    //根据第几次请求来加载数据库数据
	indexAjaxLoadArticle(times,urlpath);
    //若后面还有数据，者把新增数据的页面的前10个li元素删除，实现翻页效果
    //若没有数据了，就把按钮隐藏掉
    if(noData() == false)
    {
        var aul = document.getElementById("article_ul"); 
        var ali = aul.getElementsByTagName("li");
        //5*ajaxTimes-1,5表示pagesize，一次加载pagesize个内容
        //更改此处5的数值，同时也要更改java文件里面的最先自动加载的个数数值
        for(var i = 5*ajaxTimes-1; i >= 0; i--) 
        { 
            ali[i].parentNode.removeChild(ali[i]);
        } 
        times++;
        //翻页后回到页面最上面
        document.body.scrollTop = document.documentElement.scrollTop = 0;
        document.getElementById("prevPage").style.display="";
    }
}

//普通页翻页操作
function turnPageTwo(urlpath)
{ 
    document.getElementById("nextPage").style.display="none";
    
    //document.getElementById("article_ul").innerHTML="";
    //根据第几次请求来加载数据库数据
	//var categoryId = "${categoryList.get(2)}";
    //alert(times+" "+categoryId);
    //alert("times="+times+" categoryId="+categoryId);
	ajaxLoadArticleById(times, categoryId,urlpath);
    //若后面还有数据，者把新增数据的页面的前10个li元素删除，实现翻页效果
    //若没有数据了，就把按钮隐藏掉
    if(noData() == false)
    {
        document.body.scrollTop = document.documentElement.scrollTop = 0;
        document.getElementById("prevPage").style.display="";
        
        var aul = document.getElementById("article_ul"); 
        var ali = aul.getElementsByTagName("li");
        //5*ajaxTimes-1,5表示pagesize，一次加载pagesize个内容
        //更改此处5的数值，同时也要更改java文件里面的最先自动加载的个数数值
        for(var i = 5*ajaxTimes-1; i >= 0; i--) 
        { 
            ali[i].parentNode.removeChild(ali[i]);
        } 
        times++;
        //翻页后回到页面最上面
    }
}

//index向前翻页操作
function prevPage(urlpath)
{ 
    //加载完第6次的时候，times=7
    // 举例找规律，假设times=6，则是在第二页，点上一页则回到第一页
    //假设times=9，则是在第三页，点上一页则回到第二页，要使times=4
    times = parseInt((times - 2) / ajaxTimes);
    if(times != 1)
        times=(times - 1) * ajaxTimes + 1;
    else if(times == 1)
        document.getElementById("prevPage").style.display="none";
    document.getElementById("nextPage").style.display="none";
    //document.getElementById("article_ul").innerHTML="";
    //根据第几次请求来加载数据库数据

    var aul = document.getElementById("article_ul"); 
    var ali = aul.getElementsByTagName("li");
    //5*ajaxTimes-1,5表示pagesize，一次加载pagesize个内容
    //更改此处5的数值，同时也要更改java文件里面的最先自动加载的个数数值
    for(var i = ali.length - 1; i >= 0; i--) 
    { 
        ali[i].parentNode.removeChild(ali[i]);
    } 
        
    indexAjaxLoadArticle(times,urlpath);
    times++;
    //翻页后回到页面最上面
    document.body.scrollTop = document.documentElement.scrollTop = 0;
    //向前翻页了，表明后面肯定还有数据
    hasData = 1;       
}

//其它信息页向前翻页操作
function prevPageTwo(urlpath)
{ 
    //加载完第6次的时候，times=7
    // 举例找规律，假设times=6，则是在第二页，点上一页则回到第一页
    //假设times=9，则是在第三页，点上一页则回到第二页，要使times=4
    //alert("times="+times);
    times = parseInt((times - 2) / ajaxTimes);
    if(times != 1)
        times=(times - 1) * ajaxTimes + 1;
    else if(times == 1)
        document.getElementById("prevPage").style.display="none";
    document.getElementById("nextPage").style.display="none";
    //alert("times="+times);
    //document.getElementById("article_ul").innerHTML="";
    //根据第几次请求来加载数据库数据

    
    
        var aul = document.getElementById("article_ul"); 
        var ali = aul.getElementsByTagName("li");
        //5*ajaxTimes-1,5表示pagesize，一次加载pagesize个内容
        //更改此处5的数值，同时也要更改java文件里面的最先自动加载的个数数值
        //alert("ali.length=" + ali.length);
        for(var i = ali.length - 1; i >= 0; i--) 
        { 
            ali[i].parentNode.removeChild(ali[i]);
        } 
        
        ajaxLoadArticleById(times, categoryId,urlpath);
        times++;
        //翻页后回到页面最上面
        document.body.scrollTop = document.documentElement.scrollTop = 0;
        //向前翻页了，表明后面肯定还有数据
        hasData = 1;       
}

//首页根据第几次请求来加载数据库数据
function indexAjaxLoadArticle(times,urlpath)
{
    $.ajax
    ({
            url:urlpath+"/article/indexArticleLimitList",
            type:"get",
            async:true,
            data:{"times":times},
            dataType:"json",
            success:function(result)
            {
                if(result.length == 0)
                {
                    //alert("hasData=0");
                    hasData = 0;
                }
                else
                {
                    hasData = 1;
                    for(var i=0;i<result.length;i++)
                    {
                        var article = result[i];
                        createArticleLi(article,urlpath);
                    }     
                }
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

//其它信息页根据第几次请求来加载数据库数据
function ajaxLoadArticleById(times,categoryId,urlpath)
{
    $.ajax
    ({
            url:urlpath+"/article/articleLimitListById",
            type:"get",
            async:true,
            data:{"times":times,"categoryId":categoryId},
            dataType:"json",
            success:function(result)
            {
                if(result.length == 0)
                {
                    //alert("hasData=0");
                    hasData = 0;
                }
                else
                {
                    hasData = 1;
                    for(var i=0;i<result.length;i++)
                    {
                        var article = result[i];
                        createArticleLi(article,urlpath);
                    }     
                }
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

//返回数据库中已经没有可以加载的东西了
function noData()
{
    if(hasData == 0)
    {
        return true;
        document.getElementById("nextPage").style.display="none";
    }        
    if(hasData == 1)
        return false;
}

//改变管理员页面内容
function changeContent()
{
    var url = document.getElementById('crumbs_link').href;
    var c = document.getElementsByName('choose');
    for(var i=0;i<c.length;i++)
    {
        if(c[i].checked == true && c[i].value == "Exist")
        {
            url = url.replace(/Deleted/, "Exist");
            url += "?pages=1";
            window.location.href = url;
        }
        if(c[i].checked == true && c[i].value == "Deleted")
        {
            url = url.replace(/Exist/, "Deleted");
            url += "?pages=1";
            window.location.href = url;
        }
    }
}

//管理员删除恢复功能
function deleteRecover(id,obj,urlpath)
{
    var url = document.getElementById('crumbs_link').href;
    url = url.slice(7,url.length);
    var url_list = url.split("/");
    var state = url_list[url_list.length-1];
    
    $.ajax
    ({
            url:urlpath+"/administrator/deleteRecover",
            type:"get",
            async:true,
            data:{"state":state,"id":id},
            dataType:"json",
            success:function(result)
            {
                if(result == true)
                {
                    alert("操作成功!");
                    //把当前这个div去除
                    obj.parentNode.parentNode.removeChild(obj.parentNode);
                }
                else
                {
                    alert("操作失败!");
                }
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

//文章页面读取评论
function ajaxGetCommentsById(articleId,times,urlpath)
{
    $.ajax
    ({
            url:urlpath+"/comment/getCommentsById",
            type:"get",
            async:true,
            data:{"articleId":articleId,"times":times},
            dataType:"json",
            success:function(result)
            {
                for(var i=0; i<result.length; i++)
                {
                    var ll=result[i];
                    //主回复Li，楼中楼Ul
                    if(ll.pid == 0)
                        createCommentLi(ll,urlpath);
                    else
                        createCommentUl(ll,urlpath);
                }
                
                if(result.length > 0)
                {
                    var items = "this,'"+urlpath+"'";
                    var sdiv = '<a id="comment-more" href="javascript:void(0)" onclick="getCommentMore('+items+')" '+'style="display:block;color:#1E90FF;text-align:center;">加载更多</a>';
                    $(".commentnav").append(sdiv); 
                }
                if(result.length <= 0 && times!=1)
                {
                    confirm("没有更多评论了！");
                    var cnode = document.getElementById("comment-more");
                    cnode.parentNode.removeChild(cnode);
                }
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

//创建主回复Li
function createCommentLi(commentInfo,urlpath)
{
    var sli = "";
    commentInfo.posttime = formatDate(new Date(commentInfo.posttime),"yyyy-MM-dd hh:mm:ss");
    
    var items="'" + commentInfo.user.username + "','" + commentInfo.cid + "'," + 'this,' + 
                "'li','" +commentInfo.cid+"','"+urlpath+"'";
    
    sli += '<li class="comment '+ commentInfo.user.uid +'" id="'+ commentInfo.cid +
    '"><div class="c-avatar"><img alt="headPortrait" src="' +
    commentInfo.user.headportrait +
    '" class="avatar" style="display: block;" /><div class="c-main">' +
    '<span class="c-author">' + commentInfo.user.username + ':</span>' +
    commentInfo.content + 
	'<div class="c-meta">' +
    commentInfo.posttime + 
	'<a rel="nofollow" class="comment-reply-link" href="javascript:void(0)" onclick="postComment('+ items +')">回复</a></div></div></div>'+
    '<ul class="children" id="children'+commentInfo.cid+'"></ul></li>'
    
    $("#commentlist").append(sli);
    
}

//创建楼中楼Ul
function createCommentUl(commentInfo,urlpath)
{
    var sul = "";
    commentInfo.posttime = formatDate(new Date(commentInfo.posttime),"yyyy-MM-dd hh:mm:ss");
    
    var items="'" + commentInfo.user.username + "','" + commentInfo.pid + "'," + 'this,' + 
                "'ul','"+commentInfo.cid+"','"+urlpath+"'"; 
    
    sul += '<li class="comment '+ commentInfo.user.uid +'" id="'+ commentInfo.cid +
    '"><div class="c-avatar"><img alt="headPortrait" src="' +
    commentInfo.user.headportrait +
    '" class="avatar" style="display: block;" /><div class="c-main">' +
    '<span class="c-author">' + 
    commentInfo.user.username + ':</span>' + commentInfo.content + 
	'<div class="c-meta">' + commentInfo.posttime + 
	'<a rel="nofollow" class="comment-reply-link" href="javascript:void(0)" onclick="postComment('+ items +')">回复</a></div></div></div>'+
    '<ul class="children" id="childrenul'+commentInfo.cid+'"></ul></li>'
    
    //通常这是找到楼中楼现象的那层层主，但是这里设计成只缩入一次
    //所以回复楼中楼的楼中楼，应该放在层主的“children#{id}”div里面，而不是楼中楼的“children#{id}”div里面，因为并不存在
    var li_id = '#children' + commentInfo.pid; 
    var ul_id = '#childrenul' + commentInfo.pid;
    //此种方法针对楼中楼中楼等，找到最优解之前使用此等鸡贼方法
    $(li_id).append(sul);
    $(ul_id).parent().parent().append(sul);
}

//加载更多
function getCommentMore(obj,urlpath)
{
    getCommentsTime++;
    obj.parentNode.removeChild(obj);
    ajaxGetCommentsById(articleInfoId,getCommentsTime,urlpath);
}

//添加回复框
function postComment(username,pid,obj,level,cid,urlpath)
{
    var sul = "";
    username = "回复"+username+" ";
    var pid = "#children"+pid;
    //这么做的解释见方法createCommentUl()倒数第三行的解释
    var pidul = '#childrenul'+cid;
    
    deleteCommentRect();
    
    var items = "this," + "'ulli','" + pid +"','"+cid+"','"+urlpath+"'";
    
    if(level == 'ul')
    {
        sul += '<li class="postcomment" name="postcomment"><textarea id="textarea2" rows="2" cols="70">'+username+
                '</textarea><input class="commentsubmit" type="button" value="发表" onclick="toPostComment('+items+')"></li>';
        //下面两条颠倒顺序会导致出现两个回复框
        $(pid).append(sul);
        
        deleteCommentRect();
        
        items = "this," + "'ulli','" + pidul +"','"+cid+"','"+urlpath+"'";
        sul = "";
        sul += '<li class="postcomment" name="postcomment"><textarea id="textarea2" rows="2" cols="70">'+username+
                '</textarea><input class="commentsubmit" type="button" value="发表" onclick="toPostComment('+items+')"></li>';
        
        $(pidul).parent().parent().append(sul);
        
        
        var temp = document.getElementsByName("postcomment");
        for(var i=0; i<temp.length; i++)
            temp[i].style.cssText="background:none repeat scroll 0 0 #fafafa;border:1px solid #ccc;list-style:none outside none;margin:10px 0 0;padding:10px;border-radius:5px;";
    }
    if(level == 'li')//主楼的回复框
    {
        sul += '<li class="postcomment" name="postcomment"><textarea id="textarea2" rows="2" cols="70">'+username+
                '</textarea><input class="commentsubmit" type="button" value="发表" onclick="toPostComment('+items+')"></li>';
        $(pid).append(sul);  
        var temp = document.getElementsByName("postcomment");
        for(var i=0; i<temp.length; i++)
            temp[i].style.cssText="background:none repeat scroll 0 0 #fafafa;border:1px solid #ccc;list-style:none outside none;margin:10px 0 0;padding:10px;border-radius:5px;";
    } 
}

//删除场景里的回复框
function deleteCommentRect()
{
    var nodeToDelete = document.getElementsByName("postcomment");
    var nodeLength = nodeToDelete.length;
    for(var i=0; i<nodeLength; i++)
    {
        nodeToDelete[0].parentNode.removeChild(nodeToDelete[0]);
    }
}

//存储发表的回复
function toPostComment(obj,items,pid,cid,urlpath)
{
    var aid = articleInfoId;
   // uid="10000";//使用管理员账号来测试无登陆评论
    //headpath=urlpath+"/img/user_128px.png";
   // name="不明情况的吃瓜管理员";
    var time = getNowTime();

    if(items == 'div')
    {   
        var text = document.getElementById("textarea1");
        
        if(text.value.length == 0)
        {
            alert("回复的内容不得为空");
            return 0;
        }
        
        if(text.value.length > 35)
        {
            alert("回复的内容不得超过35字");
            return 0;
        }
        var content = text.value;
        //ajax评论储存到数据库
        //一条评论的pid，要么是0，要么是别人的cid
        $.ajax
        ({
            url:urlpath+"/comment/setComment",
            type:"get",
            async:true,
            data:{"aid":aid,"uid":uid,"pid":cid,"content":content},
            dataType:"json",
            success:function(result)
            {
                if(result == 1)
                {
                    //////////后期做好登陆后，根据登陆信息，写上评论者信息，并css修饰
                    var sdiv = '<li class="comment '+uid+'" style="background:none repeat scroll 0 0 #fafafa;border:1px solid #ccc;list-style:none outside none;margin:10px 0 0;padding:10px;border-radius:5px;"><div class="c-avatar"><img alt="headPortrait" src="'+
                    headpath+'" class="avatar" style="display: block;"><div class="c-main"><span class="c-author">'+name+
                                ':</span>'+content+'<div class="c-meta">'+ time +'</div></div></div></li>'; 
                    
                    var region = document.getElementById("commentlist");
                    //var sdiv = "<li>"+ text.value +"</li>";
                    $(region).append(sdiv);
                    text.value="";
                }
                else
                {
                   alert("评论失败!"); 
                }
            },
            error:function(result)
            {
                if(result!=null && result.responseText=="tologin")
                {
                    alert("请先登录!");
                }
                else
                {
                    alert("加载失败!");
                }
            }
        });
        
    }
    if(items == 'ulli')
    {
        var text = document.getElementById("textarea2");
        
        if(text.value.length == 0)
        {
            alert("回复的内容不得为空");
            return 0;
        }
        
        if(text.value.length > 35)
        {
            alert("回复的内容不得超过35字");
            return 0;
        }
        var content = text.value;
        
          //ajax评论储存到数据库
        //一条评论的pid，要么是0，要么是别人的cid
        $.ajax
        ({
            url:urlpath+"/comment/setComment",
            type:"get",
            async:true,
            data:{"aid":aid,"uid":uid,"pid":cid,"content":content},
            dataType:"json",
            success:function(result)
            {
                if(result == 1)
                {
                    //////////后期做好登陆后，根据登陆信息，写上评论者信息，并css修饰
                    var sulli = '<li class="comment '+uid+'" style="background:none repeat scroll 0 0 #fafafa;border:1px solid #ccc;list-style:none outside none;margin:10px 0 0;padding:10px;border-radius:5px;"><div class="c-avatar"><img alt="headPortrait" src="'+
                    headpath+'" class="avatar" style="display: block;"><div class="c-main"><span class="c-author">'+name+
                                ':</span>'+text.value+'<div class="c-meta">'+time+'</div></div></div></li>';  
                    if(pid.substring(0,11) == "#childrenul")
                        $(pid).parent().parent().append(sulli);
                    else
                        $(pid).append(sulli);
                }
                else
                {
                   alert("评论失败!"); 
                }
            },
            error:function(result)
            {
                if(result!=null && result.responseText=="tologin")
                {
                    alert("请先登录!");
                }
                else
                {
                    alert("加载失败!");
                }
            }
        });
        
    }
    
    //pid = pid.substring(9,pid.length);
    //alert("aid="+aid+";uid="+uid+";pid="+cid+";content="+content);
    
    deleteCommentRect();
}

//获取当前时间，并显示成指定格式
function getNowTime()
{
    var myDate = new Date(); 
    var month = myDate.getMonth() + 1;
    if(month < 10)
        month = "0"+month;
    var theTime = myDate.getFullYear()+"-"+month+"-"+myDate.getDate()+" "+
                    myDate.getHours()+":"+myDate.getMinutes()+":"+myDate.getSeconds();
    return theTime;
}

function adminPrevPage(urlpath)
{
    pages--;
    document.getElementById("nextPage").style.display="";
    if(pages==1)
        document.getElementById("prevPage").style.display="none";
    var href = document.getElementById("crumbs_link").href;
    $.ajax
    ({
            url:urlpath+"/administrator/adminManage",
            type:"get",
            async:true,
            data:{"pages":pages,"url":href},
            dataType:"json",
            success:function(result)
            {  
                if(result[0] == 1)
                {
                    createUserListLi(result[1],urlpath);
                }
                else if(result[0] == 2)
                {
                    createArticleListLi(result[1],urlpath);
                }
                else if(result[0] == 3)
                {
                    createCommentListLi(result[1],urlpath);
                }
                 //翻页后回到页面最上面
                document.body.scrollTop = document.documentElement.scrollTop = 0;
            },
            error:function()
            {
                pages++;
                alert("加载失败!");
            }
    });
}

function adminTurnPage(urlpath)
{
    pages++;
    document.getElementById("prevPage").style.display="";
    var href = document.getElementById("crumbs_link").href;
    $.ajax
    ({
            url:urlpath+"/administrator/adminManage",
            type:"get",
            async:true,
            data:{"pages":pages,"url":href},
            dataType:"json",
            success:function(result)
            {
                if(result[1] == null || result[1].length == 0 )
                {
                    document.getElementById("nextPage").style.display="none";
                    if(pages == 2) document.getElementById("prevPage").style.display="none";
                    alert("已无更多数据");
                    pages--;
                    return 0;
                }
               
                if(result[0] == 1)
                {
                    createUserListLi(result[1],urlpath);
                }
                else if(result[0] == 2)
                {
                    createArticleListLi(result[1],urlpath);
                }
                else if(result[0] == 3)
                {
                    createCommentListLi(result[1],urlpath);
                }
                 //翻页后回到页面最上面
                document.body.scrollTop = document.documentElement.scrollTop = 0;
            },
            error:function()
            {
                pages--;
                alert("加载失败!");
            }
    });
}

//以下三个是管理员页面的加载
function createUserListLi(userlist,urlpath)
{
    clear_article_ul();
    var ul = document.getElementById("article_ul");
    for(var i=0; i<userlist.length; i++)
    {
        userlist[i].registertime=formatDate(new Date(userlist[i].registertime),"yyyy-MM-dd hh:mm:ss");
        
        var items = userlist[i].uid + ",this,'" + urlpath +"'"; 
        
        var sli='<li><div class="entryImg"><img width="360" height="360" src="'+userlist[i].headportrait+ 
                '"class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="show.jpg"'+
                'sizes="(max-width: 360px) 100vw, 360px" /></a></div><h3 class="entryTitle"><a title="'+
                userlist[i].username +'">'+userlist[i].username +'</a></h3><p class="adminentryContent">'+
                userlist[i].loginname +'<br/>'+userlist[i].uid +'</p><div class="entryMeta"><em class="entryDate">'+
                '注册时间：</em><em class="entryDate"></em><em class="entryDate">'+
                userlist[i].registertime+'</em></div><input class="dr"'+
                ' type="button" name="deleteRecover" value="删除" onclick="deleteRecover('+items+')"><br /><br /><br /></li>';
        $(ul).append(sli);
    }
}

function createArticleListLi(articlelist,urlpath)
{
    clear_article_ul();
    var ul = document.getElementById("article_ul");
    for(var i=0; i<articlelist.length; i++)
    {
        articlelist[i].publishtime=formatDate(new Date(articlelist[i].publishtime),"yyyy-MM-dd hh:mm:ss");
        
        var items = articlelist[i].aid + ",this,'" + urlpath +"'"; 
        
        var sli='<li><div class="entryImg"><a title="'+articlelist[i].title+ 
                '" target="_blank" href="'+urlpath+'/administrator/articleContent/'+
                articlelist[i].aid +'"><img width="640" height="360" src="'+articlelist[i].mainpic+'"'+
                'class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="show.jpg"'+
                ' sizes="(max-width: 640px) 100vw, 640px" /></a> <span class="entryCopyright">精选</span></div><h3 class="entryTitle"><a title="'+
                articlelist[i].title +'" target="_blank" href="'+urlpath+'/administrator/articleContent/'+
                articlelist[i].aid +'">'+articlelist[i].title +'</a></h3>'+'<p class="adminentryContent">'+
                removeHtmlTag(articlelist[i].content)+'</p><div class="entryMeta"><em class="entryDate">来源：</em><em class="entryDate"><a target="_blank"'+
				'href="http://'+articlelist[i].source +'">'+articlelist[i].source + '</a></em><em class="entryDate">'+
                articlelist[i].publishtime +
                ' </em></div><input class="dr" type="button" name="deleteRecover" value="删除" onclick="deleteRecover('+
                items+')"><br /><br /><br /></li>';
        $(ul).append(sli);
    }
}

function createCommentListLi(commentlist,urlpath)
{
    clear_article_ul();
    var ul = document.getElementById("article_ul");
    for(var i=0; i<commentlist.length; i++)
    {
        commentlist[i].posttime=formatDate(new Date(commentlist[i].posttime),"yyyy-MM-dd hh:mm:ss");
        
         var items = commentlist[i].cid + ",this,'" + urlpath +"'"; 
        
        var sli='<li><h3 class="entryTitle"><a>评论</a></h3><p class="adminentryContent">'+
                commentlist[i].content +'</p><div class="entryMeta"><em class="entryDate">发表时间：</em>'+
				'<em class="entryDate"></em><em class="entryDate">'+
                commentlist[i].posttime +'</em></div><input class="dr" type="button" name="deleteRecover" value="删除"'+
                'onclick="deleteRecover('+items+')"><br /><br /><br /></li>';
        $(ul).append(sli);
    }
}

//清理id=article_ul里面的li元素
function clear_article_ul()
{
    var ul = document.getElementById("article_ul").childNodes;
    var length = ul.length;
    for(var i=0; i<length; i++)
    {
        ul[0].parentNode.removeChild(ul[0]);
    }
}

function ajaxSetArticle(title,source,author,mainpic,content,category,urlpath)
{
    $.ajax
    ({
            url:urlpath+"/administrator/setArticle",
            type:"post",
            async:true,
            data:{"title":title,"source":source,"author":author,"mainpic":mainpic,"content":content,"category":category},
            dataType:"json",
            success:function(result)
            {
               if(result == 1)
               {
                   alert("文章推送成功！");
                   location.reload();
               }
               else
               {
                   alert("文章推送失败！");
               }
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

function ajaxSetSelfInfo(uid,username,headportrait,oldpassword,newpassword,urlpath)
{
    if(uid == "") 
    {
        alert("请先登录！");
        return;
    }
    if(username != "")
    {
        if(!checkUsername(username))
            return;
    }
    if(username == "" && headportrait.length<=16 && oldpassword=="" && newpassword=="")
        return;
    if(oldpassword=="" && newpassword!="")
        return;
    if(oldpassword!="" && newpassword=="")
        return;
    
    $.ajax
    ({
            url:urlpath+"/user/setSelfInfo",
            type:"get",
            async:true,
            data:{"uid":uid,"username":username,"headportrait":headportrait,"oldpassword":oldpassword,"newpassword":newpassword},
            dataType:"json",
            success:function(result)
            {
                alert("1");
               if(result == true)
               {
                   alert("信息更改成功！");
                   location.reload();
                   return; 
               }
               if(result == "diff_password")
               {
                   alert("旧密码错误！");
                   return;
               }
                alert("信息更改失败！");
                return;
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

function checkUsername(un)
{
    if(un.length<3 || un.length>18)
    {
        alert("用户名长度不得短于3位或长于18位");
        //form.username.focus();
        return false;
    }
    var re=new RegExp("\\w");
    for(var i=0;i<un.length;i++)
    {
        if(!re.test(un.charAt(i)))
        {
            alert("用户名只能是数字或字母！");
            return false;
        }
    }
    return true;
}

function removeHtmlTag(html)
{
    html = html.replace("<img","");
    html = html.replace("<p>","");
    html = html.replace("<p","");
    html = html.replace("</p>","");
    html = html.replace(">","");
    return html;
}

//展示头像
function showHeadIcon(uid,uri_head,head,username)
{
	if(uid != 'null')
	{
		var html = '<a title="selfService" href='+uri_head+'/selfService.jsp><img alt="头像" src="'+
					head+'" style="width:48px;height:48px;"></a>';
        var html2 = '<em>'+username+'</em>'
		document.getElementById("logout").style.display="";
        document.getElementById("username").style.display="";
        document.getElementById("username").innerHTML=html2;
		document.getElementById("head_icon").style.display="";
		document.getElementById("head_icon").innerHTML=html;
		document.getElementById("register").style.display="none";
		document.getElementById("login").style.display="none";
	}
}

//登陆
function toLogin(urlpath)
{
    document.getElementById("accountmsg").innerHTML="";
    document.getElementById("passwordmsg").innerHTML="";
    
    var account = document.getElementById("account").value;
    var password = document.getElementById("password").value;
    if(account == "")
    {  
        document.getElementById("accountmsg").innerHTML="<font color='red'>请输入账号</font>";
        return;
    }
    if(password == "")
    { 
        document.getElementById("passwordmsg").innerHTML="<font color='red'>请输入密码</font>";
        return;
    }
    
    $.ajax
    ({
            url:urlpath+"/user/userLogin",
            type:"get",
            async:true,
            data:{"account":account,"password":password},
            dataType:"json",
            success:function(result)
            {
               if(result[0] == 'nouser')
               {
                   alert("账号或密码错误！")
               }
               else
               {
                   window.location.href=result[0];
               }
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}

function clickLikes(urlpath,aid)
{
    //clickedLikes为0时加赞，为1时减赞
    if(clickedLikes == 0)
    {
        clickedLikes = 1;       
        likes++;
    }
    else if(clickedLikes == 1)
    {
        clickedLikes = 0;       
        likes--;
    }
    
    $.ajax
    ({
        url:urlpath+"/article/setLikesByAId",
        type:"get",
        async:true,
        data:{"aid":aid,"likes":likes},
        dataType:"json",
        success:function(result)
        {
            if(result == 1)
            {
                document.getElementById("likes_num").innerHTML=likes;
            }
            else
            {
                alert("点赞失败!");
            }
        },
        error:function()
        {
            alert("点赞失败!");
        }
    });
}
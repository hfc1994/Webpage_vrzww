/**
 * 
 */
function checkData()
{
    //alert("1");
    //var namee=form.username.value.toLowerCase();
    //document,write(namee);
    //var asd=document.getElementsByName("like").length;
	if(document.getElementById("email").value=="")
    {
        alert("请输入登录账号！");
        document.getElementById("email").focus();
        return false;
    }
    if(document.getElementById("username").value=="")
    {
        alert("请输入用户名！");
        document.getElementById("username").focus();
        return false;
    }
    else
    {
        if(!checkUsername(document.getElementById("username").value))
            return false;
    }
    
    if(document.getElementById("password").value=="")
    {
        alert("请输入密码！");
        return false;
    }
    if(document.getElementById("password").value.length<8 || document.getElementById("password").value.length>18)
    {
        alert("密码长度不得短于8位或长于18位！");
        return false;
    }
    
    if(document.getElementById("password_confirm").value=="")
    {
        alert("请输入确认密码！");
        return false;
    }

    if(document.getElementById("password").value != document.getElementById("password_confirm").value)
    {
        alert("两次输入的密码不相同");
        return false;
    }
    if(document.getElementById("question").value=="")
    {
        alert("请输入密保问题！");
        document.getElementById("question").focus();
        return false;
    }
    if(document.getElementById("answer").value=="")
    {
        alert("请输入答案！");
        document.getElementById("answer").focus();
        return false;
    }
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

function checkLoginName(urlpath)
{
    var loginname = document.getElementById("loginname").value;
    if(loginname == "")
        return;

    $.ajax
    ({
            url:urlpath+"/user/checkLoginName",
            type:"get",
            async:true,
            data:{"loginname":loginname},
            dataType:"json",
            success:function(result)
            {
                if(result != 0)
               {
                   document.getElementById("emailmsg").innerHTML="<font color='red'>用户名已被占用！</font>";
                   document.getElementById("register").disabled=true;
               }
               else
               {
                   document.getElementById("emailmsg").innerHTML="";
                   document.getElementById("register").disabled=false;
               }
            },
            error:function()
            {
                alert("加载失败!");
            }
    });
}
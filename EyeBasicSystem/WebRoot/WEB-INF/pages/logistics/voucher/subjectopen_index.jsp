<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/allcommons.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<script>
	$(document).ready(function(){
		var frm = window.parent.frames;
		
		for (var i=0; i < frm.length; i++){
			if(frm[i].name=='centerframe'){
				frm[i].toLeft();
			}			
			if(frm[i].name=='top'){
				frm[i].toReload();
			}
			
		}	
	});

    function setValue(id, values, bspcategoryid){ 
		var json = {'subject' : values+" "+bspcategoryid, 'subjectID' :　id};				
		window.parent.openSubjectValue(json);
		parent.hidePopWin();
	}

</script>
</head>

  <FRAMESET id=btmframeTmp border=0 name=btmframeTmp frameSpacing=0 rows=* frameBorder=no cols=300,*>
   <FRAME name=leftframe1 src="subjectOpenTree.action?moduleID=${moduleID}&hrefTarget=mainFrame1" frameBorder=1 scrolling=no style="width: 100%"></FRAME>

   <FRAME name=mainFrame1 src="selSubject.action?moduleID=${moduleID}" frameBorder=NO ><NOFRAMES>
				<body>
					<p>&nbsp;
						
					</p>
				</body>
			</NOFRAMES></FRAMESET>
<body></body>
</html>
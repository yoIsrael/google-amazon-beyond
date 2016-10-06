
function getMessageData1(msg,name){ // for illustration only
  try{
    return msg.getElementsByTagName(name)[0].firstChild.data;
  }catch(ex){alert("no field "+name+" in "+toXML(msg)+"\n"+ex);}
  return "";
}

function getMessageData(msg,name){
    if(!inIE)
      netscape.security.PrivilegeManager.
        enablePrivilege("UniversalBrowserRead");
  try{
    var res="";
    var node=msg.getElementsByTagName(name)[0].firstChild;
    while(node){
      res+=node.data;
      node=node.nextSibling;
      }
    return res;
  }catch(ex){alert("no field "+name+" in "+toXML(msg)+"\n"+ex);}
  return "";
}
function getMessageDataDefault(msg,name,deflt){
    if(!inIE)
      netscape.security.PrivilegeManager.
        enablePrivilege("UniversalBrowserRead");
  try{
    var res="";
    var node=msg.getElementsByTagName(name)[0].firstChild;
    while(node){
      res+=node.data;
      node=node.nextSibling;
      }
    return res;
  }catch(ex){
    if(getMessageDataDefault.arguments.length >= 3)
      return deflt;
    alert("no field "+name+" in "+toXML(msg)+"\n"+ex);
    return "";
  }
}

function gsGetCount(q){
    if(!inIE)
      netscape.security.PrivilegeManager.
        enablePrivilege("UniversalBrowserRead");
  if(!gsGetCount.countCache)gsGetCount.countCache=new Object();
  var countCache=gsGetCount.countCache;
  var cStr=countCache[q];
  if(cStr)return parseInt(cStr);
  var msg=doGoogleSearch(key,q,0,1);
  try{ 
    var data=getMessageData(msg,"estimatedTotalResultsCount");
    return parseInt(countCache[q]=data);
  }catch(ex){alert (ex+"\n"+toXML(msg));}
  return 0;
}


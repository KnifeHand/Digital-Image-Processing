if ( (window.parent && window.parent.location !== window.location) || (window.location.href.indexOf('http') === 0) ) 
    {
     $('#doc_survey').attr('src','https://www.mathworks.com/programs/bounce_hub_help.html?s_cid=Help_Topic_Survey&surveyParams='+document.location.href);
    }

var ifrm = document.getElementById("doc_survey");
ifrm.style.display = "none";
window.addEventListener("message", function(evt){
  if(evt.origin.toLowerCase().indexOf('www.getfeedback.com') >=0)
  {
  ifrm.style.display = "";
  }
});


// Copyright 2018 The MathWorks, Inc.

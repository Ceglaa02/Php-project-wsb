<!DOCTYPE html>
<head>
  {include "../../common/Head.tpl"}
</head>
<body>
  <div class="container-fluid">{include "../../common/Navbar.tpl"}</div>
  <div class="row m-2">
    {include "./Teams.tpl" teams=$teams teamButton=$teamButton} {include
    "./MainContent.tpl" user_id=$user_id teams=$teams teamid=$teamId
    posts=$posts} {include "./CreateTeam.tpl" user_id=$user_id}
  </div>

  <script defer src="/js/textareaFunctions.js"></script>
</body>

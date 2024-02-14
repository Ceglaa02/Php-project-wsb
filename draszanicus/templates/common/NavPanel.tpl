{if !empty($user)}
<ul class="navbar-nav ml-auto">
  <li class="nav-item">
    <a class="nav-link" href="/profile">{$user["username"]}</a>
  </li>
  <div id="logout" class="btn btn-primary" type="button">Wyloguj</div>
</ul>
{else} {include "./LoginModal.tpl"} {/if}

<script>
  function logoutBtn(){
    const button = document.getElementById("logout")
    if(!button){
      return
    }

    button.addEventListener("click", async (e)=>{
      const response = await fetch("/logoutApi",{
        method:"get"
      })

      const result = await response.text()
      if(result === '"fail"'){
        return
      }

      const startIndex = result.indexOf('<body>') + '<body>'.length;
      const endIndex = result.indexOf('</body>');

      const bodyContent = result.substring(startIndex, endIndex);

      document.body.innerHTML = result
      const html = document.getElementById("navPanel")
      const scripts = html.querySelectorAll("script")
      scripts.forEach((script)=>{
        eval(script.textContent)
      })
    })
  }

  logoutBtn()
</script>

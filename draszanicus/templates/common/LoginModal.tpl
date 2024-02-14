<script src="/js/modals/modal.min.js"></script>

<button id="loginBtn" class="btn btn-primary" type="button">Log in</button>

<script>
  const btn = document.getElementById("loginBtn");

  const body = `
        <div class="card">
            <div>
            <h3> Login </h3> </div>
        <form method="post" id="loginForm">
        <div class="card-body">
        <div class="row">
        <div class="col-12 input-group my-1">
        <input class="form-control" type="text" placeholder="Login" name="inputLogin" required>
        </div>
    <div class="col-12 input-group my-1">
        <input class="form-control" type="password" placeholder="Password" name="inputPassword" required>
    </div>
    </div>
    </div>
    </form>
    <div>
    <h3> Register </h3> </div>
    <form method="post" id="registerForm">
        <div class="card-body">
        <div class="row">
        <div class="col-12 input-group my-1">
        <input class="form-control" type="text" placeholder="Login" name="inputLogin" required>
        </div>
    <div class="col-12 input-group my-1">
        <input class="form-control" type="password" placeholder="Password 8 letters" name="inputPassword" required>
    </div>
    <div class="col-12 input-group my-1">
        <input class="form-control" type="password" placeholder="Repeat Password" name="inputPasswordAgain" required>
    </div>
    <div class="col-12 input-group my-1">
        <input class="form-control" type="text" placeholder="e-mail" name="inputEmail" required>
    </div>
    <input class="form-control" type="hidden" placeholder="e-mail" name="action" value="createUser">
    </div>
    </div>
    </form>
    <div class="card-footer">
        <button class="btn btn-primary" data-bs-dismiss="modal" type="button" id="login">Log in</button>
        <button class="btn btn-primary" data-bs-dismiss="modal" type="button" id="register">Register</button>
    </div>
    </div>
    <script>
        document.getElementById("login").addEventListener("click",async ()=>{
            const form = new FormData(document.getElementById("loginForm"))
            const response = await fetch("/loginApi",{
                method:"post",
                body: form
            })
            const result = await response.text()
            if(result === '"fail"'){
                return
            }

            document.body.innerHTML = result
            const html = document.getElementById("navPanel")
            const scripts = html.querySelectorAll("script")
            scripts.forEach((script)=>{
            eval(script.textContent)
            })
        })

        document.getElementById("register").addEventListener("click",async ()=>{
            console.log("dziala");
            const form = new FormData(document.getElementById("registerForm"))
            const response = await fetch("/RegisterApi",{
                method:"post",
                body: form
            })
            const result = await response.text()
            if(result === '"fail"'){
                return
            }

            
        })
   <\/script>`;

  btn.addEventListener("click", () => {
    makeModal({
      body: body,
      size: "md",
    });
  });
</script>

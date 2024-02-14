<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <a href="/"
        ><img src="./images/logo.png" alt="Logo" height="40"
      /></a>
    </a>

    <form class="form-inline mx-auto col-6" method="post" action="/search">
      <div class="input-group">
        <input
          type="text"
          class="form-control"
          placeholder="Look for groups"
          name="search"
        />
        <div class="input-group-append">
          <button class="btn btn-outline-secondary" type="submit">
            Search
          </button>
          <input type="hidden" name="action" value="Search" />
        </div>
      </div>
    </form>

    <div id="navPanel">{include "./NavPanel.tpl"}</div>
  </div>
</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="./images/logo.png" alt="Logo" height="40" />
    </a>

<form class="form-inline mx-auto col-6" method="post" action="/search">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Look for groups" name="search" />
    <div class="input-group-append">
      <button class="btn btn-outline-secondary" type="submit">
        Search
      </button>
      <input type="hidden" name="action" value="Search" />
    </div>
  </div>
</form>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Username</a>
      </li>
    </ul>
  </div>
</nav>

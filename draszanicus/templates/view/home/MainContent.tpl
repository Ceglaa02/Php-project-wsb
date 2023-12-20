<div class="col-md-8">
  <div class="row">
    <div class="col-md-12">
      <form method="get" id="PostForm">
        <div class="form-floating">
          <textarea
            id="PostTextArea"
            class="form-control mb-3"
            placeholder="Create a Post here"
            style="height: 50px"
          ></textarea>
          <label for="floatingTextarea2">Create a Post</label>
        </div>
      </form>

      <div class="card mb-3">
        <div class="card-body">
          <h5 class="card-title">Username</h5>
          <p class="card-text">Post text goes here.</p>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  const textarea = document.getElementById("PostTextArea");

  const Post = document.getElementById("PostForm");

  textarea.addEventListener("keydown", (event) =>
    HandleEnter(event, textarea, Post, true)
  );
</script>

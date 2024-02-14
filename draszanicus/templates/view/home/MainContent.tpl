<div class="col-md-8 border-end border-start">
  <div class="row">
    <div class="col-md-12">
      {if $user_id >0} {if count($teams) > 0}
      <form method="post" action="/home/createPost" id="PostForm">
        <div class="form-floating">
          <textarea
            id="PostTextArea"
            class="form-control mb-3"
            placeholder="Create a Post here"
            style="height: 50px"
            name="postText"
          ></textarea>
          <label for="floatingTextarea2">Create a Post</label>
        </div>
        <input type="hidden" name="action" value="createPost" />
        <input
          type="hidden"
          name="teamIdInput"
          id="teamIdInput"
          value="{$teamid}"
        />
      </form>
      {if count($posts) > 0} {foreach $posts as $post}
      <div class="card mb-3">
        <div class="card-body">
          <h5 class="card-title">{$post.username}</h5>
          <p class="card-text">{$post.description}</p>
        </div>
      </div>
      {/foreach}{else}
      <div>
        <p class="card-text">this team has no posts</p>
      </div>
      {/if} {else}
      <div>
        <h3 class="card-text">Join or Create a Group to create posts</h3>
      </div>
      {/if} {else}
      <div>
        <h3 class="card-text">
          Login or register to join groups and see posts
        </h3>
      </div>
      {/if}
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

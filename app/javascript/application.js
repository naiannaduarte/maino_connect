import Rails from "@rails/ujs";
Rails.start();

function toggleComments(postId) {
    const commentsContainer = document.getElementById(`comments_for_${postId}`);
    

    if (commentsContainer.style.display === "none" || commentsContainer.style.display === "") {
      commentsContainer.style.display = "block"; 
    } else {
      commentsContainer.style.display = "none";
    }
  }
  
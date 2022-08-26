class Posts {
  Posts(
      {this.dp,
      this.name,
      this.caption,
      this.likes, // int likes
      this.post,
      this.time, // int MINUTES/HOURS/DAY AGO
      this.comments // View all int comments

      });

  final String? dp, name, post, caption, time;
  final int? likes, comments;

  static List<Posts> getPosts() {
    return [
      Posts(
        dp: "assets/dp/cnet.jpg",
        name: "cnet",
        caption:
            'Sony calls the move a "necessity given the current global economic environment.⁠"',
        likes: 514,
        comments: 20,
        post: "assets/posts/cnet-post-2.jpg",
        time: "18 HOURS AGO",
      ),
      Posts(
        dp: "assets/dp/androidauthority.jpg",
        name: "androidauthority",
        caption: "How much 💵 are you willing to spend on a new smartphone?⁠",
        likes: 498,
        comments: 10,
        post: "assets/posts/samsung.jpg",
        time: "40 MINUTES AGO",
      ),
      Posts(
        dp: "assets/dp/cnn.png",
        name: "cnn",
        caption:
            "Dramatic lightning strikes, extreme climate events, icy spectacles and sublime sun scenes are among the stunning images shortlisted for the Weather Photographer of the Year 2022 competition.⁠",
        likes: 1036,
        comments: 93,
        post: "assets/posts/cnn-post.jpg",
        time: "43 MINUTES AGO",
      ),
      Posts(
        dp: "assets/dp/google.jpg",
        name: "google",
        caption:
            "The connoisseurs at @RichWineRva have spoken — and we’re taking notes. Find out more about their journey⁠",
        likes: 1036,
        comments: 93,
        post: "assets/posts/google-post.jpg",
        time: "1 DAY AGO",
      ),
      Posts(
        dp: "assets/dp/bbc.jpg",
        name: "bbc",
        caption:
            'From dinosaur tracks, to Buddhist statues and shipwrecks, extreme droughts have led to secrets being revealed in river.⁠"',
        likes: 514,
        comments: 20,
        post: "assets/posts/bbc-post.jpg",
        time: "18 HOURS AGO",
      ),
    ];
  }
}

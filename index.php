<?php
require( 'CONFIG.php' );
require_once('includes/functions.php');
require( 'includes/header.php' );
 ?>

		<main class="content">
		<?php
		//get up to 20 published posts, newest first
		$result = $DB->prepare( 'SELECT *
						FROM posts
						WHERE is_published = 1
						ORDER BY date DESC
						LIMIT 20' );
		//run it
		$result->execute();
		//check if any rows were found
		if( $result->rowCount() >= 1 ){
			while( $row = $result->fetch() ){
				extract($row);
		?>

			<div class="post">
				<img src="<?php echo $image; ?>" alt="<?php echo $row['title']; ?>">
				<h2><?php echo $title; ?></h2>
				<p><?php echo $body; ?></p>
				<span class="date"><?php echo time_ago($date); ?></span>
			</div>

		<?php
		} //end while loop
	 	}else{
			//no rows found from our query
			echo 'No posts found';
		} ?>
		</main>
<?php
require( 'includes/sidebar.php' );
require( 'includes/footer.php' );
?>


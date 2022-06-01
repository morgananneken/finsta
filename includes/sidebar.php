<aside class="sidebar">

<?php
		//get up to 5 users, newest first
		$result = $DB->prepare( 'SELECT *
						FROM users
						ORDER BY join_date DESC
						LIMIT 5' );
		//run it
		$result->execute();
		//check if any rows were found
		if( $result->rowCount() >= 1 ){
		?>
	<section class="users">
		<h2>Newest Users</h2>
		<?php  while( $row = $result->fetch() ){
				extract($row); ?>
		<ul>
			<li class="user">
				<img src="<?php echo $profile_pic; ?>" alt="<?php echo $username; ?>" width="80" height="80">
			</li>
		</ul>

<?php
		} //end while loop
	 	}else{
			//no rows found from our query
			echo 'No new users found';
		} ?>
		</section>



<?php
		//get up to 10 categories
		$result = $DB->prepare( 'SELECT *
						FROM categories
						ORDER BY RAND()
						LIMIT 10' );
		//run it
		$result->execute();
		//check if any rows were found
		if( $result->rowCount() >= 1 ){
		?>
	<section class="categories">
		<h2>Categories</h2>
		<ul>
		<?php  while( $row = $result->fetch() ){
				extract($row); ?>
			<li><?php echo $name; ?></li>
		<?php } //end while loop?>
		</ul>
		<?php
	 	}else{
			//no rows found from our query
			echo 'No tags found';
		} ?>
	</section>




	<?php
		//get up to 10 categories
		$result = $DB->prepare( 'SELECT *
						FROM tags
						ORDER BY RAND()
						LIMIT 10' );
		//run it
		$result->execute();
		//check if any rows were found
		if( $result->rowCount() >= 1 ){
		?>
	<section class="tags">
		<h2>Tags</h2>
		<ul>
		<?php  while( $row = $result->fetch() ){
				extract($row); ?>
			<li><?php echo $name; ?></li>
		<?php } //end while loop?>
		</ul>
		<?php
	 	}else{
			//no rows found from our query
			echo 'No tags found';
		} ?>

	</section>


</aside>
<?php
include ("header.php");
include ("menu.php");
include ("contact.php");
include ("dbcon.php");


$name = 'name';
$coment_text = 'coment_text';
$doctor_id = 'doctor_id';
$rating_id = 'rating_id';


    //запрос отзывов из БД
    $checkSQL=mysqli_query($connection, "SELECT name, date, doctor_id, rating_id, coment_text FROM `coment`");

    {

        //количество новостей на странице
        $news_page=10;
        $news_total_request="SELECT COUNT('id') FROM coment";
        $pages_response=mysqli_query($connection, $news_total_request);
        $news_total=mysqli_fetch_array($pages_response);
        $pages_total=$news_total[0];
        $pages_total=ceil($pages_total/$news_page);
    
    
    
        if (isset($_GET['page'])){
            $page=$_GET['page'];
        }else{
            $page=1;
        }
    
        $start=($page-1)*$news_page;
        $checkSQL=mysqli_query($connection, "SELECT * FROM coment LIMIT $start, $news_page");
    
    }
?>

<section class="reviews">
<div class = "rev_header"><h1>Отзывы посетителей</h1></div>
    <a class= "addcom_link" href="/addcom">добавить комментарий</a>
    <div class = "rev_pages">
        <?php
        //листание страниц
        $previous=$page-1;
        $next=$page+1;
        if ($page>1){
            echo "<a href=\"?page=$previous\">Предыдущая  </a>";
        }
        if ($pages_total >=1){
            for ($i=1; $i<=$pages_total; $i++){
                if ($i==$page){
                echo "<a href=\"?page=$i\"> $i </a>";
                } else {
                echo "<a href=\"?page=$i\"> $i </a>";
                }
            }
            }
        if ($page<$pages_total){
            echo "<a href=\"?page=$next\">  Далее  </a>";
        }
        ?>
    </div>
    
    <ul class="rev_table">
<?php
        while($str=mysqli_fetch_array($checkSQL)){
            echo'
            
            <li>
                <div class="rev_user">
                Пользователь '.$str['name'].' оценил(-a) доктора '.$str['doctor_id'].' в '.$str['rating_id'].' балл(-а).
                </div>
                
                <div class="rev_text_h">
                 И оставил(-a) отзыв:  
                </div>
                
                <div class="rev_text">
                '.$str['coment_text'].'
                </div>
                
                <div class="rev_date">
                '.$str['date'].'
                </div>
            </li><br>';

            
        } 
?>
    </ul>


        
        <div class = "rev_pages">
<?php
        if ($page>1){
            echo "<a href=\"?page=$previous\">Предыдущая  </a>";
        }
        if ($pages_total >=1){
            for ($i=1; $i<=$pages_total; $i++){
                if ($i==$page){
                echo "<b><a href=\"?page=$i\"> $i </a></b>";
                } else {
                echo "<a href=\"?page=$i\"> $i </a>";
                }
            }
            }
        if ($page<$pages_total){
            echo "<a href=\"?page=$next\">  Далее  </a>";
        }

?>
        </div>
        

</section> 


<?php 
include ("footer.php");
exit;
?>
<?php
include ("header.php");
include ("menu.php");
include ("contact.php");
include ("dbcon.php");


$name = 'name';
$coment_text = 'coment_text';
$doctor_id = 'doctor_id';
$rating_id = 'rating_id';

// добавление комментария

if (!empty($_GET['name']) && !empty($_GET['coment_text'])){
    $name = htmlspecialchars(trim($_GET['name']));
    $coment_text = htmlspecialchars(trim($_GET['coment_text']));
    $doctor_id = htmlspecialchars(trim($_GET['doctor_id']));
    $rating_id = htmlspecialchars(trim($_GET['rating_id']));
    //запрос
    $sql = "INSERT INTO coment (name, coment_text, doctor_id, rating_id) VALUES ('".$name."','".$coment_text."','".$doctor_id."','".$rating_id."')";
    $valjund = mysqli_query($connection, $sql);
    // количество ответов на запрос
    $tulemus = mysqli_affected_rows($connection);
    if ($tulemus==1){
        echo "запись успешно добавлена";
        Header("Location: /reviews");
        exit;
       
    }else{
        echo "Запись не добавлена";
    }
    
}

?>
<section class="add_com">

            <div class="com_header"><h1>Добавление отзыва</h1></div><br>

            <form class="com_form" action="" method="get">
                <div class="com_form_div">
                    Как вас зовут: <input class="name_in" type="text" name='name'>
                </div>
                <br>
                <div class="com_form_div_select">
                <td>
                    <select name= 'doctor_id'>
                        <option>Выберите доктора:</option>
                                    <?php $req_d=mysqli_query($connection,"SELECT * FROM `doctor`");
                                        while($r_d=mysqli_fetch_array($req_d)){
                                            echo'   <option value="'.$r_d['doctor_name'].'">'.$r_d['doctor_name'].'</option>';}?>
                    </select>   
                </td>
                </div>
                <br>
                <div class="com_form_div_select">
                <td>
                    <select name= 'rating_id'>
                        <option>Выберите оценку:</option>
                                    <?php $req_r=mysqli_query($connection,"SELECT * FROM `rating`");
                                        while($r_r=mysqli_fetch_array($req_r)){
                                            echo'   <option value="'.$r_r['rating_mark'].'">'.$r_r['rating_mark'].'</option>';}?>
                    </select>   
                </td>
                </div>
                <br>
                <div class="com_form_div_text">
                    Напишите ваше впечатление: <textarea cols="60" rows="5" class="com_text" type="text" name='coment_text'></textarea>
                </div>
                <div class="com_button">
                <input type="submit" value="Отправить">
                </div>
                <br>
            </form>
</section> 


<?php 
include ("footer.php");
exit;
?>

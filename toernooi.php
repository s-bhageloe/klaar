<?php

include_once 'database.php';

$obj = new database();

$users = $obj->getToernooi();
$currentdate = date("Y-m-d");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Overzicht Spelers</title>
    <link rel="stylesheet" href="https:stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

</head>
<body>
<main> 
       <table class="table table-striped" id="overzicht">
           <thead class="thead-dark">
               <tr>
                   <th scope="col">ToernooiID</th>
                   <th scope="col">Omschrijving</th>
                   <th scope="col">Datum</th>
                   <th scope="col">Aanmeldingen</th>
                   <th scope="col">Wedstrijd</th>
                   <th scope="col">Edit</th>
                   <th scope="col">Delete</th>
                   <th scope="col">Uitslagen</th>
               </tr>
           </thead>
           <tbody></tbody>
               <?php foreach ($users as $user): ?>
               <tr>
                   <td><?php echo $user['toernooiID'];?></td>
                   <td><?php echo $user['omschrijving'];?></td>
                   <td><?php echo $user['datum'];?></td>
                   <td class="Aanmeldingen">
                       <a class="btn btn-primary mr-2 btn-sm <?php if($user['datum'] < $currentdate) { echo 'disabled';} ?>" href="aanmelding.php?id=<?php echo $user['toernooiID']; ?>">Aanmeldingen</a>
                   </td>
                   <td class="Wedstrijd">
                       <a class="btn btn-primary mr-2 btn-sm <?php if($user['datum'] < $currentdate) { echo 'disabled';} ?>" href="./wedstrijd/wedstrijd.php?id=<?php echo $user['toernooiID']; ?>">Wedstrijden</a>
                   </td>
                   <td class="Edit">
                       <a class="btn btn-primary mr-2 btn-sm" href="./toernooi/editToernooi.php?id=<?php echo $user['toernooiID']; ?>">Edit</a>
                   </td>      
                   <td class="Delete">
                       <a class="btn btn-danger mr-2 btn-sm" href="./toernooi/deleteToernooi.php?id=<?php echo $user['toernooiID']; ?>">Delete</a>
                   </td> 
                   <td class="Uitslag">
                       <a class="btn btn-warning mr-2 btn-sm" href="./toernooi/uitslagToernooi.php?id=<?php echo $user['toernooiID']; ?>">Uitslagen</a>
                   </td> 
               </tr>

               <?php endforeach; ?>               
                    <td class="Create">
                        <a class="btn btn-success mr-2 btn-sm rounded-pill" href="./toernooi/createToernooi.php?id=">Create</a>
                    </td>
                    <td class="index">
                       <a class="btn btn-danger mr-2 btn-sm rounded-pill" href="index.php">Terug</a>
                   </td>      

           </tbody>
       </table>

   </main>


   <script>
       $(document).ready( function () {
           $('#overzicht').DataTable();
       } );
   </script>
</body>
</html>
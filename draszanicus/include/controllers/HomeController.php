<?php
namespace Draszanicus\controllers;
use Draszanicus\logic\DB;
use Draszanicus\logic\Team;
use Draszanicus\logic\Posts;

use Draszanicus\common\Controller;
use Draszanicus\logic\User;
use Draszanicus\logic\View;

class HomeController extends Controller {
   public function execute()
   {
    
    $info = 'def';
    $view = new View();
    $user = User::getUser();
    $user_id = array_key_exists("id", $user) ? (int)$user["id"] : 0  ;
    
    

    if($user_id){
        $teams = self::getTeams($user_id);
        if(count($teams) > 0){
            $ButtonTeamHightlight = reset($teams)['id'];
          
            $view->assign("teamId" , reset($teams)['id']);
        }else{
            $ButtonTeamHightlight = 0;
            $view->assign("teamId", 0);
            
        }
        
    }else{
        $teams = [];
        $ButtonTeamHightlight = 0;
        $view->assign("teamId", 0);
    }
  
    
    if(!empty($_GET['action'])){
        if($_GET['action'] == 'switchTeam'){
            
            $info = $_GET['teamId'];
            $ButtonTeamHightlight = $_GET['teamId'];
            $view->assign("teamId", $_GET['teamId']);
        }
    }
    if(!empty($_POST['action'])){
        if($_POST['action'] == 'createTeam'){
            $info = 'createTeam';
           $Newteam_id =  $this->createTeam($user_id);
           $view->assign("teamId", $Newteam_id);
            header("Location:/home/switchTeam?action=switchTeam&teamId=" .$Newteam_id);
        }
        else if($_POST['action'] == 'createPost'){
            $info = 'createPost';
            $ButtonTeamHightlight = $_POST['teamIdInput'];
            $this->createPost($user_id);
           
        }
    }
    

    
   
   
    $view->assign("teams", $teams);
    $view->assign("teamButton", $ButtonTeamHightlight);
    $view->assign("info",$info);
    $view->assign("user_id",(int)$user_id);
    if (!empty($teams)) {
        if(!empty($_GET['action']) && $_GET['action'] == 'switchTeam'){
            $view->assign("teamId", $_GET['teamId']);
            $view->assign("posts", self::getPosts($_GET['teamId']));

        }else if(!empty($_POST['action'])&& $_POST['action'] == 'createPost'){
            $view->assign("posts", self::getPosts($_POST['teamIdInput']));
            $view->assign("teamId", $_POST['teamIdInput']);
        }
        else{
            $view->assign("posts", self::getPosts(reset($teams)['id']));
            $view->assign("teamId" , reset($teams)['id']);
        }
     
     } else {
     $view->assign("posts", []); 
     }
    $view->setTemplate("home/Home.tpl");

      

   }
   /// team
   public function createTeam(int $user_id)
   {
        
        if(!empty($_POST['teamName']) && !empty($_POST['teamName']) && !empty($_POST['teamName']) && $user_id > 0){
            $teamName = $_POST['teamName'] ; 
            $teamDescription = $_POST['teamDescription'] ; 
          
            
     
          return Team::createTeam($teamName, $teamDescription, $user_id);
        }
        return 0;
      
   }


   public  function getTeams (int $user_id){
       $userGroups =  Team::getUserTeams($user_id);
       return $userGroups;
   }

   // Posts
   public  function getPosts (int $id){
    $PostsList =  Posts::getPostsFromTeam($id);
    return $PostsList;
    }

    public function createPost($user_id)
    {
         
         if(!empty($_POST['postText'])){
             $postText = $_POST['postText'] ; 
             $teamId = $_POST['teamIdInput'];
             
             
      
             Posts::createPost($teamId, $user_id, $postText);
         }
       
    }

  
}
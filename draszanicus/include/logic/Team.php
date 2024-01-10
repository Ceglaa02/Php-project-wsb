<?php

namespace Draszanicus\logic;

use Draszanicus\logic\DB;

class Team {
    public static function getUserTeams(string $username){
        return DB::get()->query()
        ->select('t.id','t.name','t.description')
        ->from('Teams','t')
        ->innerJoin('t','UserToTeam','ut','t.id = ut.id_team')
        ->innerJoin('ut','Users','u','ut.id_user = u.id')
        ->where('u.username = ?')
        ->setParameter(0,$username)
        ->execute()
        ->fetchAll();

    }

    public static function TeamsSearched(string $prompt){
        return DB::get()->query()
            ->select('t.id', 't.name', 't.description')
            ->from('Teams', 't')
            ->where('t.name LIKE :name')
            ->orWhere('t.description LIKE :description')
            ->setParameters(['name' => "%$prompt%", 'description' => "%$prompt%"])
            ->execute()
            ->fetchAll();
    }
    public static function JoinTeam(string $user_id,string $team_id)
    {
        $teamExists = DB::get()->query()
        ->select('id')
        ->from('Teams')
        ->where('id = ?')
        ->setParameter(0, $team_id)
        ->execute()
        ->fetch();

        if ($teamExists) {
        DB::insert('UserToTeam', [
            'id_user' => $user_id,
            'id_team' => $team_id,
        ]);}
    } 
    public static function LeaveTeam(string $userId,string $teamId)
    {
        $teamExists = DB::get()->query()
        ->delete('UserToTeam')
        ->where('id_user = ? AND id_team = ?')
        ->setParameter(0, $userId)
        ->setParameter(1, $teamId)
        ->execute();
    }  
    public static function isUserJoined($userId, $teamId) {
        $query = DB::get()->query()
            ->select('COUNT(*)')
            ->from('UserToTeam')
            ->where('id_user = ? AND id_team = ?')
            ->setParameter(0, $userId)
            ->setParameter(1, $teamId);

        $result = $query->execute()->fetchOne();

        return $result > 0;
    }
    public static function createTeam(string $name, string $description, int $user_id){

    }
}
<?php
namespace wcf\system\bbcode;
use wcf\system\WCF;
use wbb\data\post\PostList;

/**
* Parses the progressBarBBCode bbcode tag.
*
* @package com.geramy.wcf.progressBarBBCode.bbcode
* @copyright geramy
* @author geramy (mit Hilfe von anderen BBcode Plugins aufgebaut)
* @license GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
* @category WCF
* @parameter
*/
class hidehackBBCode extends AbstractBBCode {
    /**
* @see wcf\system\bbcode\IBBCode::getParsedTag()
*/
    public function getParsedTag(array $openingTag, $content, array $closingTag, BBCodeParser $parser) {
        $debug="";

        $session=WCF::getSession();

        $canSee=false;
        $needLikeCheck=false;

        $debug=print_r($session,true);
//        $session->getPermission("user.user.message.hidehack.canSeeHide");  //auslesen Ob immer sehen darf
//        $session->getUser()->__get("userID") //eingeloggt?
        //LINK LOGIN: /index.php/Login/
        //LINK REGISTER: /index.php/Register/
        $userID=$session->getUser()->__get("userID");
        if($userID==0){
            $isLoggedIn=false;
            $canSee=false;
            $needLikeCheck=false;
        }
        else{
            $isLoggedIn=true;
            if($session->getPermission('user.user.message.hidehack.canSeeHide')){
                $canSee=true;
                $needLikeCheck=false;
            }
            else
            {
                if(hidehack_answer){
                    $threadID=$session->getUser()->__get("objectID");

                    $postList = new PostList();
                    $postList->getConditionBuilder()->add("post.userID = ?", array($userID));
                    $postList->getConditionBuilder()->add("post.threadID = ?", array($threadID));
                    $postList->getObjects();
                    if(count($postList))
                    {
                        $canSee=true;
                    }
                    else
                    {
                        $canSee=false;
                    }
                }
                if(hidehack_like){
                    $needLikeCheck=true;
                }
                else{
                    $needLikeCheck=false;
                }
            }
        }



        WCF::getTPL()->assign("hidehack_likeneeded",$needLikeCheck);
        WCF::getTPL()->assign("hidehack_cansee",$canSee);
        WCF::getTPL()->assign("hidehack_loginmessage",$isLoggedIn);

        WCF::getTPL()->assign("debug",$debug);



        if ($parser->getOutputType() == 'text/html') {
            WCF::getTPL()->assign(array('minimal' => false));
            return WCF::getTPL()->fetch('hidehackBBCodeTag');
        }
        else{
            WCF::getTPL()->assign(array('minimal' => true));
            return WCF::getTPL()->fetch('hidehackBBCodeTag');
        }



    }
}

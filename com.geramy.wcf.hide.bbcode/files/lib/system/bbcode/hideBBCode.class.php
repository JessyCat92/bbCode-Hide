<?php
namespace wcf\system\bbcode;
use wcf\system\WCF;
use wbb\data\post\PostList;
use wcf\system\menu\page\PageMenu;

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
class hideBBCode extends AbstractBBCode {
    /**
* @see wcf\system\bbcode\IBBCode::getParsedTag()
*/
    public function getParsedTag(array $openingTag, $content, array $closingTag, BBCodeParser $parser) {


        $session=WCF::getSession();

        $canSee=false;
        $needLikeCheck=false;

        //LINK LOGIN: /index.php/Login/
        //LINK REGISTER: /index.php/Register/

        $userID=$session->getUser()->__get("userID");
        $activated=$session->getUser()->__get("activationCode");
        if($userID==0 || $activated!=0){
            $isLoggedIn=false;
            $canSee=false;
            $needLikeCheck=false;
        }
        else{
            $isLoggedIn=true;
            if($session->getPermission('user.user.message.hide.canSeeHide')){
                $canSee=true;
                $needLikeCheck=false;
            }
            else
            {
                if(HIDE_ANSWER){
                    $threadID=$session->objectID;

                    $postList = new PostList();
                    $postList->getConditionBuilder()->add("post.userID = ?", array($userID));
                    $postList->getConditionBuilder()->add("post.threadID = ?", array($threadID));
                    $postList->getConditionBuilder()->add("post.isDeleted = ?", array(0));
                    $postList->getConditionBuilder()->add("post.isDisabled = ?", array(0));
                    $postList->readObjects();
                    if(count($postList->getObjects())>0)
                    {
                        $canSee=true;
                    }
                    else
                    {
                        $canSee=false;
                    }
                }
                else
                {
                    $canSee=true;
                }
//                if(HIDE_LIKE){
//                    $needLikeCheck=true;
//                }
//                else{
//                    $needLikeCheck=false;
//                }
            }
        }

        $uid=uniqid("hide");
        WCF::getTPL()->assign("content",$content);
        WCF::getTPL()->assign("hide_id",$uid);
        WCF::getTPL()->assign("hide_likeneeded",$needLikeCheck);
        WCF::getTPL()->assign("hide_cansee",$canSee);
        WCF::getTPL()->assign("hide_loginmessage",$isLoggedIn);

        WCF::getTPL()->assign("hide_link",PageMenu::getInstance()->getLandingPage()->getLink());

        if ($parser->getOutputType() == 'text/html') {
            WCF::getTPL()->assign(array('minimal' => false));
            return WCF::getTPL()->fetch('hideBBCodeTag');
        }
        else{
            WCF::getTPL()->assign(array('minimal' => true));
            return WCF::getTPL()->fetch('hideBBCodeTag');
        }
    }
}

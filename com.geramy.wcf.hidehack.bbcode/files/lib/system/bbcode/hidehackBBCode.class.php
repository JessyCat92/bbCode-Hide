<?php
namespace wcf\system\bbcode;
use wcf\system\WCF;
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
        $debug=print_r($session,true);

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

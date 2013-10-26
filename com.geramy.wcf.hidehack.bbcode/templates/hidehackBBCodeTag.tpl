

<div class="hidehack" id="hidehack_id">
    {if $hidehack_cansee}


    {else}
        {if hidehack_loginmessage==false && hidehack_showregisterlink==true}
            {lang}wcf.bbcode.notsee{/lang} <a href="{$hidehack_link}/index.php/Login/">{lang}wcf.bbcode.registerlogin{/lang}</a>
        {elseif hidehack_loginmessage==false}
            {lang}wcf.bbcode.notsee{/lang}
        {/if}
    {/if}





</div>
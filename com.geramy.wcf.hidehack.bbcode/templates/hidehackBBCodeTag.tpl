<div class="hidehack" id="hidehack_id">
    {if $hidehack_cansee}
        {$content}
    {else}
        {if hidehack_loginmessage==false && hidehack_showregisterlink==true}
            {lang}wcf.bbcode.notsee{/lang} <a href="{$hidehack_link}index.php/Login/">{lang}wcf.bbcode.registerlogin{/lang}</a>
        {elseif hidehack_loginmessage==false}
            {lang}wcf.bbcode.notsee{/lang}
        {elseif HIDEHACK_ANSWER==true}
            {lang}wcf.bbcode.notsee{/lang} {lang}wcf.bbcode.anwser{/lang}
        {/if}
    {/if}
</div>
{if $minimal}
    ...versteckter Inhalt...
{else}
    <div class="hidehack" id="hidehack_id">
        {if $hidehack_cansee}
            <div class="show">
                {$content}
            </div>
        {else}
            <div class="notshow">
                {if $hidehack_loginmessage==false && HIDEHACK_SHOWREGISTERLINK==true}
                    {lang}wcf.bbcode.notsee{/lang} <a href="{$hidehack_link}index.php/Login/">{lang}wcf.bbcode.registerlogin{/lang}</a>
                {elseif $hidehack_loginmessage==false && HIDEHACK_SHOWREGISTERLINK==false}
                    {lang}wcf.bbcode.notsee{/lang}
                {elseif HIDEHACK_ANSWER==true}
                    {lang}wcf.bbcode.notsee{/lang} {lang}wcf.bbcode.anwser{/lang}
                {else}
                    {lang}wcf.bbcode.notsee{/lang}
                {/if}
            </div>
        {/if}
    </div>
{/if}
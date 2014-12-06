{if $minimal}
    ...versteckter Inhalt...
{else}
    <div class="hide" id="{$hide_id}">
        {if $hide_cansee}
            <div class="show" {if $hide_likeneeded==true}data-like-needed="1" style="display:none"{else}data-like-needed="0"{/if}>
                {@$content}
            </div>
            {if $hide_likeneeded==true}
                <div class="notshow">
                    {if $hide_loginmessage==false && HIDE_SHOWREGISTERLINK==true}
                        {lang}wcf.bbcode.hide.notsee{/lang} <a href="{$hide_link}index.php/Login/">{lang}wcf.bbcode.hide.registerlogin{/lang}</a>
                    {elseif $hide_loginmessage==false && HIDE_SHOWREGISTERLINK==false}
                        {lang}wcf.bbcode.hide.notsee{/lang}
                    {elseif HIDE_ANSWER==true && $hide_likeneeded==false}
                        {lang}wcf.bbcode.hide.notsee{/lang} {lang}wcf.bbcode.hide.anwser{/lang}
                    {elseif $hide_likeneeded==true && HIDE_ANSWER==false}
                        {lang}wcf.bbcode.hide.notsee{/lang} {lang}wcf.bbcode.hide.like{/lang}
                    {elseif $hide_likeneeded==true && HIDE_ANSWER==true}
                        {lang}wcf.bbcode.hide.notsee{/lang} {lang}wcf.bbcode.hide.likeanwser{/lang}
                    {else}
                        {lang}wcf.bbcode.hide.notsee{/lang}
                    {/if}
                </div>
            {/if}
        {else}
            <div class="notshow">
                {if $hide_loginmessage==false && HIDE_SHOWREGISTERLINK==true}
                    {lang}wcf.bbcode.hide.notsee{/lang} <a href="{$hide_link}index.php/Login/">{lang}wcf.bbcode.hide.registerlogin{/lang}</a>
                {elseif $hide_loginmessage==false && HIDE_SHOWREGISTERLINK==false}
                    {lang}wcf.bbcode.hide.notsee{/lang}
                {elseif HIDE_ANSWER==true && $hide_likeneeded==false}
                    {lang}wcf.bbcode.hide.notsee{/lang} {lang}wcf.bbcode.hide.anwser{/lang}
                {elseif $hide_likeneeded==true && HIDE_ANSWER==false}
                    {lang}wcf.bbcode.hide.notsee{/lang} {lang}wcf.bbcode.hide.like{/lang}
                {elseif $hide_likeneeded==true && HIDE_ANSWER==true}
                    {lang}wcf.bbcode.hide.notsee{/lang} {lang}wcf.bbcode.hide.likeanwser{/lang}
                {else}
                    {lang}wcf.bbcode.hide.notsee{/lang}
                {/if}
            </div>
        {/if}
    </div>
{/if}

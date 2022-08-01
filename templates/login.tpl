{extends 'htmlHeader.tpl'}

{block content_id}login{/block}

{block body}
    <div class="login_form">
        {if $message && !$error}
            <div class="message">{$message}</div>
            <div id="timer" class="message"><span class="time">5</span> Seconds</div>
        {elseif $message && $error}
            <div class="error">{$message}</div>
        {/if}
        <form enctype="multipart/form-data" action="" method="post">
            <input class="input_field" name="user_email" placeholder="E-Mail">
            <input class="input_field" type="password" name="password" placeholder="Password">
            <button type="submit" name="action" value="login" class="default_button">Login</button>
        </form>
    </div>
{/block}
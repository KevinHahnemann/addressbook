<!DOCTYPE html>
<html lang="en">
    <head>
        <title>PHP/Smarty Address Book</title>

        <link rel="stylesheet" href="/resources/css/styles.css">
    </head>

    <body>
        <div class="header">
            <h1>Address Book</h1>

            {assign var="login_logout_name" value="Login"}
            {assign var="login_logout_value" value="login_form"}

            {if $smarty.session.login}
                {assign var="login_logout_name" value="Logout"}
                {assign var="login_logout_value" value="logout"}
            {/if}

            <div class="buttons">
                <button class="addButton default_button">Add Contact</button>

                <form enctype="multipart/form-data" action="" method="post">
                    <button type="submit" name="action" value="{$login_logout_value}" class="default_button">{$login_logout_name}</button>
                </form>
            </div>
        </div>

        <div id="{block content_id}{/block}">
            {block body}
            {/block}
        </div>

        <script src="/resources/js/jquery.js"></script>
        <script src="/resources/js/utility.js"></script>
    </body>
</html>
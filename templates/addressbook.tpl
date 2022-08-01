{extends 'htmlHeader.tpl'}

{block content_id}addressbook{/block}

{block body}

    {if $smarty.session.login}
        <div class="contact-table">
            <div class="head row">
                <div>Name</div>
                <div>Phone</div>
                <div>E-Mail</div>
                <div>Address</div>
                <div>Group</div>
                <div></div>
            </div>
            {foreach from=$entries item=entry}
                <div class="row">
                    <div class="info-block">{$entry['first_name']} {$entry['last_name']}</div>
                    <div class="info-block">{$entry['phone']}</div>
                    <div class="info-block">{$entry['email']}</div>
                    <div class="info-block address-block">
                        {if array_key_exists('address2', $entry)}
                            <div>{$entry['address1']}</div><div>{$entry['address2']}</div>
                        {else}
                            <div>{$entry['address1']}</div>
                        {/if}
                        <div>{$entry['city']}, {$entry['zipcode']}</div>
                    </div>
                    <div class="info-block">{$entry['contact_group']}</div>
                    <div class="info-block buttons">
                        <button class="editButton default_button" data-id="{$entry['id']}">Edit</button>

                        <form id="deleteContact-{$entry['id']}" class="deleteContact" action="" method="post">
                            <input type="hidden" name="id" value="{$entry['id']}">
                            <button type="submit" class="default_button red" name="action" value="delete">Delete</button>
                        </form>
                    </div>
                </div>

                <div id="editModal-{$entry['id']}" class="editModal">
                    <div class="form-container">
                        <div class="header">
                            <h2>Edit Contact</h2>
                            <button class="closeButton" type="button" data-type="edit">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="editContact-{$entry['id']}" class="editContact" action="" method="post">
                            <input type="hidden" name="id" value="{$entry['id']}">
                            <div class="input-field">
                                <div class="input-block">
                                    <label>First Name</label>
                                    <input name="first_name" type="text" value="{$entry['first_name']}">
                                </div>
                                <div class="input-block">
                                    <label>Last Name</label>
                                    <input name="last_name" type="text" value="{$entry['last_name']}">
                                </div>
                            </div>
                            <div class="input-field three-columns">
                                <div class="input-block">
                                    <label>E-Mail</label>
                                    <input name="email" type="text" value="{$entry['email']}">
                                </div>
                                <div class="input-block">
                                    <label>Phonenumber</label>
                                    <input name="phone" type="text" value="{$entry['phone']}">
                                </div>
                                <div class="input-block">
                                    <label>Contact Group</label>
                                    <select name="contact_group">
                                        <option value="Family" {if $entry['contact_group'] == 'Family'}selected{/if}>Family</option>
                                        <option value="Family" {if $entry['contact_group'] == 'Friends'}selected{/if}>Friends</option>
                                        <option value="Family" {if $entry['contact_group'] == 'Acquaintance'}selected{/if}>Acquaintance</option>
                                        <option value="Family" {if $entry['contact_group'] == 'Business'}selected{/if}>Business</option>
                                    </select>
                                </div>
                            </div>
                            <div class="input-field">
                                <div class="input-block">
                                    <label>Address #1</label>
                                    <input name="address1" type="text" value="{$entry['address1']}">
                                </div>
                                <div class="input-block">
                                    <label>Address #2</label>
                                    <input name="address2" type="text" value="{$entry['address2']}">
                                </div>
                            </div>
                            <div class="input-field">
                                <div class="input-block">
                                    <label>City</label>
                                    <input name="city" type="text" value="{$entry['city']}">
                                </div>
                                <div class="input-block">
                                    <label>Zip Code</label>
                                    <input name="zipcode" type="text" value="{$entry['zipcode']}">
                                </div>
                            </div>
                            <div class="input-field one-column">
                                <div class="input-block">
                                    <label>Notes</label>
                                    <textarea name="notes">{$entry['notes']}</textarea>
                                </div>
                            </div>
                            <div class="submit-button">
                                <button name="action" value="edit" type="submit" class="default_button">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            {/foreach}

        <div id="addModal" class="addModal">
            <div class="form-container">
                <div class="header">
                    <h2>Add Contact</h2>
                    <button class="closeButton" type="button" data-type="add">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="addContact" class="addContact" action="" method="post">
                    <div class="input-field">
                        <div class="input-block">
                            <label>First Name</label>
                            <input name="first_name" type="text">
                        </div>
                        <div class="input-block">
                            <label>Last Name</label>
                            <input name="last_name" type="text">
                        </div>
                    </div>
                    <div class="input-field three-columns">
                        <div class="input-block">
                            <label>E-Mail</label>
                            <input name="email" type="text">
                        </div>
                        <div class="input-block">
                            <label>Phonenumber</label>
                            <input name="phone" type="text">
                        </div>
                        <div class="input-block">
                            <label>Contact Group</label>
                            <select name="contact_group">
                                <option value="Family">Family</option>
                                <option value="Family">Friends</option>
                                <option value="Family">Acquaintance</option>
                                <option value="Family">Business</option>
                            </select>
                        </div>
                    </div>
                    <div class="input-field">
                        <div class="input-block">
                            <label>Address #1</label>
                            <input name="address1" type="text">
                        </div>
                        <div class="input-block">
                            <label>Address #2</label>
                            <input name="address2" type="text">
                        </div>
                    </div>
                    <div class="input-field">
                        <div class="input-block">
                            <label>City</label>
                            <input name="city" type="text">
                        </div>
                        <div class="input-block">
                            <label>Zip Code</label>
                            <input name="zipcode" type="text">
                        </div>
                    </div>
                    <div class="input-field one-column">
                        <div class="input-block">
                            <label>Notes</label>
                            <textarea name="notes"></textarea>
                        </div>
                    </div>
                    <div class="submit-button">
                        <button name="action" value="add" type="submit" class="default_button">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    {else}
        <div>You are not logged in!</div>
    {/if}

{/block}
<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>

    <div>
        <@l.logout />
        <span>
            <a href="/user">User list</a>
        </span>
    </div>
    <div>
        <form method="post" action="/main">
            <input type="text" name="text" placeholder="Type message">
            <input type="text" name="tag" placeholder="Type Tag">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить</button>
        </form>
    </div>

    <div>Список сообщений</div>
    <form action="/main" method="get">
        <input type="text" name="filter" value="${filter!}">
        <button type="submit">Найти</button>
    </form>

    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${(message.author.username)!"&lt;none&gt;"}</strong>
        </div>
    <#else>
    No Message
    </#list>

</@c.page>







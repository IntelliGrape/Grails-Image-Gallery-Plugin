<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Create</title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">List</g:link></span>
</div>
<div class="body">
    <h1>Create</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${image}">
        <div class="errors">
            <g:renderErrors bean="${image}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save" enctype="multipart/form-data">
        <div class="dialog">
            <table>
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="caption">Caption</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: image, field: 'caption', 'errors')}">
                        <g:textField name="caption" value="${image?.caption}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="data">Image</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: data, field: 'image', 'errors')}">
                        <input type="file" id="data" name="data"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save" value="Create"/></span>
        </div>
    </g:form>
</div>
</body>
</html>

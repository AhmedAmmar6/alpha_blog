
<table>
<thead>
<tr>
<th>Title</th>
<th>Description</th>
<th colspan="3" >Actions</th>
</tr>
</thead>

<tbody>
<% @articles.each do |article| %>
    <tr>
        <td><%= article.title %></td>
        <td><%= article.description %></td>
        <td><%= link_to 'View', article_path(article)%></td>
        <td><%= link_to 'Edit', edit_article_path(article)%></td>
        <td><%= link_to 'Delete', article_path(article), data: { turbo_method: :delete, turbo_confirm: "Are you sure?" } %></td>
    </tr>
<% end %>
</tbody>
</table>
<p>
<%= link_to 'Create new Article', new_article_path %> | <%= link_to 'Return Home page', root_path%>
</p>
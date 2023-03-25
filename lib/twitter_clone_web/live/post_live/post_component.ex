defmodule TwitterCloneWeb.PostLive.PostComponent do
   use TwitterCloneWeb, :live_component

   @impl true
   def render(assigns) do
     ~H"""

       <div id={"post-#{@post.id}"} class="post">
         <div class="row">
           <div class="column column-10 post-avatar">
           </div>
           <div class="column column-19 post-body">
             <strong>@<%= @post.username %></strong>
             <br/>
             <%= @post.body %>
           </div>
       </div>
       <div class="row">
           <div class="column post-button">
            <%= link to: "#", "phx-click": "like", "phx-target": @myself do %>
               <svg
                 viewBox="0 0 24 24"
                 width="16"
                 height="13"
                 stroke="currentColor"
                 stroke-width="2"
                 fill="none"
                 stroke-linecap="round"
                 stroke-linejoin="round"
                 class="css-i6dzql">
                 <path d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181"/>
               </svg>
               <% end %>
               <%= @post.likes_count %>
           </div>
           <div class="column post-button">
             <%= link to: "#", "phx-click": "repost", "phx-target": @myself do %>
                  <svg
                    viewBox="0 0 24 24"
                    width="16"
                    height="13"
                    stroke="currentColor"
                    stroke-width="2"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="css-i6zql">
                      <polyline points="17 1 21 5 17 9"/>
                      <path d="M3 9a4 4 0 0 1 4-4h14"/>
                      <polyline points="7 23 3 19 7 15"/>
                      <path d="M5 29V23a4 4 0 0 1 4-4h14"/>
                    </svg>
                <% end %>
              <%= @post.reposts_count %>
           </div>
           <div class="column post-button">
                <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
                <svg
                 viewBox="0 0 24 24"
                 width="16"
                 height="13"
                 stroke="currentColor"
                 stroke-width="2"
                 fill="none"
                 stroke-linecap="round"
                 stroke-linejoin="round"
                 class="css-i6dzql">
                  <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                  <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
               </svg>
            <% end %>
            <%= link to: "#", "phx-click": "delete", "phx-value-id": @post.id do %>
            <svg
                 viewBox="0 0 24 24"
                 width="16"
                 height="13"
                 stroke="currentColor"
                 stroke-width="2"
                 fill="none"
                 stroke-linecap="round"
                 stroke-linejoin="round"
                 class="css-i6dzql">
                 <polyline points="3 6 5 6 21 6"> </polyline>
                  <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2H4a2 2
                  0 0 1 2 2v2"> </path>
                  <line x1="10" y1="11" x2="10" y2="17"></line>
                  <line x1="14" y1="11" x2="14" y2="17"></line>
              </svg>
            <% end %>
           </div>
        </div>
      </div>
     """
   end

   @impl true
   def handle_event("like", _unsigned_params, socket) do
    TwitterClone.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
   end

   @impl true
   def handle_event("repost", _unsigned_params, socket) do
    TwitterClone.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
   end
end

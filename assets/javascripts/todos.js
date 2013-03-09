jQuery(document).ready(function($) {
	$("ul.todos.sortable").nestedSortable({
		cursor: "move",
		items: "li",
		forcePlaceholderSize: true,
		placeholder: "placeholder",
		handle: "div",
		tolerance: "pointer",
		toleranceElement: "> div",
		items: "li",
		listType: "ul",
		tabSize: 20,
		isTree: true,
		stop: function(e, ui) {
			var ajax_url = $(this).data("onchange");
			if (!ajax_url) return;

			$.post(ajax_url, {
				"todo": $(this).nestedSortable("toArray", {startDepthCount: 0})
			});
		}
	});
	//$("ul.todos.sortable :not(input)").disableSelection();
});

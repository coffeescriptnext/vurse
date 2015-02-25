# Global view helpers.
module ApplicationHelper
  SORT_LABELS = {
    created_at_asc: 'Least recently created',
    created_at_desc: 'Most recently created',
    updated_at_asc: 'Least recently updated',
    updated_at_desc: 'Most recently updated'
  }

  def sort_label_for(key, direction)
    SORT_LABELS[:"#{key}_#{direction}"]
  end

  def friendly_timestamp(record)
    if record.updated_at == record.created_at
      time_tag record.created_at, "Created #{time_ago_in_words(record.created_at)} ago"
    else
      time_tag record.updated_at, "Updated #{time_ago_in_words(record.updated_at)} ago"
    end
  end

  def render_markdown(text)
    pipeline = HTML::Pipeline.new(
      [
        HTML::Pipeline::MarkdownFilter,
        HTML::Pipeline::SanitizationFilter
      ],
      gfm: true
    )
    raw(pipeline.to_html(text))
  end

  def render_sanitized(text)
    pipeline = HTML::Pipeline.new([HTML::Pipeline::SanitizationFilter])
    raw(pipeline.to_html(text))
  end
end

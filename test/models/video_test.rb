# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase

  setup do
    StubVideos = Struct.new(:title, :summary, :duration)
    @playlist = [
      StubVideos.new('test_title', 'test_summary', 123)
    ]
  end

  module ClassMethodTest
    def test_fetching_videos
      ::Youtube::Base.stub :playlist_items, @playlist do
        assert_difference('Video.count', @playlist.count) do
          Video.fetching_videos
        end
      end
    end
  end
  
  module InstanceMethodTest
    def test_md_to_html
      input = <<-INPUT
An h1 header
============

Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**, and `monospace`. Itemized lists
look like:

  * this one
  * that one
  * the other one

Note that --- not considering the asterisk --- the actual text
content starts at 4-columns in.
      INPUT
      
      output = <<-OUTPUT
<h1>An h1 header</h1>\n\n<p>Paragraphs are separated by a blank line.</p>\n\n<p>2nd paragraph. <em>Italic</em>, <strong>bold</strong>, and <code>monospace</code>. Itemized lists\nlook like:</p>\n\n<ul>\n<li>this one</li>\n<li>that one</li>\n<li>the other one</li>\n</ul>\n\n<p>Note that --- not considering the asterisk --- the actual text\ncontent starts at 4-columns in.</p>
OUTPUT
      assert_equal(output, videos(:test_md2html).md_to_html(input))
    end
  end
  
  def test_md_to_html!
    # test no field
    # test wrong field
    assert_raise do
      videos(:test_md2html).md_to_html!
      videos(:test_md2html).comment_count = 5
      videos(:test_md2html).md_to_html!(:comment_count)
      videos(:test_md2html).summary = "* abc"
      videos(:test_md2html).md_to_html!("summary")
    end
    
    # test conversion
    videos(:test_md2html).summary_md = "* abc"
    videos(:test_md2html).md_to_html!(:summary_md, :summary) 
    assert_equal("<ul>\n<li>abc</li>\n</ul>\n", videos(:test_md2html).summary)
    
    # confirm that markdown conversion not performed if summary_md not changed
    # not done with this part
    videos(:test_md2html).update(:title => "a new title")
    
  end

  include ClassMethodTest
  include InstanceMethodTest

end

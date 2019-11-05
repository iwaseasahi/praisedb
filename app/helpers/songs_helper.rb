# coding: utf-8
module SongsHelper
  def rubify(str)
    str.
      gsub(Song::KANJI_KANA) { "<ruby>#{$1}<rt>#{$2}</rt></ruby>" }.
      gsub(Song::ENG_KANA) { "<ruby>#{$1}<rt>#{$2}</rt></ruby>" }.
      gsub(Song::KANA_HIRA) { "<ruby>#{$1}<rt>#{$2}</rt></ruby>" }.
      gsub(/^([-A-Z 　'"!,:]+)$/) { "<span class='roman'>#{$1}</span>" }.
      html_safe
  end

  def suppress_ruby(str)
    str.
      gsub(Song::KANJI_KANA) { $1 }.
      gsub(Song::ENG_KANA) { $1 }.
      gsub(Song::KANA_HIRA) { $1 }.
      html_safe
  end

  def link_to_pdf(id)
    pdf_file_path = Pathname(Settings.pdf_directory_path) + "#{id}.pdf"
    if pdf_file_path.exist?
      link_to("PDF", "/pdf/#{id}.pdf")
    else
      ""
    end
  end

  def title(page_title = "PRAISE DATABASE")
    provide :title, page_title.to_s
  end
end

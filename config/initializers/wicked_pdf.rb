# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

WickedPdf.config = {
  # Path to the wkhtmltopdf executable: This usually isn't needed if using
  # one of the wkhtmltopdf-binary family of gems.
  # exe_path: '/usr/local/bin/wkhtmltopdf',
  #   or
  # exe_path: Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf')

  # Needed for wkhtmltopdf 0.12.6+ to use many wicked_pdf asset helpers
  # enable_local_file_access: true,

  # Layout file to be used for all PDFs
  # (but can be overridden in `render :pdf` calls)
  # layout: 'pdf.html',

  # Using wkhtmltopdf without an X server can be achieved by enabling the
  # 'use_xvfb' flag. This will wrap all wkhtmltopdf commands around the
  # 'xvfb-run' command, in order to simulate an X server.
  #
  # use_xvfb: true,
  :exe_path => Gem.bin_path('wkhtmltopdf-binary', 'wkhtmltopdf'),
  :wkhtmltopdf => '/usr/bin/wkhtmltopdf', # この部分は wkhtmltopdf のパスを指定
  :encoding => "utf-8", # エンコーディングを指定
  :use_xvfb => true, # 仮想 X サーバーを使用する場合
  :layout => "pdf_styles.html", # PDF用のレイアウトファイルを指定
  :margin => { :top => 20, :bottom => 20, :left => 20, :right => 20 }, # ページ余白を指定
  :footer => { :center => "Center Text", :font_size => 10 }, # フッターの設定
  :extra => "--no-sandbox --font-family 'IPAゴシック'" # IPAゴシックのフォントファミリーを指定
}
